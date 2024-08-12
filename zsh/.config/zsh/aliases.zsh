# Clear
alias clr='clear && quoterm'


# Wget
alias wget="wget --hsts-file=$HOME/.config/wget/wget-history"


# Glow
alias glowp="glow -p -w $((${COLUMNS} - 12))"


# Tmux
alias tmux='tmux -u -f $HOME/.config/tmux/tmux.conf'
alias tmux-as='tmux attach-session -t'
alias tmux-rs='tmux rename-session -t'


# Bluetooth
alias bt-on='bluetoothctl power on'
alias bt-off='bluetoothctl power off'
alias bt-sd='bluetoothctl scan on'      # [S]can[D]evice
alias bt-ld='bluetoothctl devices'      # [L]ist[D]evice
alias bt-cd='bluetoothctl connect'      # [C]onnect[D]evice
alias bt-dd='bluetoothctl disconnect'   # [D]isconnect[D]evice

alias bt-md='macOfDevice'               # [M]acOf[D]evice
function macOfDevice () {
    MAC=$(bt-ld | rg -i $*)
    echo ${MAC:7:17}
}


# Fzf & it's derivatives
alias fzft='fzf-tmux -r 30%'
alias manf='man -k . | awk "{print $1}" | fzf --preview "man {1}" --preview-window=right,70% | xargs man'
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

alias gco='gitCheckOut --local-only'    # [G]it[C]heck[O]ut Local Branches
alias gcoa='gitCheckOut'                # [G]it[C]heck[O]ut[A]ll Branches
function gitCheckOut () {
    local grep_filter="HEAD"
    if [[ "$1" == "--local-only" ]]; then
        grep_filter="remotes"
    fi

    local fzf_header="Checkout Recent Branch"
    local git_diff_command="git diff {1} --color=always"
    
    local get_last_word_command="rev | cut -d ' ' -f 1 | rev"
    if type "choose" > /dev/null; then
        get_last_word_command="choose -f ' ' -1"
    fi

    git branch --all --sort=-committerdate \
        | grep -v "$grep_filter" \
        | sed "s|remotes/||g" \
        | fzf --header "$fzf_header" --preview "$git_diff_command" --pointer=">" \
        | eval "$get_last_word_command" \
        | sed "s|origin/||g" \
        | xargs git checkout
}


# Only For Ubuntu
if [[ $(awk -F= '/^ID=/ {print $2}' /etc/os-release 2> /dev/null | sed 's/"//g') == "ubuntu" ]]; then
    #FdFind 
    alias fd='fdfind'

    #Bat
    alias bat='batcat'
fi
