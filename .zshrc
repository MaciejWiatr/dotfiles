export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Git commands
alias gpf="git push --force-with-lease"
alias gm="git merge"

# Runtimes commands
alias b="bun"
alias bd="bun run dev"alias pip="pip3"
alias python="python3"

# Docker commands
alias dcd="docker compose down"
alias dcu="docker compose up"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"

alias dev="cd ~/Apps"

function tat {
  name=$(basename `pwd` | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}
