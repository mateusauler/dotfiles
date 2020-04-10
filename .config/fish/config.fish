set TERMINAL "rxvt-unicode"
set BROWSER "firefox-developer-edition"

set fish_greeting

set short_dir $HOME/.shortcuts

echo $PATH | grep $short_dir > /dev/null || set PATH "$PATH:$short_dir"

alias g='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr

abbr --add p pushd
abbr --add o popd

alias hexdump="hexdump -C"

fish_vi_key_bindings

if [ (tty) = "/dev/tty1" ];
	pgrep i3 || startx
end
