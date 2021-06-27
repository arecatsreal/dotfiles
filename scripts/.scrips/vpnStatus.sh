#!/bin/sh

ip addr | grep proton0 > /dev/null && STATE=true 

if [ $STATE ]
then
    echo "Connected"
else
    echo "Disconnected"
fi
