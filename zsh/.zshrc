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
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#Alias
alias cdl="rm -fr ~/Downloads/*"
alias tmloop="while true; do; date +"%T" && sleep 1; done"
alias reload="source ~/.zshrc"

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

#File Opening
source $HOME/.zsource/o 
source $HOME/.zsource/ex 
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

#Tuir (Trminal Reddit)
export TUIR_EDITOR=$EDITOR
export TUIR_BROWSER=$BROWSER
alias tuir="tuir --enable-media"
alias reddit="tuir --enable-media"

# ls/exa
# Makes shur exa is installed before aliasing it to ls.
# So this scrip can be used with out exa installed on the system.
if [ $(exa --version | wc -m) != 0 ]; then
    alias ll="exa -lh --git"
    alias lla="exa -lh --git"
    alias ls="exa"
    alias la="exa -a"
    EXAIN=true
else
    alias ll="ls -lh --color"
    alias lla="ls -lh --color"
    alias ls="ls --color"
    alias la="ls --color -A"
fi

# cat/bat
if [ $(bat --version | wc -c) > 1 ];then
	alias cat="bat -n"
	export BAT_THEME="Dracula"
	export MANPAGER="bat -n"
else
	alias cat="cat -n"
fi

#Git
gc () {; COMMITSTR="$*"; git commit -m $COMMITSTR; }
alias gp="git push"
alias gcls="git restore --staged *" # Clears the git staging
# Sets the repo remote to github.com/MrMip/<Dir Name> via ssh
alias gfix="git remote set-url origin git@github.com:MrMip/$1"  
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

#Void Linux Xbps
alias xin="sudo xbps-install"
alias xup="sudo xbps-install -S -u"
alias xrm="sudo xbps-remove"
alias xro="sudo xbps-remove -o"
alias xqu="xbps-query -s"

#Program Short cuts
alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c -f"
alias nb="newsboat"
alias ta="tmux a"
alias speed="speedtest-cli"
alias vm="sudo virt-manager"
alias nas="sh ~/.config/mountnetworkdrive.sh"
alias tarball="tar -czvf"
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

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

source /home/mip/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
