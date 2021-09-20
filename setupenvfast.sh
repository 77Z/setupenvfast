#!/bin/bash

ping google.com

if [ $? != 0 ]; then
	echo NOT CONNECTED TO INTERNET
else
	echo CONNECTED TO INTERNET
fi

pacman -Sy
pacman -S bc base-devel firefox git libxrandr libxinerama tcc xorg-server xorg-xrandr zip unzip

echo --------------------------------------
echo DONE INSTALLING CRAP
echo setting up environment in 5 seconds...
echo --------------------------------------
sleep 5

git clone https://github.com/77Z/setupenvfast.git
cd setupenvfast/dwm
make install CC=tcc
cd ../st
make install CC=tcc
cd ../../
# Back in home dir
mv setupenvfast/.xinitrc .
# move xinitrc to current home dir
startx
