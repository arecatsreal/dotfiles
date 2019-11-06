#!/bin/bash

#This is the setup for my dotfiles

rm setup.conf >> /dev/null
touch setup.conf

PM="dnf"
echo "*********************************************"
echo "*  MAKE SHURE YOU ARE RUNING THIS AS ROOT!  *"
echo "*                                           *"
echo "*         Press Enter to Continue...        *"
echo "*********************************************"
echo
read bob

install(){

	$PM install -y xmonad xmobar zsh tmux vim git
	git clone https://github.com/LukeSmithxyz/st.git ~/
	mkdir ~/python_programs
	git clone https://github.com/ranger/ranger.git ~/python_programs
	
	cp .vimrc ~/
	cp .zshrc ~/

	cp -r scripts ~/
	mv -v ~/scripts .hiddenscripts
	rm ~/.hiddenscripts/README.md

	cp config.h ~/st/

	cp .tmux.conf ~/

	cp xmonad.hs ~/.xmonad/
}



echo "Witch profile whos you like to use?"
echo "	1. Desktop"
echo "	2. Laptop "
#echo "	3. Server "
read PROFILE

if [ $PROFILE -eq 1  ]
then
	echo "pf1" >> ./setup.conf
	install 

elif [ $PROFILE -eq 2  ]
then
	echo "pf2" >> ./setup.conf

else
	echo "Invaled input you must enter the number"
fi
 

