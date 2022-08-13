#!/bin/zsh

neofetch
ZSOURCE="$HOME/.zsource"

# Exports
source $ZSOURCE/exports 
exports

# Enable colors and change prompt:
autoload -U colors && colors
source $ZSOURCE/prompt && prompt

# Pretty-print man pages.
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[1;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

#Alias
source $ZSOURCE/package_manager_alias && package_manager_alias
source $ZSOURCE/complex_prog_alias && complex_prog_alias
source $ZSOURCE/simple_alias && simple_alias
source $ZSOURCE/git_alias_and_func && git_alias_and_func

# File Manager
source $ZSOURCE/filem && filem

# Arrive management 
source $ZSOURCE/ex 
source $ZSOURCE/pack 

#Functions to lauch emacs
source $ZSOURCE/emacs

# Functions to change the default settings.
editor () {; export EDITOR=$* && echo "The editor is set to $EDITOR" && fileOpenAlias;} 
pager () {; export PAGER=$* && echo "The pager is set to $PAGER"; } 
browser () {; export BROWSER=$* && echo "The browser is set to $BROWSER"; } 
tbrowser () {; export TBROESER=$* && echo "The terminal browser is set to $TBROESER"; } 
filem () {; export FILEM=$* && echo "The file manager is set to $FILEM" && setfileman; }

#Lynx
source ~/.zsource/lynx
duck () {; lynx "duckduckgo.com/lite?kd=-1&kp=-1&q=$*"; }
alias '?'="duck"

# File/Dir opeing 
source $ZSOURCE/o 
fileOpenAlias () {
    alias nba="$EDITOR ~/.config/newsboat/urls"
    alias tconf="$EDITOR ~/.tmux.conf"
	alias emrc="$EDITOR ~/.emacs.d/init.el"
	alias w="$EDITOR ~/Notes/index.md"
	sp () {; $EDITOR $(mktemp --suffix=.md) ;}
}
fileOpenAlias

#Tuir (Trminal Reddit)
export TUIR_EDITOR=$EDITOR
export TUIR_BROWSER=$BROWSER
alias tuir="tuir --enable-media"
alias reddit="tuir --enable-media"

# Plugins
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

source /home/mip/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/mip/gitStuffs/lua-language-server/3rd/luamake/luamake

autoload -Uz compinit
fpath+=~/.zfunc
