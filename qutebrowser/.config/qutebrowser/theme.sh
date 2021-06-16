#!/bin/sh

case $1 in
	dracula)  git clone https://github.com/dracula/qutebrowser-dracula-theme.git dracula ;;
	nord) wget https://raw.githubusercontent.com/Linuus/nord-qutebrowser/master/nord-qutebrowser.py && echo "Add config.source('nord-qutebrowser.py') at the end of your config.py file." ;;
	*) echo "Pick Nord or Dracuala" ;;
esac
