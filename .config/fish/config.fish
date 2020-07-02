export TERM="rxvt-unicode-256color"
export TERMINAL=$TERM

export EDITOR="vim"

export BROWSER="firefox-developer-edition"
export BROWSER_PRIV="$BROWSER --private-window"

export WM="dwm"

set fish_greeting

set -l short_dir $HOME/.shortcuts

echo $PATH | grep $short_dir > /dev/null || set PATH "$PATH:$short_dir"

alias g=git
alias gua="git remote | xargs -L1 git push"
alias gsu="git remote | xargs -L1 -I {} git push -u {} (git branch --show-current)"
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cua="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote | xargs -L1 /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push"

abbr --add gs "git status"
abbr --add gu "git push"
abbr --add gl "git pull"
abbr --add ga "git add"
abbr --add gc "git commit -m"
abbr --add gh "git checkout"

abbr --add p pushd
abbr --add o popd

alias hexdump="hexdump -C"

alias ls="exa -GF --group-directories-first"
alias la="exa -laGF --group-directories-first"
alias ll="exa -lGF --group-directories-first"

fish_vi_key_bindings

if test (tty) = "/dev/tty1" && ! pgrep $WM;
	test -f $HOME/.scripts/mount_devices.sh && $HOME/.scripts/mount_devices.sh &
	lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr &
	startx
end
