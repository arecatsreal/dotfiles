#!/bin/zsh
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
alias ip="ip --color=auto"

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
    alias vrc="$EDITOR ~/.config/nvim/init.vim"
    alias zrc="$EDITOR ~/.zshrc"
    alias nba="$EDITOR ~/.config/newsboat/urls"
    alias tconf="$EDITOR ~/.tmux.conf"
    alias emrc="$EDITOR ~/.emacs.d/init.el"
	#alias dwmc=" $EDITOR ~/.config/dwm/config.def.h && cd ~/.config/dwm"
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
			source ~/.config/lf-shellcd/lf-shellcd
			alias m="l ~/.local/share/shortcuts/"
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
	alias bat="bat -n"
	export BAT_THEME="Dracula"
	export MANPAGER="bat -n"
    BATIN=true
}
batcat --version 2> /dev/null > /dev/null && {
	alias cat="batcat -n"
	alias bat="batcat -n"
	export BAT_THEME="base16"
	export MANPAGER="batcat -n"
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

# Top
TOP=top
bpytop --version 2> /dev/null > /dev/null && TOP=bpytop 
if [ "$TOP" != "bpytop" ]; then; htop --version 2> /dev/null > /dev/null && TOP=htop; fi
alias top="$TOP"

#Git
gc () {; COMMITSTR="$*"; git commit -m $COMMITSTR; }
alias gca="git commit --amend"
alias gp="git push"
alias gcls="git restore --staged *" # Clears the git staging
# Sets the repo remote to github.com/arecatsreal/<Dir Name> via ssh
#gfix () {; git remote set-url origin git@github.com:arecatsreal/$1; }  
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
# Github Stuff
alias ghrc="gh repo create"

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
APTITUDEIN=false
aptitude --version 2> /dev/null > /dev/null && {
	alias ain="sudo aptitude install"
	alias aup="sudo aptitude update && sudo aptitude safe-upgrade"
	alias aupd="sudo aptitude update"
	alias aupg="sudo aptitude full-upgrade"
	alias arm="sudo aptitude remove"
	alias aro="sudo aptitude autoremove"
	alias aqu="aptitude search"
	alias apt="aptitude"
	APTITUDEIN=true
}
if [ $APTITUDEIN = false ]; then
	alias ain="sudo apt install"
	alias aup="sudo apt update && sudo apt upgrade"
	alias aupd="sudo apt update"
	alias aupg="sudo apt upgrade"
	alias arm="sudo apt remove"
	alias aro="sudo apt autoremove"
	alias aqu="apt search"
fi
	
alias ap="apt-file find"
alias apu="apt-file update"

# Bedrock linux 
alias pmqu="pmm-query -R -s"
if [ $YAYIN = false ]; then
	alias pmup="sudo pmm-install -S -u"
else
	alias pmup="sudo pmm-install -S -u && yay -Syu"
fi

#Program Short cuts
alias vpn="sudo protonnvpn"
alias vpnc="sudo protonvpn c -f"
alias nb="newsboat"
alias ta="tmux a"
alias speed="speedtest-cli"
alias vm="sudo virt-manager"
alias nas="sh ~/.config/mountnetworkdrive.sh"
tarball () {; tar -czvf $1.tar.gz $1; }
tardir() {; for i in *; do tar -czf $i.tar.gz $i; rm -fr $i; done; }
alias cls="clear" # The one thing windows did right
play () {; mpv --fs "$*"; }
alias disk="df -h -t ext4"
alias '..'="cd .."
alias gr="go run *.go"
alias getdes="youtube-dl --get-description '$(xclip -o -selection clips)' | cat"
alias hc="herbstclient"
alias cp="cp -r"
alias ra="xsel | espeak"
alias pri="nc -q 0 192.168.1.61 9100 <"
alias ar="aria2c"
alias bs="barriers -c ~/.config/barrier/barrier.conf"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Bedrock fix
#if [ TERM != "linux" ];then
#	LD_PRELOAD=""
#fi

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

source /home/mip/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
