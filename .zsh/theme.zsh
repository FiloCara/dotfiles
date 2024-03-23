update_branch() {
    # Check if the current directory is a git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Get the current branch name
        local branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
        # Check for uncommitted changes
        if [[ -n $(git status -s) ]]; then
            # If there are uncommitted changes, set the 'dirty' symbol
            local dirty="%{$fg[yellow]%} ✗"
        else
            local dirty=""
        fi
        # Display the branch name with blue parentheses and red text, and the 'dirty' symbol
        echo "%{$fg_bold[blue]%}(%{$reset_color%}%{$fg_bold[red]%}$branch%{$fg_bold[blue]%})$dirty%{$reset_color%} "
    fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} "
PROMPT+='$(update_branch)'
