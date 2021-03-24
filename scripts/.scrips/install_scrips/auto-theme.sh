#!/bin/sh

cd ~
if ! test -d ~/.themes; then
	mkdir ~/.themes
fi
if ! test -d ~/.icons; then
	mkdir ~/.icons/ 
fi

case $1 in 
	dracula){
		#gtk
		cd ~/.themes 
		git clone https://github.com/dracula/gtk
		mv gtk Dracula
		echo "Done Installing the Dracula gtk Theme"

		#gtk icon
		cd ~/.icons
		wget "https://github.com/dracula/gtk/files/5214870/Dracula.zip"
		unzip Dracula.zip
		rm Dracula.zip
		echo "Done Installing the Dracula gtk icons"
	} ;;
	nord){
		#gtk
		cd ~/.themes/
		wget "https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz"
		tar xf Nordic-darker.tar.xz
		rm Nordic-darker.tar.xz
		echo "Done Installing Nordic-darker gtk Theme"

		#gtk icons 
		cd ~/.icons/
		# Source https://www.gnome-look.org/p/1473069/ 
		wget 'https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTEyMjk0MzciLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6Ijc1YjU1ZWU2YWZhNmJkY2QwYjkxZTE3NWFjYWNjNzNiM2NlYzc1YzhlMmMxMTIyNjY5YjQ1ZmQzYmQ1NWRiMWM1NjBhMzRkNmI0Yzk4MjAyNWY0ZWM1NDcyNmUxNzVkYmQyMTE1YjAzYTRkZTZjMTA0YTM3MjUzNDA4NzZhNGZmIiwidCI6MTYxNjIyMDA1Mywic3RmcCI6ImM3Y2FmZWZhNGI1ZjIyZTNkNGQyYTE5MzMzYjIzZGRmIiwic3RpcCI6IjEwNC4yNDQuNzIuMjQ4In0.dh2TAZyfhJjmy-PJ50HyMkDhA4Om4uhrFUzFbgGBC9g/Nordic-Darker-mod.tar.xz'
		tar xf Nordic-Darker-mod.tar.xz 
		rm Nordic-Darker-mod.tar.xz
		echo "Done Installing the NordArc gtk Icons"
		
		#Kvantum
		if test -d ~/.config/Kvantum/; then 
			cd ~/.config/Kvantum/ 
			mkdir Nordic-darker
			cd Nordic-darker
			wget "https://raw.githubusercontent.com/EliverLara/Nordic/master/kde/kvantum/Nordic-Darker/Nordic-Darker.kvconfig"
			wget "https://raw.githubusercontent.com/EliverLara/Nordic/master/kde/kvantum/Nordic-Darker/Nordic-Darker.svg"
			mv Nordic-Darker.kvconfig Nordic.kvconfig
			mv Nordic-Darker.svg Nordic.svg
			echo "Done Installing Kavantum/qt theme"
		else
			echo "Plz Install Kavantum for qt theme"
		fi
	} ;; 
esac
