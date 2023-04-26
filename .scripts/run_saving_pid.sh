#!/bin/sh

pid_file=${PID_FILE:-/tmp/pids}

[[ $# < 1 ]] && exit 1
( [ -f $1 ] || command -v "$1" > /dev/null ) || exit 1

exec $@ &
echo $! >> $pid_file
