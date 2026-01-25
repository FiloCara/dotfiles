#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME"

# Function to remove symlink, preserving the directory structure
remove_symlink() {
    local target_file="$1"
    
    # Check if the target is a symlink
    if [ -L "$target_file" ]; then
        rm "$target_file"
        echo "Removed symlink: $target_file"
    fi
}

# Find all files in the dotfiles directory
# For each, attempt to remove a corresponding symlink in the home directory
find "$DOTFILES_DIR" -type f -print0 | while IFS= read -r -d '' dotfile; do
    target="$TARGET_DIR/${dotfile#$DOTFILES_DIR/}"
    remove_symlink "$target"
done

echo "✅ Symlinks removal completed."
