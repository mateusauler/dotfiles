set TERMINAL "rxvt-unicode"
set BROWSER "google-chrome-stable"

set scr_dir $HOME/.scripts

echo $PATH | grep $scr_dir > /dev/null || set PATH "$PATH:$scr_dir"

alias g='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if [ (lsmod | grep pcspkr) != "" ];
	sudo rmmod pcspkr
end

if [ (tty) = "/dev/tty1" ];
	pgrep i3 || startx
end
