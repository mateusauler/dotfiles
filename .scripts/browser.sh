#!/bin/sh

browser_cmd="librewolf --new-tab"
yt_cmd="mpv"

run_cmd="$browser_cmd"
run_args=""

args="$@"

private=0

set_priv() {
	case $run_cmd in
		$browser_cmd)
			append_arg_start "--private-window"
			;;
		*)
			;;
	esac
}

append_arg(){
	run_args="$run_args $1"
}

append_arg_start(){
	run_args="$1 $run_args"
}

for a in $args; do
	echo "$a" | grep -E "(youtube\.com/(watch|shorts)|youtu\.be|tiktok\.com)" > /dev/null && run_cmd="$yt_cmd"

	case $a in
		-p|-P)
			private=1	
			;;
		*)
			append_arg $a
	esac
done

if [ $private -eq 1 ] ; then
	set_priv
fi

printf "%b" "$run_cmd $run_args\n"
exec $run_cmd $run_args > /dev/null &
