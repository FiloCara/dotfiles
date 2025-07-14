### ZSH HOME 
export ZSH=$HOME/.zsh

### EDITOR
export EDITOR=nvim

### XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
setopt auto_cd

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/script:$PATH

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

# Expire duplicates first when trimming
setopt HIST_EXPIRE_DUPS_FIRST

# Remove extra spaces in commands before saving
setopt HIST_REDUCE_BLANKS

# Share commands between all open shells
setopt SHARE_HISTORY

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
