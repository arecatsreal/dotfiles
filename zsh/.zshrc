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

#Alias
alias ranger="~/python_programs/ranger/ranger.py"
alias rnager="~/python_programs/ranger/ranger.py"
alias vm="sudo virt-manager"
alias mofig="emacs ~/.xmonad/xmonad.hs"
alias ifig="emacs ~/.config/i3/config"
alias backup="deja-dup &"
alias nas="sh ~/.config/mountnetworkdrive.sh"
alias tarball="tar -czvf"
alias untarball="tar -xzvf"
alias cls="clear"
alias vrc="emacs ~/.emacsrc"
alias zrc="emacs ~/.zshrc"
alias pemacs="bash ~/.hiddenscrips/mvpi.sh"
alias scr="cd ~/.hiddenscrips"
alias pcoff="reboot --powerdown"
alias rc="bash ~/.hiddenscrips/nrc.sh"
alias speed="speedtest-cli"
alias mon2cam="~/./.hiddenscrips/Mon2Cam/Mon2Cam.sh"
alias tconf="emacs ~/.tmux.conf"
alias lock="i3lock -c 000000 -f -e"
alias unity=" ~/./.Unity/UnityHub.AppImage &"
alias gateway="ip route | grep default"
#alias pacman="yay"
alias ll="ls -lh"
alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c -f"
alias youtube-dl="bash youtube-dl"
alias nb="newsboat"
alias nba="emacs ~/.newsboat/urls"
alias emacs="emacsclient -a '' -c"

#Open Nots and Todo
alias notes=""
alias todo="emacs ~/Documents/todo.md"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#bindkey '^h' _comp_options+=(globdots)	# Include hidden files.

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

#Startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source /home/mip/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
