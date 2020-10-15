#  __  __ ___ ____  ____    _________  _   _ ____   ____
# |  \/  |_ _|  _ \/ ___|  |__  / ___|| | | |  _ \ / ___|
# | |\/| || || |_) \___ \    / /\___ \| |_| | |_) | |    
# | |  | || ||  __/ ___) |  / /_ ___) |  _  |  _ <| |___ 
# |_|  |_|___|_|   |____/  /____|____/|_| |_|_| \_\\____|

#Loads Tmux
#exec tmux

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
alias vm="sudo virt-manager"
alias nas="sh ~/.config/mountnetworkdrive.sh"
alias tarball="tar -czvf"
alias cls="clear"
alias rc="bash ~/.hiddenscrips/nrc.sh"
alias speed="speedtest-cli"
alias lock="i3lock -c 000000 -f -e"
alias gateway="ip route | grep default"
alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c -f"
alias youtube-dl="bash youtube-dl"
alias nb="newsboat"
alias ta="tmux a"

#Editor
if [ $(emacs --version | wc -m) != 0 ]; then
    export EDITOR=emacs
else
    export EDIROR=vim
fi
emacs () {
    emacsclient -a '' -c -nw $*
}
alias setvi="export EDITOR=vim   && echo 'The text editor is now set to vim.' && fileopenalias"
alias setem="export EDITOR=emacs && echo 'The text editor is now set to emacs.'&& fileopenalias"
alias setna="export EDITOR=nano  && echo 'What is whrong with you?' && fileopenalias"

#File Opening
fileopenalias () {
    alias vrc="$EDITOR ~/.vimrc"
    alias zrc="$EDITOR ~/.zshrc"
    alias nba="$EDITOR ~/.newsboat/urls"
    alias tconf="emacs ~/.tmux.conf"
}
fileopenalias

#Lynx
alias lynx="torify lynx -cfg=~/.config/lynx/lynx.cfg -lss=~/.config/lynx/lynx.lss"
duck () {
    torify lynx -cfg=~/.config/lynx/lynx.cfg -lss=~/.config/lynx/lynx.lss "duckduckgo.com/lite?kd=-1&kp=-1&q=$*"
}
alias '?'="duck"

#Git
alias gc="git commit -m'"
alias ga="git add . && git status"
alias gp="git push"
alias gcls="git restore --staged *" # Clears the git staging
# Sets the repo remote to github.com/MrMip/<Dir Name>.git via ssh
alias gfix="git remote set-url origin git@github.com:MrMip/${PWD##*/}.git" 

#Void Linux Xbps
alias xin="sudo xbps-install"
alias xup="sudo xbps-install -S"
alias xrm="sudo xbps-remove"
alias xro="sudo xbps-remove -o"
alias xqu="xbps-query"

# ls/exa
# Makes shur exa is installed before aliasing it to ls.
# So this scrip can be used with out exa installed on the system.
if [ $(exa --version | wc -m) != 0 ]; then
    alias ll="exa -lh --git"
    alias ls="exa"
    alias la="exa -a"
else
    alias ll="ls -lh --color"
    alias ls="ls --color"
    alias la="ls --color -A"
fi


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

