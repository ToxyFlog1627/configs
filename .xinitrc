#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi





# Gnome-keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
# Mouse sensativity
xinput set-prop 15 'libinput Accel Speed' -.65
# Status bar 
(sleep 3s && /home/tx/scripts/status_bar.sh &) &
# Language switching
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"
# Wallpaper
nitrogen --restore &
# Blurred bg
picom --experimental-backends --backend glx &
# Sound settings
/home/tx/scripts/setup_sound.sh &
# DWM
exec dwm
