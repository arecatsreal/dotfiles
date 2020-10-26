#!/bin/sh

setxkbmap
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'clear lock'
