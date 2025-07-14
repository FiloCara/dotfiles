# [PageUp] - Up a line of history
bindkey "${terminfo[kpp]}" up-line-or-history

# [PageDown] - Down a line of history
bindkey "${terminfo[knp]}" down-line-or-history

# Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# [Home] - Go to beginning of line
bindkey "${terminfo[khome]}" beginning-of-line

# [End] - Go to end of line
bindkey "${terminfo[kend]}"  end-of-line

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# [Ctrl-r] - Search backward incrementally for a specified string
bindkey '^r' history-incremental-search-backward

# [Ctrl-f] - Start fzf search
bindkey -s '^f' 'tmux-sessionizer.sh\n'

# [Ctrl-x-e] - Edit command line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

