#!/bin/bash

cd $HOME/Pictures/wall

ls | while read file; do
	ext="${file##*.}"

	newname=$(sha1sum $(pwd)/$file | cut -b -40).$ext
	
	if [ ! -f $newname ]; then
		mv $file $newname
	fi
done

ls
