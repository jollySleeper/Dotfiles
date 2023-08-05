#!/bin/sh

HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
#export LC_ALL=en_US.UTF-8

# For Fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --type l --hidden --color=never'
#export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND='fdfind --type d --type l --hidden . --color=never'
export FZF_ALT_C_OPTS="--preview 'exa -aT | head -50'"

# For Zoxide
export _ZO_FZF_OPTS="--height=40% --reverse"
