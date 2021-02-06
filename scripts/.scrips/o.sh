#!/bin/bash 

if [ -f $1 ] ; then
	case $1 in
		*.org)   emacsgui 	$1  ;;      
		*.mkv)   mpv	 	$1  ;;      
		*.mp4)   mpv	 	$1  ;;      
		*.pdf)   zathura	$1  ;;      
		*.ps)    zathura	$1  ;;      
		*.cbz)   zathura	$1  ;;      
		*.html)  surf		$1  ;;      
		*)       vim 		$1	;;
	esac
else
	echo "'$1' is not a valid file"
fi
