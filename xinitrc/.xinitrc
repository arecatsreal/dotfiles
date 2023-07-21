#!/bin/sh
eval "$(dbus-launch --sh-syntax --exit-with-session)"
#Rice Stuff
#picom --experimental-backends & #compton but not compton
#exec ~/.config/dwm/statusBar.sh &
#exec ~/.config/polybar/launch.sh &
#nitrogen --restore &
#~/cowsdf.sh &

# Multi lang input
#export GTX_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export GLFW_IM_MODULE=ibus # Kitty
#ibus-daemon -drx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
fcitx -d &

# Redshift
# rs.sh &

~/sync/bin/nas

export QT_QPA_PLATFORMTHEME="qt6ct"
export $(dbus-launch)

# Pipewire
gentoo-pipewire-launcher &

dunst &
#syncthing --no-browser &
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
displaysetup.sh &
#display_kgpe-d16.sh
~/.fehbg &

#Run WM
#exec dwm
#exec ~/gitStuffs/dwm/dwm
#exec qtile start
#exec emacs #I wish this was a joke lul.
#exec bspwm
#exec spectrwm
exec herbstluftwm >> $HOME/herb.log
#exec notion
# exec i3
