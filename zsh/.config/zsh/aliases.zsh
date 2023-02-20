#Exa
alias exa='exa --icons'
alias exal='exa -lag'
alias exat='exa -T'

#Tmux
alias tmux='tmux -u -f $HOME/.config/tmux/tmux.conf'
alias tmux-as='tmux attach-session -t'
alias tmux-rs='tmux rename-session -t'

#Fzf & it's derivatives
alias fzft='fzf-tmux -r 30%'
alias gco='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" --pointer=">" | xargs git checkout'
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias manf='man -k . | awk "{print $1}" | fzf --preview "man {1}" --preview-window=right,70% | xargs man'

#Only For Ubuntu
if [[ $(awk -F= '/^ID=/ {print $2}' /etc/os-release 2> /dev/null | sed 's/"//g') == "ubuntu" ]]; then
    #FdFind 
    alias fd='fdfind'

    #OpenVPN3 for Work
    alias list-vpn='openvpn3 sessions-list'
    alias start-vpn='openvpn3 session-start --config $HOME/Vpn/mnet_techvpn.ovpn'
    alias stop-vpn='openvpn3 session-manage --config $HOME/Vpn/mnet_techvpn.ovpn --disconnect'
fi
