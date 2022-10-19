#!/bin/sh

run_file() {
	[ -f $1 ] && $@
}

run_cmd() {
	[ $(command -v "$1") ] && $@
}

run_cmd toggle_lang br &
run_file $HOME/.screenlayout/screenlayout.sh &
run_cmd picom --config $HOME/.config/picom/picom.conf &
run_cmd redshift &
run_cmd megasync &
run_cmd flameshot &
run_cmd nm-applet &
run_cmd easyeffects --gapplication-service &
run_cmd unclutter --timeout 3 --ignore-scrolling &
systemctl start --user dunst &
systemctl start --user clipmenud &
run_file /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
