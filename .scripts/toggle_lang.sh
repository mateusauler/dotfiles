#!/bin/sh

if [ $# -eq "1" ]; then
	layout=$1
else
	if [ $(setxkbmap -query | grep layout | awk '{print $2}')  = "us" ]; then
		layout=br
	else
		layout=us
	fi
fi

setxkbmap -layout $layout
