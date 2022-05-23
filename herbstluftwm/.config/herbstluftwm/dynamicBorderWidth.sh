#!/bin/bash

source $HOME/.config/herbstluftwm/hc

dynamicBorderWidth () {
	INIT_CLIENTS=$(hc sprintf X %s tags.focus.client_count echo X)
	while [ $(hc sprintf X %s tags.focus.client_count echo X) = $INIT_CLIENTS ]; do
		I=$(($I + 1))
		if [ $I = 100 ]; then
			exit 2
		fi
	done
	CLIENTS=$(hc sprintf X %s tags.focus.client_count echo X)
	if [ $CLIENTS -lt 2 ]; then
		hc attr theme.border_width 0
		echo "Setting Border width to 0"
	else
		hc attr theme.border_width 1
		echo "Setting Border width to 1"
	fi
}
