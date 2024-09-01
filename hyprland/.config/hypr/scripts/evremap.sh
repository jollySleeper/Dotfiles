#!/bin/bash

send_notification() {
    notify-send -i "/usr/share/icons/Papirus/64x64/apps/key_bindings.svg" "EvRemap" "$*"
}

if [[ $(systemctl --user is-active evRemap.service) == "active" ]]; then
    systemctl --user stop evRemap.service
    send_notification "evRemap Service Stopped"
else
    systemctl --user start evRemap.service
    send_notification "evRemap Service Started"
fi
