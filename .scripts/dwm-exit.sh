#!/bin/sh

if [ $# -eq 1 ]
then
	op=$1
else
	op=$(printf "lock\nexit\nsuspend\nhibernate\nreboot\npoweroff" | dmenu -n -c -l 6 -h 32 -u -fn "monospace:12")
fi

case $op in
	lock)
		slock
		;;
	exit)
		pkill dwm
		;;
	suspend)
		slock
		sleep 1
		systemctl suspend
		;;
	hibernate)
		slock
		sleep 1
		systemctl hibernate
		;;
	reboot)
		systemctl reboot
		;;
	poweroff)
		systemctl poweroff
		;;
esac

