#  __  __ ___ ____  ____    _________  _   _ ____   ____ 
# |  \/  |_ _|  _ \/ ___|  |__  / ___|| | | |  _ \ / ___|
# | |\/| || || |_) \___ \    / /\___ \| |_| | |_) | |    
# | |  | || ||  __/ ___) |  / /_ ___) |  _  |  _ <| |___ 
# |_|  |_|___|_|   |____/  /____|____/|_| |_|_| \_\\____|

#Loads Tmux
#exec tmux

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#Alias
alias ranger="~/python_programs/ranger/ranger.py"
alias rnager="~/python_programs/ranger/ranger.py"
alias vm="sudo virt-manager"
alias mofig="vim ~/.xmonad/xmonad.hs"
alias ifig="vim ~/.config/i3/config"
alias backup="deja-dup &"
alias nas="zsh ~/.hiddenscrips/mountnetworkdrive.sh"
alias tarball="tar -czvf"
alias untarball="tar -xzvf"
alias cls="clear"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias rn="mv -v"
alias pvim="bash ~/.hiddenscrips/mvpi.sh"
alias rm="rm -fr"
alias scr="cd ~/.hiddenscrips"
alias pcoff="reboot --powerdown"
alias rc="bash ~/.hiddenscrips/nrc.sh"
alias speed="speedtest-cli"
alias mon2cam="~/./.hiddenscrips/Mon2Cam/Mon2Cam.sh"
alias tconf="vim ~/.tmux.conf"
alias lock="i3lock -c 000000 -f -e"
alias unity=" ~/./.Unity/UnityHub.AppImage &"
alias gateway="ip route | grep default"

#Open Nots and Todo
alias notes=""
alias todo="vim ~/Documents/todo.md"

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#bindkey '^h' _comp_options+=(globdots)	# Include hidden files.

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Load zsh-syntax-highlighting MUST BE LAST!!
source /home/mip/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting MUST BE LAST!!
source /home/mip/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/mip/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/mip/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
