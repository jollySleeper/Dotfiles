#!/bin/sh

HISTSIZE=1000000
SAVEHIST=1000000

# TODO: Add checks for Commands used in Exports

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export PAGER="bat"
#export LC_ALL=en_US.UTF-8

# Paths
## Local Directory
export PATH="$HOME/.local/bin":$PATH
## Rust Builds
export PATH="$HOME/.cargo/bin":$PATH

# For Fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --type l --hidden --color=never'
#export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND='fdfind --type d --type l --hidden . --color=never'
export FZF_ALT_C_OPTS="--preview 'exa -aT | head -50'"

# For Zoxide
export _ZO_FZF_OPTS="--height=40% --reverse"

# For Less: Avoding it from saving History at ~
export LESSHISTFILE="$HOME/.config/less/less-history"
