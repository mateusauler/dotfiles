#!/bin/bash

# Create a symbolic link to the desired config file and call it config-ln

cp $HOME/.config/i3/config-base $HOME/.config/i3/config

if [ -f $HOME/.config/i3/config-ln ]; then
	cat $HOME/.config/i3/config-ln >> $HOME/.config/i3/config
fi

i3-msg restart
