#!/bin/sh

case $1 in
	dracula) https://raw.githubusercontent.com/Linuus/nord-qutebrowser/master/nord-qutebrowser.py ;;
	nord) wget https://raw.githubusercontent.com/Linuus/nord-qutebrowser/master/nord-qutebrowser.py && echo "Add config.source('nord-qutebrowser.py') at the end of your config.py file." ;;
	*) echo "Pick Nord or Dracuala" ;;
esac
