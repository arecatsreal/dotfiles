#!/bin/zsh
#  __  __ _____ _____  _  _____   ______ _____ _    _ _____   _____
# |  \/  |_   _|  __ \( )/ ____| |___  // ____| |  | |  __ \ / ____|
# | \  / | | | | |__) |/| (___      / /| (___ | |__| | |__) | |
# | |\/| | | | |  ___/   \___ \    / /  \___ \|  __  |  _  /| |
# | |  | |_| |_| |       ____) |  / /__ ____) | |  | | | \ \| |____
# |_|  |_|_____|_|      |_____/  /_____|_____/|_|  |_|_|  \_\\_____|
neofetch

# Exports
source $HOME/.zsource/exports 
exports

# Enable colors and change prompt:
autoload -U colors && colors
source $HOME/.zsource/prompt 
prompt

#Alias
alias cdl="rm -fr ~/Downloads/*"
alias tmloop="while true; do; date +"%T" && sleep 1; done"
alias reload="source ~/.zshrc && rm ./1"

#Networking Alias
alias gateway="ip route | grep default"
alias retor="sudo sv restart tor"
alias exip="curl -L ifconfig.me"
alias tping="torify ping"

#Functions to lauch emacs
source $HOME/.zsource/emacs

# Functions to change the default settings.
editor () {; export EDITOR=$* && echo "The editor is set to $EDITOR" && fileopenalias;} 
pager () {; export PAGER=$* && echo "The pager is set to $PAGER"; } 
browser () {; export BROWSER=$* && echo "The browser is set to $BROWSER"; } 
tbrowser () {; export TBROESER=$* && echo "The terminal browser is set to $TBROESER"; } 
filem () {; export FILEM=$* && echo "The file manager is set to $FILEM"; }

# Arrive management 
source $HOME/.zsource/ex 
source $HOME/.zsource/pack 

#File Opening
source $HOME/.zsource/o 
fileopenalias () {
    alias vrc="$EDITOR ~/.vimrc"
    alias zrc="$EDITOR ~/.zshrc"
    alias nba="$EDITOR ~/.config/newsboat/urls"
    alias tconf="$EDITOR ~/.tmux.conf"
    alias emrc="$EDITOR ~/.emacs.d/init.el"
	alias dwmc=" $EDITOR ~/.config/dwm/config.def.h && cd ~/.config/dwm"
}
fileopenalias

#File Jumps
alias jgh="cd ~/NAS/Git/Github/"
alias jdc="cd ~/Documents/"
alias jdw="cd ~/Downloads/"
alias jdo="cd ~/dotfiles/"
alias jco="cd ~/.config/"

#Lynx
source ~/.zsource/lynx
duck () {; lynx "duckduckgo.com/lite?kd=-1&kp=-1&q=$*"; }
alias '?'="duck"

# File Manager
setfileman() {
	case $FILEM in 
		f){
			f() {
				fff "$@"
				cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
			}
			export FFF_LS_COLORS=1
		};;
		l){
			l () {
				LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
				LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
				if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" -eq 1  ]; then
					cd "$(cat "$LF_TEMPDIR/lastdir")"
				fi
				rm -r "$LF_TEMPDIR"
				unset LF_TEMPDIR							
			}
		};;
		*) echo "There is no file manager set."	;;
	esac
}
setfileman
source $HOME/.zsource/lf-icons 

#Tuir (Trminal Reddit)
export TUIR_EDITOR=$EDITOR
export TUIR_BROWSER=$BROWSER
alias tuir="tuir --enable-media"
alias reddit="tuir --enable-media"

# ls/exa
# Makes shur exa is installed before aliasing it to ls.
# So this scrip can be used with out exa installed on the system.
EXAIN=false
exa --version 2> /dev/null > /dev/null && {
    alias ll="exa -lh --git"
    alias lla="exa -lha --git"
    alias ls="exa"
    alias la="exa -a"
    EXAIN=true
}
if [ $EXAIN = false ]; then
    alias ll="ls -lh --color"
    alias lla="ls -lha --color"
    alias ls="ls --color"
    alias la="ls --color -A"
fi

# cat/bat
BATIN=false
bat --version 2> /dev/null > /dev/null && {
	alias cat="bat -n"
	export BAT_THEME="Dracula"
	export MANPAGER="bat -n"
    BATIN=true
}
if [ $BATIN = false ]; then
	alias cat="cat -n"
fi
# Rip grep/grp
RGIN=false
rg --version 2> /dev/null > /dev/null && {
	alias g="rg"
	RGIN=true
}
if [ $RGIN = false ]; then
	alias g="grep"
fi

#Git
gc () {; COMMITSTR="$*"; git commit -m $COMMITSTR; }
alias gca="git commit --amend"
alias gp="git push"
alias gcls="git restore --staged *" # Clears the git staging
# Sets the repo remote to github.com/MrMip/<Dir Name> via ssh
alias gfix="git remote set-url origin git@github.com:MrMip/"  
alias gs="git status"
ga () {
    if [ $( echo $1 | wc -w ) = 0 ]; then
	git add .
	git status
    else
	git add $1
	git status
fi
}

#Package Manager aliass 

# Void Linux 
alias xin="sudo xbps-install"
alias xup="sudo xbps-install -S -u"
alias xrm="sudo xbps-remove"
alias xro="sudo xbps-remove -o"
alias xqu="xbps-query -s"

# Arch Linux 
YAYIN=false
yay --version 2> /dev/null > /dev/null && {
	alias pin="yay -S"
	alias pup="yay -Syu"
	alias prm="yay -Rs"
	alias pro="yay -Qtdq | yay -Rns -"
	alias pqu="yay -Ss"
	YAYIN=true
}
if [ $YAYIN = false ]; then
	alias pin="sudo pacman -S"
	alias pup="sudo pacman -Syu"
	alias prm="sudo pacman -Rs"
	alias pro="sudo pacman -Qtdq | sudo pacman -Rns -"
	alias pqu="pacman -Ss"
fi

# Debian
alias ain="sudo apt install"
alias aup="sudo apt update && apt upgrade"
alias arm="sudo apt remove"
alias aqu="apt search"

# Bedrock linux 
alias pmqu="pmm-query -R -s"
if [ $YAYIN = false ]; then
	alias pmup="sudo pmm-install -S -u"
else
	alias pmup="sudo pmm-install -S -u && yay -Syu"
fi

#Program Short cuts
alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c -f"
alias nb="newsboat"
alias ta="tmux a"
alias speed="speedtest-cli"
alias vm="sudo virt-manager"
alias nas="sh ~/.config/mountnetworkdrive.sh"
tarball () {; tar -czvf $1.tar.gz $1; }
tardir() {; for i in *; do tar -czf $i.tar.gz $i; rm -fr $i; done; }
alias cls="clear"
alias mu="ncmpcpp"
play () {; mpv --fs "$*"; }
alias disk="df -h -t ext4"
alias '..'="cd .."

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

#Vi mode
set -o vi mode

# Bedrock fix
if [ TERM != "linux" ];then
	LD_PRELOAD=""
fi

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

source /home/mip/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
