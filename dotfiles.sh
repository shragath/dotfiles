#!/bin/bash

# Install Config
# curl -L https://raw.githubusercontent.com/shragath/dotfiles/main/dotfiles.sh | bash
echo "Updating packages and upgrading";
cd ~
sudo apt update -y && sudo apt upgrade -y

DOTFILES_DIR="$HOME/.dotfiles"

if ! command -v git &> /dev/null; then
    echo "Git not found, installing git";
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
fi

config() {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

if ! [[ -d "$DOTFILES_DIR" ]]; then
    echo "Installing dotfiles";
    git clone --bare https://github.com/shragath/dotfiles $HOME/.dotfiles

    config checkout

    config checkout
    config config status.showUntrackedFiles no
fi

if ! command -v nvim &> /dev/null; then
    echo "Installing nvim";
    # Install build tools
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    cd ~
    git clone https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
fi

if ! command -v kitty &> /dev/null; then
    echo "Installing kitty";
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Create a symbolic link to add kitty to PATH
    mkdir ~/.local/bin
    echo 'PATH="$HOME/.local/bin/:$PATH"' >> ~/.zshrc
    # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
    # your system-wide PATH)
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty.desktop file(s)
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
    sudo update-alternatives --config x-terminal-emulator
fi

if ! command -v zsh &> /dev/null; then
    echo "Installing zsh";
    sudo apt install zsh -y
    echo "Installing oh-my-zsh";
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)
fi
