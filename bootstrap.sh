#!/bin/bash
set -e

DOTFILES_REPO="https://github.com/FiloCara/dotfiles.git"

echo "Checking for prerequisites..."
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git and try again."
    exit 1
fi

TARGET_DIR="$(pwd)/dotfiles"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Cloning dotfiles repository into $TARGET_DIR"
    git clone "$DOTFILES_REPO" "$TARGET_DIR"
else
    echo "Dotfiles repository already exists at $TARGET_DIR"
    exit 1
fi

echo "Running install script..."
bash "$TARGET_DIR/install.sh"

echo "✅ Dotfiles setup completed."
