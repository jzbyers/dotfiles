# # ==============================================================================
# # ENV
# # ==============================================================================

# # Homebrew on Apple Silicon
# # Installation instructions: https://docs.brew.sh/Installation
# # /usr/local for Intel/AMD binaries
# # /opt/homebrew for ARM binaries
# export PATH="$PATH:/opt/homebrew/bin"

# # Go
# # Go version
# export GOROOT="/Users/jackbyers/sdk/go1.18.9"
# export PATH=$PATH:$GOROOT/bin
# # Add installed binaries to PATH
# export PATH="$PATH:$HOME/go/bin"

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# # Java
# if command -v jenv &> /dev/null
# then
#   eval "$(jenv init -)"
# fi

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# # Node
# export NVM_DIR="$HOME/.nvm"
# # load nvm
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# # load nvm bash completion
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Vim
export VISUAL="vim"
export EDITOR="vim"
export PATH="$PATH:/Users/jackbyers/src/neovim/build/bin"

# # Local Tools, like Python's black formatter and Rust's analyzer
# export PATH=$PATH:$HOME/.local/bin

# # Postgres
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# FZF Settings
# Use `bat` for preview in neovim ctrl-p
#export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
# Use `fd` instead of the default `find` command to traverse the file system
# while respecting .gitignore.
export FZF_DEFAULT_COMMAND="fd --type f"

# # Updates PATH for the Google Cloud SDK.
# source /Users/jackbyers/src/google-cloud-sdk/path.zsh.inc
# # Enables zsh completion for gcloud.
# source /Users/jackbyers/src/google-cloud-sdk/completion.zsh.inc

# # Add Google Cloud SQL Proxy to path. The gcloud directory contains the
# # executable.
# export PATH=$PATH:/Users/jackbyers/gcloud

# # https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
# export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# ==============================================================================
# ALIAS
# ==============================================================================
alias ..='cd ..'
alias ...='cd ../..'

# Switching architectures
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

# use nvim if it exists
if command -v nvim 2>&1 >/dev/null; then
  alias vim=nvim
fi

# Make directory and parent directories
alias mkdir="mkdir -pv"

# Git
alias g='git'
alias gs='g status'
alias ga='g add .'
alias gc='g commit'
alias gp='g push'
alias gl='g l'
alias gf='g fetch'

# Search process table (ex. psg zsh)
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Grep
alias grep='grep --color=auto'

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
alias fl='open -na "Fleet.app"'
alias as='open -na "Android Studio.app"'

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

# Tmux
# Attaches tmux to the last session, or creates a new session with one window
function t() { tmux new-session -A -s $1 } 
# Attaches tmux to a session (example: ta portal)
function ta() { tmux attach -t $1 }
# Kills a named session
function tk() { tmux kill-session -t $1 }
# Lists sessions
function tl() { tmux list-sessions }

# The most magical way to checkout an existing git branch
function gb() {
    git checkout $(git branch --sort=-committerdate --format="%(committerdate:short) %(refname:short)" | fzf --reverse | cut -d\  -f2)
}

# Force delete unmerged git branches
function gclean() {
    git branch --merged | egrep -v "(^\*|main|master|dev|develop)" | xargs git branch -d
}

# Run gofmt on changed files
function ggofmt() {
    for x in `git status -s|awk '{ print $2}'`; do gofmt -w $x; done
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

# Get logs from Kubernetes pod
function klog() {
    k logs $(k get pods | grep $1 |  head -n 1 | awk '{print $1;}') $1
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

# # ==============================================================================
# # Last but not least
# # ==============================================================================

# # source aliases, functions, etc. for Oden
# sources=(
#   "${HOME}/.zshrc_oden"
# )

# for f in "${sources[@]}"; do
#   if [ -f "${f}" ]; then
#     # shellcheck disable=SC1090
#     . "${f}"
#   else
#     if [ "${DEBUG}" ]; then
#       echo "*** WARNING: file ${f} does not exist" >&2
#     fi
#   fi
# done

# pyenv_init


