#!/bin/sh

urxvtd &
picom --config $HOME/.config/picom/picom.conf -f &
redshift &
megasync &
