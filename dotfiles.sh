#!/bin/bash

# curl -L https://raw.githubusercontent.com/shragath/dotfiles/main/dotfiles.sh | bash
cd $HOME

# Exit immediately if a command exits with a non-zero status
set -e

declare -A package_managers=(
    ["ubuntu"]="apt-get" ["debian"]="apt-get"
    ["arch"]="pacman"   ["manjaro"]="pacman"
    ["fedora"]="dnf"    ["centos"]="yum" ["rhel"]="yum"
)

declare -A managers_updater=(
    ["ubuntu"]="update -y" ["debian"]="update -y"
    ["arch"]="-Syu --noconfirm"   ["manjaro"]="-Syu --noconfirm"
)

declare -A managers_installer=(
    ["ubuntu"]="install -y" ["debian"]="install -y"
    ["arch"]="-S --noconfirm"   ["manjaro"]="-S --noconfirm"
)

declare -A managers_tools=(
    ["ubuntu"]="ninja-build gettext cmake curl build-essential git" ["debian"]="ninja-build gettext cmake curl build-essential git"
    ["arch"]="--needed base-devel cmake ninja curl git"   ["manjaro"]="--needed base-devel cmake ninja curl git"
)

# Get distro ID
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    distro="${ID:-unknown}"
elif command -v lsb_release &>/dev/null; then
    distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
else
    distro="unknown"
fi

command_exists() {
    local cmd="$1"
    # command -v writes the path to standard output if found,
    # we redirect stdout/stderr to /dev/null to keep things clean,
    # and we check the exit status ($?)
    if command -v "$cmd" &> /dev/null; then
        echo "Command '$cmd' already installed."
        return 0 # Success
    else
        cd $HOME
        echo "Command '$cmd' not found."
        echo "Installing with command $2"
        eval $2
        # Check if the installation command itself succeeded
        if [ $? -eq 0 ]; then
            echo "Installation complete."
        else
            echo "Installation failed."
        fi
        cd $HOME
        return 1 # Failure
    fi
}

# Check and use package manager
if [[ -n "${package_managers[$distro]}" ]]; then
    manager="${package_managers[$distro]}"
    updater="${managers_updater[$distro]}"
    installer="${managers_installer[$distro]}"
    tools="${managers_tools[$distro]}"
    echo "Using $manager for $distro"

    # Run your commands:
    echo "sudo $manager $updater"
    sudo $manager $updater
    # sudo $manager upgrade -y
    echo "sudo $manager $installer $tools"
    sudo $manager $installer $tools
    echo "Checking/installing rustup"
    RUST_INSTALL_CMD="curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
    command_exists "rustup" "$RUST_INSTALL_CMD"

    if [[ $manager == "pacman" ]]; then
        echo "Checking/installing yay"
        YAY_INSTALL_CMD="git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
        command_exists "yay" "$YAY_INSTALL_CMD"

        echo "Checking/installing wezterm"
        WEZTERM_INSTALL_CMD='yay wezterm-git'
        command_exists "wezterm" "$WEZTERM_INSTALL_CMD"
    fi

    echo "Checking/installing zsh/oh my zsh"
    ZSH_INSTALL_CMD="sudo $manager $installer zsh && curl -fsSL https://raw.githubuse.rcontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    command_exists "zsh" "$ZSH_INSTALL_CMD"

    echo "Checking/installing tmux"
    TMUX_INSTALL_CMD="sudo $manager $installer tmux"
    command_exists "tmux" "$TMUX_INSTALL_CMD"

    echo "Checking/installing nvim nigthly"
    NVIM_INSTALL_CMD="git clone https://github.com/neovim/neovim && cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install"
    command_exists "nvim" "$NVIM_INSTALL_CMD"
    echo "installation path: $INSTALLATION_PATH"
else
    echo "Unsupported distribution: $distro" >&2
    exit 1
fi

# The local directory where the repo will be cloned
DOTFILES_DIR="$HOME/dotfiles"
# A backup directory for existing files
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)"
# Files/directories to ignore during symlinking (e.g., this script itself, the .git dir, READMEs)
IGNORE_FILES=("dotfiles.sh" "README.md" "LICENSE" ".git" ".gitignore" ".config")
# Repo
DOTFILES_REPO="https://github.com/shragath/dotfiles"
# ---------------------

echo "Starting dotfiles installation..."

# 1. Clone the repository
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory '$DOTFILES_DIR' already exists. Pulling latest changes."
    git -C "$DOTFILES_DIR" pull
else
    echo "Cloning dotfiles repository from $DOTFILES_REPO into $DOTFILES_DIR"
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# 2. Create backup directory
if ! [ -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi
echo "Existing files will be backed up to $BACKUP_DIR"

# Function to check if a file should be ignored
is_ignored() {
    local filename=$(basename "$1")
    for ignore in "${IGNORE_FILES[@]}"; do
        # echo "$parent_name == $ignore"
        if [[ "$filename" == "$ignore" ]]; then
            return 0 # True, ignored
        fi
    done
    return 1 # False, not ignored
}

# 3. Create symbolic links
echo "Creating symbolic links..."
# Find all files and directories in the dotfiles repo (excluding the root itself)
# and iterate over them
fd -H -d 2 --full-path "$DOTFILES_DIR" . | while read source_path; do
filename=$(basename "$source_path")
# Get parent directory name
parent_dir=$(dirname "$source_path")
parent_name="$(basename "$parent_dir")/"
if ! [[ ".config" == $(basename "$parent_dir") ]]; then
    parent_name=""
fi
echo "$source_path"
target_path="$HOME/$parent_name$filename"

if is_ignored "$source_path"; then
    echo "  -> Skipping ignored file/directory: $filename"
    continue
fi

    # If the target already exists in the home directory
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        echo "  -> Backing up existing file/symlink: $target_path to $BACKUP_DIR"
        # mv "$target_path" "$BACKUP_DIR/"
    fi

    # Create the symbolic link
    echo "  -> Linking: $source_path to $target_path"
    # -s: symbolic link; -f: force overwrite; -n: treat LINK_NAME as normal file if TARGET is a directory (prevents linking into the directory itself)
    # ln -sfn "$source_path" "$target_path"
done

echo "Dotfiles installation complete!"
