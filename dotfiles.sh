#!/bin/bash

echo "Updating packages and upgrading";
sudo apt update -y && sudo apt upgrade -y

DOTFILES_DIR="$HOME/.dotfiles"

if ! [ -x "$(command -v git)"]; then
    echo "Installing git";
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
fi

if ! [[ -f "$DOTFILES_DIR/.zshrc" ]]; then
    echo "Installing dotfiles";
    git clone --bare https://github.com/shragath/dotfiles $HOME/.dotfiles


    mkdir -p .config-backup
    config checkout

    if [ $? = 0 ]; then
      echo "Checked out config.";
    else
        echo "Backing up pre-existing dot files.";
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    fi

    config checkout
    config config status.showUntrackedFiles no
fi

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

if ! [ -x "$(command -v nvim)" ]; then
    echo "Installing nvim";
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    cd ~
    git clone https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
fi

if ! [ -x "$(command -v kitty)" ]; then
    echo "Installing kitty";
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if ! [ -x "$(command -v zsh)" ]; then
    echo "Installing zsh";
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
