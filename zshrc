# # ==============================================================================
# # ENV
# # ==============================================================================

# # Homebrew on Apple Silicon
# # Installation instructions: https://docs.brew.sh/Installation
# # /usr/local for Intel/AMD binaries
# # /opt/homebrew for ARM binaries
export PATH="$PATH:/opt/homebrew/bin"

# Alacritty CLI
export PATH="$PATH:${HOME}/src/alacritty/target/release/osx/Alacritty.app/Contents/MacOS"

# Rust
export PATH=$PATH:${HOME}/.cargo/bin

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# Rails
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"

# Python Poetry
export PATH="${HOME}/.local/bin:$PATH"

# Go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH=${GOBIN}:${PATH}

# # Java
# if command -v jenv &> /dev/null
# then
#   eval "$(jenv init -)"
# fi
export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
export PATH="${JAVA_HOME}/bin:${PATH}"

# jenv for managing Java versions
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# # Node
# export NVM_DIR="${HOME}/.nvm"
# # load nvm
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# # load nvm bash completion
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Vim
export VISUAL="nvim"
export EDITOR="nvim"
export PATH="$PATH:${HOME}/src/neovim/build/bin"

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

# Neovim instead of vim
alias vim="nvim"

# Git
alias g='git'
alias gs='g status'
alias ga='g add .'
alias gc='g commit'
alias gp='g push'
alias gl='g l'
alias gf='g fetch'

alias grep='grep --color=auto'
alias ssh="TERM=xterm-256color ssh"

# Search process table (ex. psg zsh)
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# terraform
alias tf=terraform

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ==============================================================================
# EDITOR
# ==============================================================================

# Jetbrains
alias idea='open -na "IntelliJ IDEA Ultimate.app"'
alias gol='open -na "GoLand.app"'
alias cl='open -na "CLion.app"'
alias pc='open -na "PyCharm Professional Edition.app"'
alias ws='open -na "WebStorm.app"'
alias rd='open -na "Rider.app"'
alias fl='open -na "Fleet.app"'
alias as='open -na "Android Studio.app"'

# Sublime Text
alias subl='open -na "Sublime Text.app"'

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

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# bind jj to vi command mode
bindkey jj vi-cmd-mode

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

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

# psql into a postgres database
function pgin() {
  vared -p 'Enter host (default=localhost): ' -c host
  host=${host:-localhost}

  vared -p 'Enter db   (default=postgres): ' -c db
  db=${db:-postgres}

  vared -p 'Enter user (default=postgres): ' -c user
  user=${user:-postgres}

  vared -p 'Enter port (default=5432): ' -c port
  port=${port:-5432}

  psql -h "$host" -p "$port" -d "$db" -U "$user"
}

# Get logs from Kubernetes pod
function klog() {
    k logs $(k get pods | grep $1 |  head -n 1 | awk '{print $1;}') $1
}

# Set up directory marking commands.
# See: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# And: https://news.ycombinator.com/item?id=6229001
export MARKPATH=${HOME}/.marks
function goto {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

# ==============================================================================
# ZSH CONFIG
# ==============================================================================

## Command history configuration
HISTFILE=${HOME}/.zsh_history
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

# source other things, like aliases, functions, etc. for Oden
sources=(
  "${HOME}/.oden_profile"
  "${HOME}/.oden_env_local"
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

