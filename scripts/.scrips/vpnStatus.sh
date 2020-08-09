#!/bin/sh

STATE=$(ip addr | grep proton0 | wc -l)

if [ $STATE -gt 0 ]
then
    echo "Connected"
else
    echo "Disconnected"
fi
