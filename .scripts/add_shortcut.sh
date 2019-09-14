#!/bin/bash

scr_dir=$HOME/.shortcuts

if [ "$#" = 2 ]; then
	if [ -e "$scr_dir/$2" ]; then
		echo "Shortcut already exists."
	else
		if [ -f $1 ]; then
			ln -sf $1 $scr_dir/$2
			echo "Shortcut created."
		else
			echo "$1 is not a file."
		fi
	fi
else
	echo "Usage:"
	echo "$0 [EXECUTABLE] [SHORTCUT_NAME]"
fi


