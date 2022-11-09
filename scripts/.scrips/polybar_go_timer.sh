#!/bin/sh

pgrep -x go-timer > /dev/null && {
	cat /tmp/go-timer
	exit 0
}
test -f /tmp/go-timer && rm /tmp/go-timer
