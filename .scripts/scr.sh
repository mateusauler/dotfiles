#!/bin/bash

name=$(date '+%Y-%m-%d %H-%M-%S')
scr_dir="$HOME/Pictures/screenshots"
format="png"

if [ "$#" = 0 ]; then
	import "$scr_dir/$name.$format"

elif [ "$#" = 1 ]; then
	import -window $1 "$scr_dir/$name.$format"
fi

sxiv "$scr_dir/$name.$format"
