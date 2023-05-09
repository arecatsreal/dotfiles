#!/bin/zsh

# Done to keep things organized and all in one place.
ZSOURCE="$HOME/.zsource"
for f in $ZSOURCE/*; do source "$f"; done


# Load Angular CLI autocompletion.
source <(ng completion script)
