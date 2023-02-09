# Created by newuser for 5.8.1
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History
HISTFILE=$HOME/.config/zsh/zsh_history

# Importing/Sourcing Files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
	#plug "zap-zsh/zap-prompt"
plug "zap-zsh/my-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
	# For Skim in Zsh
	# Decided to remove after installing
	# As Fzf is faster and consumes less RAM
	#plug "zap-zsh/my-skim-plugin"
	# For my Custom Fzf in Zsh
	#plug "zap-zsh/my-fzf"
plug "zap-zsh/fzf-key-binds"

# Keybindings
bindkey "^ " autosuggest-accept

# For Zoxide
eval "$(zoxide init zsh)"

# For fnm = Fast Node Manager
eval "$(fnm env --use-on-cd)"

# Please-cli
please
