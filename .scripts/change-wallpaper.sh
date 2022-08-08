#!/bin/sh

dest=$HOME/pics/wallpaper

cd $HOME/pics/wall

file=$(ls | shuf | nsxiv -oiqt | head -n 1)

if [ ! -z $file ]; then
	[ -f $dest ] | rm $dest
	ln $file $dest
fi

feh --no-fehbg --bg-fill $dest
