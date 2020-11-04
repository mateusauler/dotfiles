#!/bin/sh

if [ $# -eq 1 ]; then
	printf "$1" | xclip -selection clipboard
elif [ $# -eq 2 ] && [ "$1" = "-f" ]; then
	xclip -sel clip -t "$(file --mime-type "$2" | cut -d' ' -f2)" "$2"
fi
