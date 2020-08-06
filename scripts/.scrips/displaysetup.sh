#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 3840x2160 --pos 3840x456 --rotate normal --output DP-5 --off --output DP-3 --off --output DP-4 --off --output DP-2 --off --output DP-1 --off --output DP-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal

nvidia-settings --assign CurrentMetaMode="DP-0:3840x2160_60 +0+0 { ForceFullCompositionPipeline = On },HDMI-0:3840x2160_60 +3840+0 { ForceFullCompositionPipeline=On }"
nitrogen --restore
