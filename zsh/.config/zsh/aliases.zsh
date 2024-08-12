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

# TODO: Refactor this with gcoa
alias gco='gitCheckOutLocal'            # [G]it[C]heck[O]ut Local Branches
function gitCheckOutLocal () {
    local fzf_header="Checkout Recent Branch"
    local git_diff_command="git diff {1} --color=always"

    function commandToGetLastWord() {
        if type "choose1" > /dev/null; then
           echo "choose -f ' ' -1"
        else
            echo "rev | cut -d ' ' -f 1 | rev"
        fi
    }
    
    git branch --sort=-committerdate \
    | fzf --header "$fzf_header" --preview "$git_diff_command" --pointer=">" \
    | eval "$(commandToGetLastWord)" \
    | xargs git checkout
}

alias gcoa='gitCheckOutAll'            # [G]it[C]heck[O]ut[A]ll Branches
function gitCheckOutAll () {
    local fzf_header="Checkout Recent Branch"
    local git_diff_command="git diff {1} --color=always"

    function commandToGetLastWord() {
        if type "choose1" > /dev/null; then
           echo "choose -f ' ' -1"
        else
            echo "rev | cut -d ' ' -f 1 | rev"
        fi
    }
    
    git branch --all --sort=-committerdate \
    | grep -v HEAD \
    | sed "s|remotes\/||g" \
    | fzf --header "$fzf_header" --preview "$git_diff_command" --pointer=">" \
    | eval "$(commandToGetLastWord)" \
    | sed "s|origin\/||g" \
    | xargs git checkout
}

alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias manf='man -k . | awk "{print $1}" | fzf --preview "man {1}" --preview-window=right,70% | xargs man'


# Only For Ubuntu
if [[ $(awk -F= '/^ID=/ {print $2}' /etc/os-release 2> /dev/null | sed 's/"//g') == "ubuntu" ]]; then
    #FdFind 
    alias fd='fdfind'

    #Bat
    alias bat='batcat'
fi
