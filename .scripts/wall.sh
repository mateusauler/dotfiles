#!/bin/bash

cd $HOME/Pictures/wall

ls |sort -R |tail -1 |while read file; do
	ext="${file##*.}"
	cp $file $HOME/Pictures/wallpaper.$ext
	feh --bg-fill $HOME/Pictures/wallpaper.$ext
done

