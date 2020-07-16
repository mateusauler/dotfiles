#!/bin/bash

cd $XDG_PICTURES_DIR/wall

ls | while read file; do
	ext="${file##*.}"

	newname=$(sha1sum $(pwd)/$file | cut -b -16).$ext
	
	if [ ! -f $newname ]; then
		mv $file $newname
	fi
done

ls
