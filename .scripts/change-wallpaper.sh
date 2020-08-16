#!/bin/sh

dest=$HOME/pics/wallpaper

cd $HOME/pics/wall

file=$(ls | shuf | sxiv -oiqt | head -n 1)

if [ ! -z $file ]; then
	test [ -f $dest ] | rm $dest
	ln $file $dest
fi

feh --bg-fill $dest


