#!/bin/bash

send_notification() {
    notify-send -i "/usr/share/icons/Papirus/64x64/apps/gddccontrol.svg" "Hyprland-Monitors" "$*"
}

notification="";
if grep open /proc/acpi/button/lid/LID0/state; then
    notification="${notification}󰌢  Lid Open";
    # if check for Monitor is connected or not
    if [[ $(hyprctl monitors | grep "Monitor" | wc -l) > 1 ]]; then
        notification="${notification}\nDual Monitor Setup: External Monitor above Laptop Screen";
        hyprctl keyword monitor "HDMI-A-1, 1920x1080@71.91, 0x0, 1";
        hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x1080, 1";
    else
        notification+="${notification}\nDefault Screen Laptop Screen";
        hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1";
    fi
else
    notification="${notification}󰛧  Lid Closed";
    # Checking for Number of Displays
    if [[ $(hyprctl monitors | grep "Monitor" | wc -l) > 1 ]]; then
        hyprctl keyword monitor "HDMI-A-1, 1920x1080@71.91, 0x0, 1";
        notification="${notification}\nDisabling Laptop Screen";
        notification="${notification}\nUsing External Monitor";
        hyprctl keyword monitor "eDP-1, disable";
    else
        if 
            [[ $(hyprctl monitors | grep "Monitor" | wc -l) -eq 1 ]] &&
            [[ -z $(hyprctl monitors | grep "Monitor HDMI-A-1") ]]; 
        then
            hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1";
        else
            # Do Nothing as Already Set to HDMI
            notification="${notification}\nExternal Monitor Already Set";
        fi
    fi
fi

send_notification $notification
