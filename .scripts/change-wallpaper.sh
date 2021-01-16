#!/bin/sh

dest=$HOME/pics/wallpaper

cd $HOME/pics/wall

file=$(ls | shuf | sxiv -oiqt | head -n 1)

if [ ! -z $file ]; then
	[ -f $dest ] | rm $dest
	ln $file $dest
fi

feh --bg-fill $dest


