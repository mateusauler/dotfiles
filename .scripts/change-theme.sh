#!/bin/sh

cd ~/.config/X11/Xresources.d/
linenum=$(ls *.Xresources | grep -n "^$(tail -n 1 ~/.config/X11/Xresources | sed 's/\#include \"Xresources\.d\/\(.*\)\"/\1/')\$" - | cut -s -d: -f1 | xargs -I {} expr {} - 1)
[ -z $linenum ] && linenum=0
newtheme=$(ls *.Xresources | dmenu -wd 900 -g 2 -s $linenum)
[ -z $newtheme ] && exit
sed -i '$d' ../Xresources
printf "#include \"Xresources.d/$newtheme\"" >> ../Xresources
xrdb ~/.config/X11/Xresources
