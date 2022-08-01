#!/bin/sh

bin_dir=$HOME/.local/bin
mkdir -p $bin_dir

if [ "$#" != 2 ]; then
	echo "Usage:"
	echo "$0 [EXECUTABLE] [SHORTCUT_NAME]"
	exit 1
fi

if [ ! -e "$bin_dir/$2" ]; then
	if [ "$1" = "-r" ]; then
		echo "$2 does not exist."
		exit 1
	fi

	if [ ! -f $1 ]; then
		echo "$1 is not a file."
		exit 1
	fi

	ln -sf "$(realpath $1)" "$bin_dir/$2"
	exit 0
fi

if [ "$1" != "-r" ]; then
	echo "Shortcut already exists."
	exit 1
fi

rm $bin_dir/$2
