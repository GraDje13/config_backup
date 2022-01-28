#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#custom functions
zathura() 
{
zathura $1 & disown $$
}

PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.scripts:$PATH
