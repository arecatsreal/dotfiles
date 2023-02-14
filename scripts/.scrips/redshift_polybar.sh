#!/bin/sh

ACTIVE=false
pgrep reashift > /dev/null 2> /dev/null && ACTIVE=true

if [ $ACTIVE ]; then
	rs.sh -p | grep "Color temperature: " | sed 's/Color temperature: //'
fi
