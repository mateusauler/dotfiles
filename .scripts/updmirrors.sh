#!/bin/sh

sudo reflector -p https,rsync -c "Brazil,Chile,Paraguay,Colombia,Ecuador,United States,Worldwide" -f 24 --save /etc/pacman.d/mirrorlist
