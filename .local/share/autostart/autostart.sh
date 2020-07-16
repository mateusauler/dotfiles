#!/bin/sh

pgrep urxvtd > /dev/null || urxvtd &
picom --config $HOME/.config/picom/picom.conf -f &
redshift &
nm-applet &
megasync &
