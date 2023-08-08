#!/usr/bin/env sh

OLDHOME=$HOME
HOME=$XDG_DATA_HOME/Steam/fakehome

# Replaces every / of the first argument with \/
replace_slash() {
	echo $1 | sed "s|/|\\\/|g"
}

# Symlink a file to the fake home
link_dir() {
	# Replace OLDHOME with HOME in the link name
	link_name=$(echo $1 | sed "s/^$(replace_slash $OLDHOME)/$(replace_slash $HOME)/")

	# Creates the link's parent directory and symlinks it
	mkdir -p $(dirname $link_name)
	[ ! -d $link_name ] && ln -s $1 $link_name
}

mkdir -p $HOME

link_dir $XDG_DATA_HOME   # ~/.local/share
link_dir $XDG_CACHE_HOME  # ~/.cache
link_dir $XDG_CONFIG_HOME # ~/.config
link_dir $OLDHOME/.icons  # ~/.icons (lxappearance's mouse cursor theme)

# If .steam exists in ~/ and not in the fake home, move it to the fake home
[ -d $OLDHOME/.steam ] && [ ! -d $HOME/.steam ] && mv $OLDHOME/.steam $HOME/

exec /usr/bin/steam $@
