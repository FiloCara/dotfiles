#!/bin/bash

project_dir="$HOME/projects"
selected_project=$(find "$HOME/projects" -maxdepth 3 -type d \
                                           -not \( -path '*/.git' -prune \) \
                                           -not \( -path '*/node_modules' -prune \) \
                                           -not \( -path '*/venv' -prune \) \
                                           -not \( -path '*/.*' -prune \) \
                                           | fzf)

if [[ -n "$selected_project" ]]; then
    # Extract the project name from the selected path
    project_name=$(basename "$selected_project")
    
    echo $selected_project
    # Move into the folder
    # cd $selected_project

    # Check if the tmux session exists
    if tmux has-session -t "$project_name" 2>/dev/null; then
        echo "Attaching to existing session: $project_name"
        # Attach to the existing tmux session
        tmux attach -t "$project_name"
    else
        # Create a new tmux session named after the project
        echo "Creating new session: $project_name"
        tmux new-session -ds "$project_name" -c "$selected_project"
        # tmux select-window -t "$project_name"
        tmux attach -t "$project_name"
    fi
fi

