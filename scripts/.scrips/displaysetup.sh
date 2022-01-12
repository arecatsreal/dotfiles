#!/bin/sh

xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output DP-2 --mode 3840x2160 --pos 1400x0 --rotate normal --output DP-3 --off --output DP-4 --mode 1400x1050 --pos 0x900 --rotate normal --output DP-5 --off

#xrandr --output DVI-D-0 --off --output HDMI-0 --mode 3840x2160 --pos 3840x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-5 --off

nvidia-settings --assign CurrentMetaMode="DP-2:3840x2160_60 +0+0 { ForceFullCompositionPipeline = On },HDMI-0:3840x2160_60 +3840+0 { ForceFullCompositionPipeline=On }"

#nvidia-settings -a CurrentMetaMode="DP-2: 3840x2160_60 +1400+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-4: 1400x1050_60 +0+0"

#nvidia-settings -a CurrentMetaMode="DP-2: 3840x2160_60 +1440+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-4: 1440x1080_60 @1440x1080 +0+0 {ViewPortIn=1440x1080, ViewPortOut=1440x1080+0+0}"
