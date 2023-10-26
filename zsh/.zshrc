# For Zap Zsh Plugin Manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History Related Settings
HISTFILE=$HOME/.config/zsh/zsh_history
# The meaning of these options can be found in man page of `zshoptions`.
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data inc_append_history

# Importing/Sourcing Files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "jollySleeper/zapped-distro-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
# TODO: Fork this Plugin for Modifications
plug "zap-zsh/exa"
## For Skim in Zsh
## Decided to remove after installing
## As Fzf is faster and consumes less RAM
    #plug "zap-zsh/my-skim-plugin"
## For my Custom Fzf in Zsh 
## TODO: Upload these Repos
    #plug "zap-zsh/my-fzf"
    #plug "zap-zsh/fzf-key-binds"

# Keybindings
bindkey "^ " autosuggest-accept

# For Zoxide
if type "zoxide" > /dev/null; then
    eval "$(zoxide init zsh)"
fi

# For fnm = Fast Node Manager
if type "fnm" > /dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# Please-cli
if type "please" > /dev/null; then
    please
fi
