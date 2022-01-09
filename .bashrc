#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.scripts:$PATH
