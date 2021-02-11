#!/usr/bin/env sh

function replace_slash {
	echo $1 | sed "s/\//\\\\\//g"
}

function link_dir {
	# Replace OLDHOME with HOME in the link name
	link_name=$(echo $1 | sed "s/^$(replace_slash $OLDHOME)/$(replace_slash $HOME)/")

	mkdir -p $(dirname $link_name)
	[ ! -d $link_name ] && ln -s $1 $link_name
}

OLDHOME=$HOME
HOME=$XDG_DATA_HOME/Steam/fakehome
mkdir -p $HOME

link_dir $XDG_DATA_HOME
link_dir $XDG_CACHE_HOME
link_dir $XDG_CONFIG_HOME
link_dir $OLDHOME/.icons

exec /usr/bin/steam "$@"
