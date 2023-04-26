#!/bin/sh

rsp toggle_lang br &
rsp $HOME/.screenlayout/screenlayout.sh &
rsp picom --config $HOME/.config/picom/picom.conf &
rsp redshift &
rsp megasync &
rsp syncthingtray --wait &
rsp flameshot &
rsp nm-applet &
rsp easyeffects --gapplication-service &
rsp unclutter --timeout 3 --ignore-scrolling &
systemctl start --user dunst &
systemctl start --user clipmenud &
rsp /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
rsp /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
