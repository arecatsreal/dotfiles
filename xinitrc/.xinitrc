#!/bin/sh

#Video Setings
displaysetup.sh 

#Rice Stuff
picom --experimental-backends & #compton but not compton
#exec ~/.config/dwm/statusBar.sh &
#sxhkd & #Hotkeys working == lul
#exec ~/.config/polybar/launch.sh & 
#nitrogen --restore &
~/.fehbg &

fcitx
QT_QPA_PLATFORMTHEME="qt5ct"
pipewire &
pipewire-pulse &

#Turn off sleep
xset s off & 
xset -dpms &
	
#Run WM
#exec /home/mip/.config/dwm/dwm
#exec emacs #I wish this was a joke lul.
#exec bspwm
exec spectrwm
#exec herbstluftwm 
