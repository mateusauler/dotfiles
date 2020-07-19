#!/bin/sh

dest=$HOME/pics/wallpaper

cd $HOME/pics/wall

test [ -f $dest ] | rm $dest

file=$(ls | shuf | sxiv -oiqt | head -n 1)

ln $file $dest
feh --bg-fill $dest


