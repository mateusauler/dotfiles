cd

numlockx &

sh $HOME/.local/share/autostart/autostart.sh &

xrdb ~/.Xresources 

feh --bg-fill $HOME/pics/wallpaper.*

setxkbmap -option "caps:swapescape"

xset r rate 400 50

while xsetroot -name "`date +\"%a %d/%m %H:%M:%S\"`"
do
	sleep 1
done &
exec $WM
