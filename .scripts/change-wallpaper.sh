#!/bin/bash

cd $HOME/pics/wall

rm ../wallpaper.*

ls | shuf -n 100 | sxiv -oiqt | head -n 1 | while read file; do
	ext="${file##*.}"
	cp $file $HOME/pics/wallpaper.$ext
	feh --bg-fill $HOME/pics/wallpaper.$ext
done

