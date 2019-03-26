# .bashrc

# Define standard aliases and preferances
# Can be overwritten in ~/.bash_local
# .bash_profile should be defined locally. It
# should source this file:
# if [ -f ~/.bashrc ]; then
#         . ~/.bashrc
# fi
# It will also define $PATH if it is not the default.




# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent? "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi

# assumed config dir
export XDG_CONFIG_HOME="$HOME/.config"

# GPG
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null



# Universal Aliases 
alias python=python3
alias py=python
alias pip='python3 -m pip'
alias venv='. venv/bin/activate'                                                                                                                
alias la='ls -la'                                                                                                                                    

# Vars 
export EDITOR=vi
export TERMINAL=urxvt
export SHELL=/bin/bash




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
# Mark Ranger 
if [ -n "$RANGER_LEVEL" ]; then export PS1="[Ranger]$PS1"; fi

export PS2="...> "

# Source local stuff
if [ -f ~/.bash_local ]; then
        . ~/.bash_local 
fi




