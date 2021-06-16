#!/bin/bash

# Dis for voidlinux so may not work on other distros

sudo xbps-install pinentry-gtk
touch ~/.gnupg/gpg-agent.conf
echo -n "pinentry-program /usr/bin/pinentry-gtk-2" >> ~/.gnupg/gpg-agent.conf

echo "Reloading gpg-agent"
gpg-connect-agent reloadagent /bye
