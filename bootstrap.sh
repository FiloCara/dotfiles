#!/bin/bash

DOTFILES_REPO=""
DOTFILES_DIR="$HOME/dotfiles"

echo "Checking for prerequisites..."
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git and try again."
    exit 1  # Exit script if git is not installed
fi

# Clone the dotfiles repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository to $DOTFILES_DIR"
    git clone $DOTFILES_REPO $DOTFILES_DIR
else
    echo "Dotfiles repository already exists at $DOTFILES_DIR"
fi

# Execute the install script from the dotfiles repository
echo "Running install script..."
bash "$DOTFILES_DIR/install.sh"

echo "Dotfiles setup completed."
