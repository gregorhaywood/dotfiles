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


alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

export GREP_COLORS='ms=01;4;32:mc=01;4;32:sl=:cx=:fn=35:ln=32:bn=32:se=36'
eval "$(dircolors ~/dotfiles/dir_colors)"

# Universal Aliases 
alias python=python3
alias py=python
alias pip='python3 -m pip'
alias venv='. venv/bin/activate'
alias vim='nvim'
alias la='ls -la'
alias sudo='sudo '
alias mutt='neomutt'
alias day='redshift -P -O 6500'
alias night='redshift -P -O 3700'
alias pycheck='~/dotfiles/scripts/pycheck.sh'
alias dwarftherapist="sudo ~/dotfiles/scripts/dwarftherapist.sh"
alias key='setxkbmap gb'


function meeting() {
	printf "# Meeting on $(date "+%B %d %Y")\nIn Attendance: Gregor, $1 \n\n" >> $(date +%y_%m_%d.md); vim $( date +%y_%m_%d.md);
}

# Technically not an alias
# Entering a directory name changes to there
shopt -s autocd


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


# Bash Prompt
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function parse_dir_small {
	printf "[%+15s]\n" $(temp=$(printf "%+15s" $(pwd)); echo "${temp: -15}"|cut -d/ -f2-)
}

export PS1="\`parse_dir_small\`\[\e[32m\]\`parse_git_branch\`\[\e[m\] $ "
export PS2="...> "

# Source local stuff
if [ -f ~/.bash_local ]; then
        . ~/.bash_local 
fi




