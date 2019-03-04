#!/bin/bash

cd $HOME/Pictures/wall

ls | while read file; do
	ext="${file##*.}"

	while : ;
	do
		newname=$((10000 + RANDOM % 99999))
		if [[ $(ls | grep $newname) = "" ]]; then		
			mv $file $HOME/Pictures/wall/$newname.$ext
			break
		fi
	done
done

ls
