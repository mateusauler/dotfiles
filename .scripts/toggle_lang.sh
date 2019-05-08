#!/bin/bash

if [ $(setxkbmap -query | grep layout | awk '{print $2}')  = "us" ]; then
	layout=br
else
	layout=us
fi

setxkbmap -layout $layout
