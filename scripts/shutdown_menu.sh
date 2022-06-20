#!/bin/sh

choices="cancel\nquit dwm\nreboot\nshutdown"
choice=$(echo -e "$choices" | dmenu)

case $choice in
    "shutdown") sudo poweroff ;;
    "reboot") sudo reboot ;;
    "quit dwm") kill -- $(pidof dwm) ;;
esac
