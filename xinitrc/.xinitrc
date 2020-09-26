#!/bin/sh

#Video Setings
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 3840x2160 --pos 3840x456 --rotate normal --output DP-5 --off --output DP-3 --off --output DP-4 --off --output DP-2 --off --output DP-1 --off --output DP-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal
nvidia-settings --assign CurrentMetaMode="DP-0:3840x2160_60 +0+0 { ForceFullCompositionPipeline = On },HDMI-0:3840x2160_60 +3840+0 { ForceFullCompositionPipeline=On }"

#Rice Stuff
#picom & #compton but not compton
exec ~/.config/dwm/statusBar.sh &
#sxhkd & #Hotkeys working == lul
#exec ~/.config/polybar/launch.sh & 
nitrogen --restore &
fcitx

#Run WM
exec /home/mip/.config/dwm/dwm
#exec emacs #I wish this was a joke lul.
#exec bspwm
