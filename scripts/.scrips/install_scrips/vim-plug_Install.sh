#!/bin/sh

case $1 in
	vim){
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	} ;; 
	nvim){
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
} ;;
	*){
		echo "Install for: vim or nvim"
	} ;;
esac
