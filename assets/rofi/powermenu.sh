#!/bin/bash

ICONS="$HOME/.config/rofi/icons"

chosen=$(printf "Lock\0icon\x1f$ICONS/lock.png\nLogout\0icon\x1f$ICONS/logout.png\nSuspend\0icon\x1f$ICONS/suspend.png\nReboot\0icon\x1f$ICONS/reboot.png\nShutdown\0icon\x1f$ICONS/shutdown.png" \
    | rofi -dmenu -i -p "Power" \
           -show-icons \
           -theme ~/.config/rofi/power.rasi)

case "$chosen" in
    "Lock")     hyprlock ;;
    "Logout")   hyprctl dispatch exit ;;
    "Suspend")  systemctl suspend ;;
    "Reboot")   systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
esac