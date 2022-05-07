#!/bin/sh

if [ $# -eq 0 ]; then
	xclip -sel clip -t "text/plain" "/dev/stdin"
elif [ $# -eq 1 ]; then
	printf "$1" | xclip -sel clip
elif [ $# -eq 2 ] && [ "$1" = "-f" ]; then
	xclip -sel clip -t "$(file --mime-type "$2" | cut -d' ' -f2)" "$2"
fi
