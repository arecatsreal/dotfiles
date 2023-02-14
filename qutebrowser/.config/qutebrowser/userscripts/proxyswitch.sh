#!/bin/sh

MENU=dmenu

NEW_PROXY=$(printf "system\ntor\ni2p" | $MENU)

case $NEW_PROXY in
	"tor")
		echo "set content.proxy socks://localhost:9050/" >> "$QUTE_FIFO"
		;;
	"i2p")
		echo "set content.proxy socks://localhost:4444/" >> "$QUTE_FIFO"
		;;
	*)
		echo "set content.proxy system" >> "$QUTE_FIFO"
		;;
esac
