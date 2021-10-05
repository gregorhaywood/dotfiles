# .bashrc

# Define standard aliases and preferances
# Can be overwritten in ~/.bash_local
# .bash_profile should be defined locally. It
# should source this file:
# if [ -f ~/.bashrc ]; then
#         . ~/.bashrc
# fi
# It will also define $PATH if it is not the default.


# Search history on arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# assumed config dir
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:~/bin

alias atril='i3-swallow atril'
alias libreoffice='i3-swallow libreoffice'
alias clang='gcc'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

export GREP_COLORS='ms=01;4;32:mc=01;4;32:sl=:cx=:fn=35:ln=32:bn=32:se=36'
eval "$(dircolors ~/dotfiles/dir_colors)"

# Universal Aliases 
alias reboot='echo This machine is $HOSTNAME'
alias python=python3
alias py=python
alias pip='python3 -m pip'
alias venv='. venv/bin/activate'
alias vim='nvim'
alias la='ls -la'
alias sudo='sudo '
alias mutt='neomutt'
alias pycheck='~/dotfiles/scripts/pycheck.sh'
alias dwarftherapist="sudo ~/dotfiles/scripts/dwarftherapist.sh"
alias key='setxkbmap gb'


function meeting() {
	printf "# Meeting on $(date "+%B %d %Y")\nIn Attendance: Gregor, $1 \n\n" >> $(date +%y_%m_%d.md); vim $( date +%y_%m_%d.md);
}

# Vars 
export EDITOR=nvim
export VISUAL=$EDITOR
export TERMINAL=urxvt
export SHELL=/bin/bash
export BROWSER=brave

# GPG
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
export GPG_AGENT_INFO="Set for Mutt"
export KEY="C6DBAA2E"

# Source local stuff
if [ -f ~/.bash_local ]; then
        . ~/.bash_local 
fi

. "$HOME/.cargo/env"

eval "$(starship init bash)"
