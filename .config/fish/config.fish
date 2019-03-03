set TERMINAL "rxvt-unicode"

sudo loadkeys br-abnt2

export LANG=C

set scr_dir $HOME/.scripts

echo $PATH | grep $scr_dir > /dev/null || set PATH "$PATH $HOME/.scripts"
alias g='/usr/bin/git --git-dir=/home/mateus/.cfg/ --work-tree=/home/mateus'
