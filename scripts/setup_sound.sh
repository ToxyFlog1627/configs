#!/bin/sh

sleep 5s
alsactl --file /home/tx/.config/asound.state restore
nohup easyeffects --gapplication-service &
