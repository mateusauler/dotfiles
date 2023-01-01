# environment

set -x TERM		 st-256color
set -x TERMINAL	 $TERM
set -x COLORTERM $TERM

set -x VISUAL nvim
set -x EDITOR nvim

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x BROWSER		browser
set -x BROWSER_PRIV "browser -p"
set -x BROWSER_PROF "browser --ProfileManager"

set -x WM dwm

set -x CHROME_EXECUTABLE (which chromium 2> /dev/null)

# fix android studio
set -x _JAVA_AWT_WM_NONREPARENTING 1

# XDG variables

set -x XDG_CONFIG_HOME	$HOME/.config
set -x XDG_CACHE_HOME	$HOME/.cache
set -x XDG_DATA_HOME	$HOME/.local/share
set -x XDG_STATE_HOME   $HOME/.local/state

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
set -x XINITRC					$XDG_CONFIG_HOME/X11/xinitrc
set -x GTK2_RC_FILES			$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -x LESSHISTFILE				-
set -x WGETRC					$XDG_CONFIG_HOME/wget/wgetrc
set -x GNUPGHOME				$XDG_DATA_HOME/gnupg
set -x WINEPREFIX				$XDG_DATA_HOME/wineprefixes/default
set -x GOPATH					$XDG_DATA_HOME/go
set -x RXVT_SOCKET  			$XDG_RUNTIME_DIR/urxvtd
set -x SQLITE_HISTORY			$XDG_DATA_HOME/sqlite_history
set -x CCACHE_CONFIGPATH		$XDG_CONFIG_HOME/ccache.config
set -x CCACHE_DIR				$XDG_CACHE_HOME/ccache
set -x ANDROID_PREFS_ROOT		$XDG_CONFIG_HOME/android
set -x ADB_KEYS_PATH			$ANDROID_PREFS_ROOT
set -x ANDROID_HOME             $XDG_DATA_HOME/android
set -x ANDROID_EMULATOR_HOME	$ANDROID_HOME/emulator
set -x _JAVA_OPTIONS			-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
set -x NPM_CONFIG_USERCONFIG    $XDG_CONFIG_HOME/npm/npmrc
set -x NVM_DIR                  $XDG_DATA_HOME/nvm
set -x CARGO_HOME               $XDG_DATA_HOME/cargo
set -x CUDA_CACHE_PATH          $XDG_CACHE_HOME/nv
set -x GRADLE_USER_HOME         $XDG_DATA_HOME/gradle
set -x JUPYTER_CONFIG_DIR       $XDG_CONFIG_HOME/jupyter
set -x CABAL_CONFIG             $XDG_CONFIG_HOME/cabal/config
set -x CABAL_DIR                $XDG_CACHE_HOME/cabal
set -x PYTHONSTARTUP            $XDG_CONFIG_HOME/python/pythonrc
set -x HISTFILE                 $XDG_STATE_HOME/bash/history

alias nvidia-settings	"nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
alias wget				"wget --hsts-file $XDG_CACHE_HOME/wget-hsts"
alias sqlite3			"sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc"

# initialization

set fish_greeting

function add_path
	echo $PATH | grep "$argv[1]" > /dev/null || set PATH "$argv[1]:$PATH"
end

add_path "/usr/lib/ccache/bin/"
add_path "$HOME/.local/share/cargo/bin"
add_path "$HOME/.local/bin"

# aliases & abbreviations

alias gua	"git remote | sed '/^blacklist/{d}' | xargs -L1 git push --all"
alias gsu	"git remote | sed '/^blacklist/{d}' | xargs -I {} git branch -u {}/(git branch --show-current) (git branch --show-current)"
alias c		"/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cua	"c remote | sed '/^blacklist/{d}' | xargs -L1 c push --all"

alias cleanup-after-bad-patch "rm *.{rej, orig}"

abbr --add g   "git"

abbr --add gs  "git status"
abbr --add gu  "git push"
abbr --add gl  "git pull"
abbr --add ga  "git add"
abbr --add gap "git add -p"
abbr --add gc  "git commit"
abbr --add gca "git commit --amend"
abbr --add gh  "git checkout"
abbr --add gb  "git branch"
abbr --add gd  "git diff"
abbr --add gdc "git diff --cached"

abbr --add cs  "c status"
abbr --add cu  "c push"
abbr --add cl  "c pull"
abbr --add ca  "c add"
abbr --add cap "c add -p"
abbr --add cco "c commit"
abbr --add cca "c commit --amend"
abbr --add ch  "c checkout"
abbr --add cb  "c branch"
abbr --add cdi "c diff"
abbr --add cdc "c diff --cached"

abbr --add pa "patch -p1 <"

abbr --add p "paru"
abbr --add z "zathura"

abbr --add vim "nvim"
abbr --add n "nvim"
abbr --add ni "neovide"

abbr --add ns "nsxiv -a"

alias upm "sudo reflector --verbose -p https,http -c \"Brazil,Chile,Paraguay,Colombia,Ecuador,United States,Worldwide\" -f 24 -a 168 --save /etc/pacman.d/mirrorlist"

alias hexdump "hexdump -C"

alias ls "exa --group-directories-first"
alias l  "ls"
alias ll "ls -lFb"
alias la "ll -a"

alias rm "rm -I"
alias cp "cp -r"

fish_vi_key_bindings

# startx if in tty1

if [ -z "$DISPLAY" ] && test (tty) = "/dev/tty1";
	test -f $HOME/.scripts/mount_devices.sh && $HOME/.scripts/mount_devices.sh &
	lsmod | grep pcspkr > /dev/null && sudo rmmod pcspkr &
#	startx "$XINITRC"
	sx
end

if status --is-interactive
	type -q pfetch && pfetch
end
