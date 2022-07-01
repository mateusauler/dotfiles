#!/bin/sh

run_file() {
	[ -f $1 ] && $@
}

toggle_lang br &
run_file $HOME/.screenlayout/screenlayout.sh &
picom --config $HOME/.config/picom/picom.conf &
redshift &
megasync &
flameshot &
nm-applet &
easyeffects --gapplication-service &
unclutter --timeout 3 --ignore-scrolling &
systemctl start --user dunst &
systemctl start --user clipmenud &
run_file /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
