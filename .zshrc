### ZSH HOME 
export ZSH=$HOME/.zsh

### XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
setopt auto_cd

export PATH="/home/filo/.local/bin:$PATH"
export PATH="/home/filo/.local/script:$PATH"

### --------- History config -------------
export HISTFILE=$HOME/.zsh_history

# Commands loaded in memory
export HISTSIZE=100000

# Commands saved on file
export SAVEHIST=100000

# Do not save duplicates
setopt HIST_IGNORE_ALL_DUPS

# Do not show duplicates on search
setopt HIST_FIND_NO_DUPS

# Ignore commands that start with space
setopt HIST_IGNORE_SPACE

### ------------- ALIASES ---------------
# Load aliases
source $ZSH/aliases.zsh

### ------------KEY BINDINGS ------------
source $ZSH/key-bindings.zsh

### ------------- PLUGINS ---------------
# ZSH autosuggestion
source $ZSH/plugins/zsh-autosuggestions.zsh

### -------------- THEME -----------------
# Load theme
autoload colors && colors
setopt prompt_subst # Expand variables and commands in PROMPT variables
source $ZSH/theme.zsh
