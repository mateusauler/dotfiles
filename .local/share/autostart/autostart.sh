#!/bin/sh

toggle_lang br &
picom --config $HOME/.config/picom/picom.conf &
redshift &
megasync &
flameshot &
nm-applet &
easyeffects --gapplication-service &
unclutter --timeout 3 --ignore-scrolling &
systemctl start --user dunst &
/etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
