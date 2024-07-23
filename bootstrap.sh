#!/bin/bash

DOTFILES_REPO="https://github.com/FiloCara/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

install_software() {
    local software_name=$1
    local install_cmd=$2

    # Check if the software is not already installed
    if ! command -v $software_name &> /dev/null; then
        read -p "Do you want to install $software_name? (y/n) " answer </dev/tty
        echo 
        case $answer in
            [Yy]* )
                echo "Installing $software_name..."
                eval $install_cmd
                ;;
            * )
                echo "$software_name will not be installed."
                ;;
        esac    
    else "$software_name is already installed."
    fi
}

echo "Checking for prerequisites..."
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git and try again."
    exit 1
fi

# Clone the dotfiles repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository to $DOTFILES_DIR"
    git clone $DOTFILES_REPO $DOTFILES_DIR
else
    echo "Dotfiles repository already exists at $DOTFILES_DIR"
    exit 1
fi

# Execute the install script from the dotfiles repository
echo "Running install script..."
bash "$DOTFILES_DIR/install.sh"

echo "Dotfiles setup completed."

install_software "exa"  "sudo apt-get install -y exa"
install_software "nvim" "sudo apt-get install -y neovim"
install_software "zsh"  "sudo apt-get install -y zsh"
install_software "tmux" "sudo apt-get install -y tmux"
