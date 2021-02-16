#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --primary --mode 3840x2160 --pos 2160x1680 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --mode 3840x2160 --pos 0x0 --rotate left --output DP-3 --off --output DP-4 --off --output DP-5 --off

#nvidia-settings --assign CurrentMetaMode="DP-2:3840x2160_60 +0+0 { ForceFullCompositionPipeline = On },HDMI-0:3840x2160_60 +3840+0 { ForceFullCompositionPipeline=On }"
nitrogen --restore
