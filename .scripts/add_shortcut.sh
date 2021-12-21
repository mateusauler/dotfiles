#!/bin/sh

bin_dir=$HOME/.local/bin

if [ "$#" = 2 ]; then
	if [ -e "$bin_dir/$2" ]; then
		if [ "$1" = "-r" ]; then 
			rm $bin_dir/$2
		else
			echo "Shortcut already exists."
		fi
	elif [ -f $1 ]; then
		ln -sf "$(realpath $1)" "$bin_dir/$2"
		echo "Shortcut created."
	else
		if [ "$1" = "-r" ]; then 
			echo "$2 does not exist."
		else
			echo "$1 is not a file."
		fi
	fi
else
	echo "Usage:"
	echo "$0 [EXECUTABLE] [SHORTCUT_NAME]"
fi


