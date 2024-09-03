#!/bin/bash

send_notification() {
    notify-send -i "/usr/share/icons/Papirus/64x64/apps/com.github.peteruithoven.resizer.svg" "Wallpaper" "$*"
}

WALLPAPER="$HOME/.cache/wallpaper/image.png"
RANDOM_WALLPAPER=$(ls $HOME/Pictures/Wallpapers/*png | shuf -n 1)

# For Hyprlock
cp -v ${RANDOM_WALLPAPER} ${WALLPAPER}

send_notification "Changing Wallpaper"

# WBG
# Experimented with wbg 
# Not using it as it is a hassle to install when swaybg is in repo
# wbg ${WALLPAPER}

# swww
# swww init
# swww img ${WALLPAPER} --transition-type center

# SwayBG
swaybg --mode fill --image ${WALLPAPER}
