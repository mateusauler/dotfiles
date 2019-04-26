#!/bin/bash

name=$(date '+%Y-%m-%d_%H-%M-%S')
scr_dir="$HOME/Pictures/screenshots"
format="png"
full_name="$scr_dir/$name.$format"

if [ "$#" = 0 ]; then
	import "$full_name"

elif [ "$#" = 1 ]; then
	import -window "$1" "$full_name"
fi

sxiv "$full_name"
