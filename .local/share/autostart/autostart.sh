#!/bin/sh

toggle_lang br &
picom --config $HOME/.config/picom/picom.conf &
redshift &
megasync &
flameshot &
nm-applet &
unclutter --timeout 3 --ignore-scrolling &
/etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
