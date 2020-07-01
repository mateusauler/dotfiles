cd

numlockx &

xrdb -merge ~/.Xresources 

feh --bg-fill $HOME/Pictures/wallpaper.* 

setxkbmap -option "caps:swapescape" 

xset r rate 400 50

sh $HOME/.local/share/autostart/autostart.sh &

while xsetroot -name "`date +\"%a %d/%m %H:%M:%S\"`"
do
	sleep 1
done &
exec $WM
