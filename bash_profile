#
# ~/.bash_profile
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx &> /dev/null
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
