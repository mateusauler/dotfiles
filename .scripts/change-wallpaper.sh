#!/bin/bash

cd $XDG_PICTURES_DIR/wall

rm ../wallpaper.*

ls |sort -R |tail -1 |while read file; do
	ext="${file##*.}"
	cp $file $HOME/Pictures/wallpaper.$ext
	feh --bg-fill $HOME/Pictures/wallpaper.$ext
done

