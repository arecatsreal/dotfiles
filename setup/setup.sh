#!/bin/bash

#This is the setup for my dotfiles

echo "Witch profile whos you like to use?"
echo "	1. Desktop"
echo "	2. Laptop "
#echo "	3. Server "
read PROFILE

if [ $PROFILE -eq 1  ]
then
	echo "pf1" >> ./setup.conf

elif [ $PROFILE -eq 1  ]
then
	echo "pf2" >> ./setup.conf

else
	echo "Invaled input you must enter the number"
fi
 

