### LS
alias ls="ls --color=auto"

# Replace ls and la with exa
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

### GREP
EXC_FOLDERS={.git}
alias grep="grep --color=auto --exclude-dir=$EXC_FOLDERS"

### CAT
# Replace cat with batcat
if [ -x "$(command -v batcat)" ]; then
    alias cat="batcat"
fi

### GIT
alias gs='git status'

# function parse_git_branch() {
#     git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
# }

### PYTHON

# Start HTTP server in current directory
alias pyserver="python3 -m http.server"

function pyclean() {
  find "${@:-.}" -type f -name "*.py[co]" -delete
  find "${@:-.}" -type d -name "__pycache__" -delete
  find "${@:-.}" -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".pytest_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".ruff_cache" -exec rm -r "{}" +
}

# VENV utilities

# Activate a the python virtual environment specified.
# If none specified, use 'venv'.
function vrun() {
  local name="${1:-venv}"
  local venvpath="${name:P}"

  if [[ ! -d "$venvpath" ]]; then
    echo >&2 "Error: no such venv in current directory: $name"
    return 1
  fi

  if [[ ! -f "${venvpath}/bin/activate" ]]; then
    echo >&2 "Error: '${name}' is not a proper virtual environment"
    return 1
  fi

  . "${venvpath}/bin/activate" || return $?
  echo "Activated virtual environment ${name}"
}

# Create a new virtual environment, with default name 'venv'.
function mkv() {
  local name="${1:-venv}"
  local venvpath="${name:P}"

  python3 -m venv "${name}" || return
  echo >&2 "Created venv in '${venvpath}'"
  vrun "${name}"
}

### NVM
function load_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

### FZF
alias fzf="fzf --preview 'batcat --color=always {}'"
