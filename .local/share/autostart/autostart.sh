#!/bin/sh

run() {
	( [ -f $1 ] || command -v "$1" > /dev/null ) && $@
}

run toggle_lang br &
run $HOME/.screenlayout/screenlayout.sh &
run picom --config $HOME/.config/picom/picom.conf &
run redshift &
run megasync &
run syncthingtray &
run flameshot &
run nm-applet &
run easyeffects --gapplication-service &
run unclutter --timeout 3 --ignore-scrolling &
systemctl start --user dunst &
systemctl start --user clipmenud &
run /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
