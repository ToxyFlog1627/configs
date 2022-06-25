#!/bin/sh
if [[ $1 == false ]]; then
    updatesNum=$(xwininfo -root | grep "Window id: " | grep -o '\| [0-9]\+ updates \|' | grep -o '[0-9]\+')
    updates=$(if [[ $updatesNum > 0 ]]; then echo "$updatesNum $(if [[ $updatesNum == 1 ]]; then echo "update"; else echo "updates"; fi)"; fi)
fi
updates=$updates loop=false /home/tx/scripts/status_bar.sh $1
