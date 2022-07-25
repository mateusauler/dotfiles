#!/bin/bash

if [ $# -ge 1 ]; then
	wally-cli "$@" 2> /dev/null
	sleep 1
	rm "$@"
fi
toggle_lang br
xset r rate 400 50
