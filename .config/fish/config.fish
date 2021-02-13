# environment

set -x TERM		 st-256color
set -x TERMINAL	 $TERM
set -x COLORTERM $TERM

set -x EDITOR vim

set -x BROWSER		browser
set -x BROWSER_PRIV "browser -p"

set -x WM dwm

# fix android studio
set -x _JAVA_AWT_WM_NONREPARENTING 1

# XDG variables

set -x XDG_CONFIG_HOME	$HOME/.config
set -x XDG_CACHE_HOME	$HOME/.cache
set -x XDG_DATA_HOME	$HOME/.local/share

set -x XDG_DATA_DIRS	/usr/local/share:/usr/share
set -x XDG_CONFIG_DIRS	/etc/xdg

set -x XDG_DESKTOP_DIR		-
set -x XDG_DOWNLOAD_DIR		$HOME/dl
set -x XDG_TEMPLATES_DIR	$HOME/templates
set -x XDG_PUBLICSHARE_DIR	$HOME/pub
set -x XDG_DOCUMENTS_DIR	$HOME/docs
set -x XDG_MUSIC_DIR		$HOME/music
set -x XDG_PICTURES_DIR		$HOME/pics
set -x XDG_VIDEOS_DIR		$HOME/vids

# cleanup ~/

set -x XAUTHORITY				$XDG_RUNTIME_DIR/Xauthority
set -x GTK2_RC_FILES			$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -x LESSHISTFILE				-
set -x WGETRC					$XDG_CONFIG_HOME/wget/wgetrc
set -x GNUPGHOME				$XDG_DATA_HOME/gnupg
set -x WINEPREFIX				$XDG_DATA_HOME/wineprefixes/default
set -x GOPATH					$XDG_DATA_HOME/go
set -x RXVT_SOCKET  			$XDG_RUNTIME_DIR/urxvtd
set -x SQLITE_HISTORY			$XDG_DATA_HOME/sqlite_history
set -x VIMINIT					'source $XDG_CONFIG_HOME/vim/vimrc'
set -x CCACHE_CONFIGPATH		$XDG_CONFIG_HOME/ccache.config
set -x CCACHE_DIR				$XDG_CACHE_HOME/ccache
set -x ANDROID_PREFS_ROOT		$XDG_CONFIG_HOME/android
set -x ADB_KEYS_PATH			$ANDROID_PREFS_ROOT
set -x ANDROID_EMULATOR_HOME	$XDG_DATA_HOME/android/emulator
set -x _JAVA_OPTIONS			-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
set -x NPM_CONFIG_USERCONFIG    $XDG_CONFIG_HOME/npm/npmrc
set -x NVM_DIR                  $XDG_DATA_HOME/nvm

alias nvidia-settings	"nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
alias wget				"wget --hsts-file $XDG_CACHE_HOME/wget-hsts"
alias sqlite3			"sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc"

# initialization

set fish_greeting

set -l short_dir $HOME/.shortcuts
set -l ccache_bin_dir /usr/lib/ccache/bin/

echo $PATH | grep $ccache_bin_dir > /dev/null || set PATH "$ccache_bin_dir:$PATH"
echo $PATH | grep $short_dir > /dev/null || set PATH "$short_dir:$PATH"

# aliases & abbreviations

alias g		git
alias gua	"git remote | sed 's/^blacklist-.*//' | xargs -L1 git push --all"
alias gsu	"git remote | sed 's/^blacklist-.*//' | xargs -L1 -I {} git branch -u {}/(git branch --show-current) (git branch --show-current)"
alias c		"/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cua	"c remote | sed 's/^blacklist-.*//' | xargs -L1 c push --all"

alias cleanup-after-bad-patch "rm *.{rej, orig}"

alias cat bat

abbr --add gs "git status"
abbr --add gu "git push"
abbr --add gl "git pull"
abbr --add ga "git add"
abbr --add gc "git commit"
abbr --add gh "git checkout"
abbr --add gd "git diff"

abbr --add cs "c status"
abbr --add cu "c push"
abbr --add cl "c pull"
abbr --add ca "c add"
abbr --add cc "c commit"
abbr --add ch "c checkout"

abbr --add pa "patch -p1 <"

abbr --add p "paru"

alias upm "sudo reflector --verbose -p http,https,rsync -c \"Brazil,Chile,Paraguay,Colombia,Ecuador,United States,Worldwide\" -f 24 --completion-percent 100 --save /etc/pacman.d/mirrorlist"

alias hexdump "hexdump -C"

alias ls="exa --group-directories-first"
alias la="exa -laGF --group-directories-first"
alias ll="exa -lGF --group-directories-first"

fish_vi_key_bindings

# startx if in tty1

if test (tty) = "/dev/tty1" && ! pgrep $WM;
	test -f $HOME/.scripts/mount_devices.sh && $HOME/.scripts/mount_devices.sh &
	lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr &
	startx
end
