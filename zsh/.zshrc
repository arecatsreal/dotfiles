# |  \/  |_ _|  _ \/ ___|  |__  / ___|| | | |  _ \ / ___| 
# | |\/| || || |_) \___ \    / /\___ \| |_| | |_) | |    
# | |  | || ||  __/ ___) |  / /_ ___) |  _  |  _ <| |___ 
# |_|  |_|___|_|   |____/  /____|____/|_| |_|_| \_\\____|
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

#Networking Alias
alias gateway="ip route | grep default"
alias retor="sudo sv restart tor"
alias exip="curl -L ifconfig.me"

#Function to lauch emacs
emacs () {; emacsclient -a '' -c -nw $* ;} # tui
emacsgui () {; emacsclient -a '' -c $* ;} # gui

# Functions to change the default settings.
editor () {; export EDITOR=$* && echo "The editor is set to $EDITOR" && fileopenalias;} 
pager () {; export PAGER=$* && echo "The pager is set to $PAGER"; } 
browser () {; export BROWSER=$* && echo "The browser is set to $BROWSER"; } 
tbrowser () {; export TBROESER=$* && echo "The terminal browser is set to $TBROESER"; } 

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
alias watch="f ~/NAS/Media"

#Lynx
source ~/.zsource/lynx
duck () {; lynx "duckduckgo.com/lite?kd=-1&kp=-1&q=$*"; }
alias '?'="duck"

#fff 
f() {
	    fff "$@"
		    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"			
}
export FFF_LS_COLORS=1

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
