export TERM="st"
export TERMINAL=$TERM

export EDITOR="vim"

export BROWSER="firefox-developer-edition"
export BROWSER_PRIV="$BROWSER --private-window"

export WM="dwm"

set fish_greeting

set -l short_dir $HOME/.shortcuts

echo $PATH | grep $short_dir > /dev/null || set PATH "$PATH:$short_dir"

alias g=git
alias gua="git remote | xargs -L1 git push --all"
alias gsu="git remote | xargs -L1 -I {} git push -u {} (git branch --show-current)"
alias cua="c remote | xargs -L1 c push --all"

alias cleanup-after-bad-patch="rm *.{rej, orig}"

abbr --add gs "git status"
abbr --add gu "git push"
abbr --add gl "git pull"
abbr --add ga "git add"
abbr --add gc "git commit -m"
abbr --add gh "git checkout"
abbr --add gd "git diff"

abbr --add cs "c status"
abbr --add cu "c push"
abbr --add cl "c pull"
abbr --add ca "c add"
abbr --add cc "c commit -m"
abbr --add ch "c checkout"

abbr --add pa "patch -p1 <"

abbr --add p pushd
abbr --add o popd

alias hexdump="hexdump -C"

alias ls="exa --group-directories-first"
alias la="exa -laGF --group-directories-first"
alias ll="exa -lGF --group-directories-first"

fish_vi_key_bindings

if test (tty) = "/dev/tty1" && ! pgrep $WM;
	test -f $HOME/.scripts/mount_devices.sh && $HOME/.scripts/mount_devices.sh &
	lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr &
	startx
end
