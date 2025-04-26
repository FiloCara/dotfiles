#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME"

# Function to create symlink, preserving the directory structure
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    
    # Ensure the target directory exists
    mkdir -p "$(dirname "$target_file")"
    
    # Check if the target file already exists (could be a regular file or symlink)
    if [ -e "$target_file" ] || [ -L "$target_file" ]; then
        local backup_file="${target_file}.backup.$(date +%Y%m%d%H%M%S)"
        echo "Existing file found at $target_file, backing up to $backup_file"
        mv "$target_file" "$backup_file"
    fi
    
    ln -s "$source_file" "$target_file"
    echo "Created symlink: $target_file -> $source_file"
}

# Export the function so it's available in subshells
export -f create_symlink
export TARGET_DIR
export DOTFILES_DIR

# Find all files in the dotfiles directory and create corresponding symlinks
find $DOTFILES_DIR -type f \
    ! -name "install.sh" \
    ! -name "clean.sh" \
    ! -name "bootstrap.sh" \
    ! -name "Readme.md" \
    ! -path '*/.git/*' \
    -exec bash -c 'create_symlink "$0" "'$TARGET_DIR'/${0#'$DOTFILES_DIR'/}"' {} \;

echo "✅ Symlinks creation completed."

