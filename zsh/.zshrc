#  __  __ ___ ____  ____    _________  _   _ ____   ____
# |  \/  |_ _|  _ \/ ___|  |__  / ___|| | | |  _ \ / ___|
# | |\/| || || |_) \___ \    / /\___ \| |_| | |_) | |    
# | |  | || ||  __/ ___) |  / /_ ___) |  _  |  _ <| |___ 
# |_|  |_|___|_|   |____/  /____|____/|_| |_|_| \_\\____|

export TERMINAL=tmux
export PAGER=less
export SHELL=zsh
export BROWSER=qutebrowser
export TBROWSER=lynx

neofetch

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Archive Extraction
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#Alias
alias gateway="ip route | grep default"

#Editor
if [ $(emacs --version | wc -m) != 0 ]; then
    export EDITOR=emacs
else
    export EDIROR=vim
fi
emacs () {; emacsclient -a '' -c -nw $* ;}
alias setvi="export EDITOR=vim   && echo 'The text editor is now set to vim.' && fileopenalias"
alias setem="export EDITOR=emacs && echo 'The text editor is now set to emacs.'&& fileopenalias"
alias setna="export EDITOR=nano  && echo 'What is whrong with you?' && fileopenalias"

#File Opening
fileopenalias () {
    alias o="$EDITOR"
    alias vrc="$EDITOR ~/.vimrc"
    alias zrc="$EDITOR ~/.zshrc"
    alias nba="$EDITOR ~/.config/newsboat/urls"
    alias tconf="$EDITOR ~/.tmux.conf"
    alias emrc="$EDITOR ~/.emacs.d/init.el"
}
fileopenalias

#File Jumps
alias jgh="cd ~/NAS/Git/Github/"
alias jdc="cd ~/Documents/"
alias jdw="cd ~/Downloads/"
alias jdo="cd ~/dotfiles/"
alias jco="cd ~/.config/"

#Lynx
alias lynx="torify lynx -cfg=~/.config/lynx/lynx.cfg -lss=~/.config/lynx/lynx.lss"
duck () {
    torify lynx -cfg=~/.config/lynx/lynx.cfg -lss=~/.config/lynx/lynx.lss "duckduckgo.com/lite?kd=-1&kp=-1&q=$*"
}
alias '?'="duck"

#Tuir (Trminal Reddit)
export TUIR_EDITOR=$EDITOR
export TUIR_BROWSER=$BROWSER
alias tuir="tuir --enable-media"

# ls/exa
# Makes shur exa is installed before aliasing it to ls.
# So this scrip can be used with out exa installed on the system.
if [ $(exa --version | wc -m) != 0 ]; then
    alias ll="exa -lh --git"
    alias ls="exa"
    alias la="exa -a"
    EXAIN=true
else
    alias ll="ls -lh --color"
    alias ls="ls --color"
    alias la="ls --color -A"
fi

#Git
gc () {; COMMITSTR="$*"; git commit -m $COMMITSTR; }
alias gp="git push"
alias gcls="git restore --staged *" # Clears the git staging
# Sets the repo remote to github.com/MrMip/<Dir Name>.git via ssh
alias gfix="git remote set-url origin git@github.com:MrMip/${PWD##*/}"  
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
alias xqu="xbps-query"

#Program Short cuts
alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c -f"
alias youtube-dl="bash youtube-dl"
alias nb="newsboat"
alias ta="tmux a"
alias speed="speedtest-cli"
alias vm="sudo virt-manager"
alias nas="sh ~/.config/mountnetworkdrive.sh"
alias tarball="tar -czvf"
alias cls="clear"


# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

#Vi mode
set -o vi mode

#bindkey '^h' _comp_options+=(globdots)	# Include hidden files.

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

#Startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source /home/mip/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

