#!/bin/zsh

# Done to keep things organized and all in one place.
export ZSOURCE="$HOME/.zsource"
for f in $ZSOURCE/*; do source "$f"; done

fileOpenAlias # Need to be last thing run
