set TERMINAL "rxvt-unicode"
set BROWSER "google-chrome-stable"

sudo loadkeys br-abnt2

export LANG=C

set scr_dir $HOME/.scripts

echo $PATH | grep $scr_dir > /dev/null || set PATH "$PATH:$scr_dir"

alias g='/usr/bin/git --git-dir=/home/mateus/.cfg/ --work-tree=/home/mateus'

if [ (tty) = "/dev/tty1" ];
	pgrep i3 || startx
end
