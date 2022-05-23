#!/bin/sh
#Rice Stuff
#picom --experimental-backends & #compton but not compton
#exec ~/.config/dwm/statusBar.sh &
#exec ~/.config/polybar/launch.sh & 
#nitrogen --restore &
~/cowsdf.sh &

#fcitx
export QT_QPA_PLATFORMTHEME="qt5ct"
export $(dbus-launch)
#otd &
#pipewire &
#pipewire-pulse &
dunst &
syncthing --no-browser &
#emacs --bg-daemon &
#dwm_bar &

#Turn off sleep
xset s off & 
xset -dpms &

#Keys
keys (){
	while true; do
		sxhkd
	done
}
# keys &

#Video Setings
#displaysetup.sh 
display_kgpe-d16.sh
~/.fehbg &

#Run WM
#exec ~/sync/bin/dwm
#exec ~/gitStuffs/dwm/dwm
#exec qtile start
#exec emacs #I wish this was a joke lul.
#exec bspwm
#exec spectrwm
exec herbstluftwm 
#exec notion
