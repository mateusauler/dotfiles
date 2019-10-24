#!/bin/bash

if [ $# -eq 1 ]; then
	printf $1 | xclip -selection clipboard
fi
