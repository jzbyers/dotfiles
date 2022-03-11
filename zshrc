# ==============================================================================
# ENV
# ==============================================================================

# Homebrew
export PATH="$PATH:/opt/homebrew/bin"

# Go (using 1.17 currently)
export PATH=$PATH:$HOME/go/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Java
if command -v jenv &> /dev/null
then
  eval "$(jenv init -)"
fi

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Node
export NVM_DIR="$HOME/.nvm"
# load nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# load nvm bash completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Vim
export VISUAL="vim"
export EDITOR="vim"
export PATH="$PATH:/Users/jackbyers/src/neovim/build/bin"

# Python
# Enable pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
export PYTHON_2_VERSION="2.7.16"
export PYTHON_3_VERSION="3.7.4"
export CLOUDSDK_PYTHON=python3
# Disable prompt change, which is being deprecated by pyenv-virtualenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# Add poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Local Tools, like Python's black formatter and Rust's analyzer
export PATH=$PATH:$HOME/.local/bin

# Postgres
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# FZF Settings
# Use `bat` for preview in neovim ctrl-p
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
# Use `fd` instead of the default `find` command to traverse the file system
# while respecting .gitignore.
export FZF_DEFAULT_COMMAND="fd --type f"

# Updates PATH for the Google Cloud SDK.
source /Users/jackbyers/src/google-cloud-sdk/path.zsh.inc
# Enables zsh completion for gcloud.
source /Users/jackbyers/src/google-cloud-sdk/completion.zsh.inc

# Add Google Cloud SQL Proxy to path. The gcloud directory contains the
# executable.
export PATH=$PATH:/Users/jackbyers/gcloud

# ==============================================================================
# ALIAS
# ==============================================================================
alias ..='cd ..'
alias ...='cd ../..'

# use nvim if it exists
if command -v nvim 2>&1 >/dev/null; then
  alias vim=nvim
fi

# Make directory and parent directories
alias mkdir="mkdir -pv"

# Git
alias g='git'
alias gs='g status -s'
alias ga='g add .'
alias gc='g commit'
alias gp='g push'
alias gl='g l'

# Search process table (ex. psg zsh)
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Grep
alias grep='grep --color=auto'

# Tmux
# Attaches tmux to the last session, or creates a new session with one window
alias t='tmux attach || tmux new-session\;'
# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'
# Creates a new session
alias tn='tmux new-session'

# Use exa for listing files and directories
if command -v exa &> /dev/null
then
    alias exa='exa --group-directories-first'
    alias e='exa -l --no-permissions --no-filesize --no-user --no-time'
    alias ea='exa -la'
fi

# terraform
alias tf=terraform


# ==============================================================================
# EDITOR
# ==============================================================================

# Jetbrains
alias idea='open -na "IntelliJ IDEA.app"'
alias gol='open -na "GoLand.app"'
alias cl='open -na "CLion.app"'
alias pc='open -na "PyCharm.app"'
alias ws='open -na "WebStorm.app"'
alias rd='open -na "Rider.app"'

# Use brew-installed ctags instead of the version that comes with XCode
alias ctags="`brew --prefix`/bin/ctags"

# vi-mode for line movement
#
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
  VI_KEYMAP=main
  zle accept-line
}

zle -N vi-accept-line

bindkey -v

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# bind jj to vi command mode
bindkey jj vi-cmd-mode

# ==============================================================================
# FUNCTIONS
# ==============================================================================

# The most magical way to checkout an existing git branch
function gb() {
    git checkout $(git branch --sort=-committerdate --format="%(committerdate:short) %(refname:short)" | fzf --reverse | cut -d\  -f2)
}

# uuid2pb function for representing UUIDs as "json protobuf" i.e. what grpcurl / prototool expects
function uuid2pb() {
    python -c 'import uuid; import base64; print("{\"uuid\": \"" + base64.b64encode(uuid.UUID("'"$1"'").bytes).decode("ascii") + "\"}")'
}

# pprint pretty-prints JSON data in Python
function pprint() {
    /usr/bin/python -c 'import json; print(json.dumps('$1', indent=2))'
}

# Search for something in your history
# Usage: h <something>
function h() {
    # check if we passed any parameters
    if [ -z "$*" ]; then
        # if no parameters were passed print entire history
        history 1
    else
        # if words were passed use it as a search
        history 1 | egrep --color=auto "$@"
    fi
}

# Helpful logging function (info, warn, error, fatal)
function log(){
    local level msg hl
    level="$(tr '[:lower:]' '[:upper:]' <<< "${@:1:1}")"
    msg=("${@:2}")
    case "${level}" in
        FATAL|ERR*) hl="%F{red}" ;;
        WARN*) hl="%F{yellow}" ;;
        DEBUG) hl="%F{cyan}" ;;
    esac
    print -P "${hl}*** ${level}: ${msg[*]}%f" 1>&2
    if [[ "${level}" == "FATAL" ]]; then
        # return rather than exit in interactive mode
        if [[ "${-}" =~ 'i' ]] ; then return 1; else exit 1; fi
    fi
}

# Functions for Python virtual env management

function check_dev_env(){
  if ! type -p python3 >/dev/null; then
    log fatal "python3 not installed. Maybe try 'brew install python'?"
  fi
  if ! type -p virtualenv >/dev/null; then
    log fatal "virtualenv not installed. Maybe try 'pip install virtualenv'?"
  fi
}

function setup_venv(){
  SOURCE_VERSION="$1"
  VENV_NAME="$2"
  check_dev_env
  if ! [ -d "${PYENV_ROOT}/versions/${SOURCE_VERSION}" ]; then
    log warning "Python version ${SOURCE_VERSION} is not yet installed; installing..."
    pyenv install "${SOURCE_VERSION}"
  fi
  if ! [ -f "${PYENV_ROOT}/versions/${VENV_NAME}/bin/activate" ]; then
    log info "Setting up python2 environment"
    pyenv virtualenv "${SOURCE_VERSION}" "${VENV_NAME}"
  fi
}

function py2(){
  if [ "${VIRTUAL_ENV}" ]; then
    source deactivate || deactivate
  fi
  if ! [ -d "${PYENV_ROOT}/versions/${PYTHON_2_VERSION}/envs/py2" ]; then
    setup_venv "${PYTHON_2_VERSION}" py2
  fi
  log info "Switching python environment to python "${PYTHON_2_VERSION}" (${PYENV_ROOT}/versions/py2)"
  pyenv activate py2
}

function py3(){
  if command -pv deactivate >/dev/null; then
    source deactivate || deactivate
  fi
  if ! [ -d "${PYENV_ROOT}/versions/${PYTHON_3_VERSION}/envs/py3" ]; then
    setup_venv "${PYTHON_3_VERSION}" py3
  fi
  log info "Switching python environment to python "${PYTHON_3_VERSION}" (${PYENV_ROOT}/versions/py3)"
  pyenv activate py3
}

function ensure_venv(){
  setup_venv "${PYTHON_2_VERSION}" py2
  setup_venv "${PYTHON_3_VERSION}" py3
}

function repy(){
  if [ "$1" = "--nuke" ]; then
    rm -rf "${PYENV_ROOT}"
    pyenv_init
  fi
  log info "resetting python virtualenvs"
  rm -rf "${PYENV_ROOT}/versions/py2"
  rm -rf "${PYENV_ROOT}/versions/${PYTHON_2_VERSION}/envs/py2"
  rm -rf "${PYENV_ROOT}/versions/py3"
  rm -rf "${PYENV_ROOT}/versions/${PYTHON_3_VERSION}/envs/py3"
  ensure_venv
}

function pyenv_init(){
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}


# ==============================================================================
# ZSH CONFIG
# ==============================================================================

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt inc_append_history

# Ignore duplication command history list
setopt hist_ignore_dups 
setopt hist_ignore_space
setopt hist_verify

# Don't import commands from the history file during a shell session. Commands
# from the history file will be loaded on shell startup, but from that point
# forward only commands in that shell will be added to the local history.
setopt nosharehistory

# https://superuser.com/questions/479600/how-can-i-prevent-tmux-exiting-with-ctrl-d
# https://superuser.com/questions/1243138/why-does-ignoreeof-not-work-in-zsh/1309966
setopt ignore_eof
export IGNOREEOF=10
zle -N bash-ctrl-d
bindkey '^D' bash-ctrl-d

# ==============================================================================
# ZSH PLUGINS
# ==============================================================================

# zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#367c46"

# git-autocomplete
autoload -Uz compinit && compinit

# ==============================================================================
# ZSH PROMPT
# ==============================================================================
# Load colors (red, blue, green, cyan, yellow, magenta, black, white)
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b) '

# Set up the prompt (with git branch name)
# %(?.√.?%?)    if the return code ? is 0, show check mark, else show ?%?
# %?            exit code of previous command
# %1~           current working dir, shortening home to ~, show only last 1 element
# %#            with root privileges, % otherwise
# %B %b         start/stop bold
# %F{...}       text foreground color (see table: https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html)
# %f            reset to default text color

setopt PROMPT_SUBST

# Prompt without check mark, with new line for input
PROMPT='%B%F{magenta}%2~%f%b %F{blue}${vcs_info_msg_0_}%f
'$'\U25CF'' '

# ==============================================================================
# Last but not least
# ==============================================================================

# source aliases, functions, etc. for Oden
sources=(
  "${HOME}/.zshrc_oden"
)

for f in "${sources[@]}"; do
  if [ -f "${f}" ]; then
    # shellcheck disable=SC1090
    . "${f}"
  else
    if [ "${DEBUG}" ]; then
      echo "*** WARNING: file ${f} does not exist" >&2
    fi
  fi
done

pyenv_init

