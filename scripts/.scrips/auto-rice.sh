#!/bin/sh

cd ~

#gtk
mkdir ~/.themes
cd ~/.themes 
git clone https://github.com/dracula/gtk
mv gtk Dracula
echo "Done Installing the Dracula gtk Theme"

#gtk icon
mkdir ~/.icons
cd ~/.icons
wget "https://github.com/dracula/gtk/files/5214870/Dracula.zip"
unzip Dracula.zip
rm Dracula.zip
echo "Done Installing the Dracula gtk icons"
