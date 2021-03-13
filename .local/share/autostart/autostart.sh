#!/bin/sh

pgrep urxvtd > /dev/null || urxvtd &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
redshift &
nm-applet &
megasync &
unclutter --timeout 3 --ignore-scrolling &
