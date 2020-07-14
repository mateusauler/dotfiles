#!/bin/sh

case $(printf "lock\nexit\nsuspend\nhibernate\nreboot\npoweroff" | dmenu -n -c -l 6 -h 32 -fn "monospace:12") in
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

