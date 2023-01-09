#!/usr/bin/env bash 

if [ $TERM == linux ]; then
	echo "Do you whant to start xorg? (Y,n)"; read INPUT

	if [[ $INPUT == [Nn]* ]]; then
				echo "Enjoy the tty :)"
	else
				echo "Starting xorg!"
				startx
	fi
fi
