#!/bin/sh

#Rice Stuff
#picom --experimental-backends & #compton but not compton
#exec ~/.config/dwm/statusBar.sh &
#exec ~/.config/polybar/launch.sh & 
#nitrogen --restore &
~/.fehbg &

fcitx
export QT_QPA_PLATFORMTHEME="qt5ct"
export $(dbus-launch)
otd &
#pipewire &
#pipewire-pulse &
dunst &
syncthing --no-browser

#Turn off sleep
xset s off & 
xset -dpms &

#Keys
keys (){
	while true; do
		sxhkd
	done
}
keys &

#Video Setings
displaysetup.sh 

#Run WM
exec ~/sync/bin/dwm
#exec emacs #I wish this was a joke lul.
#exec bspwm
#exec spectrwm
#exec herbstluftwm 
