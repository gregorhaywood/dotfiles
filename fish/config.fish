if status is-interactive
    # Commands to run in interactive sessions can go here
end

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  exec sway
end

starship init fish | source

export XDG_CONFIG_HOME="$HOME/.config"
export GREP_COLORS='ms=01;4;32:mc=01;4;32:sl=:cx=:fn=35:ln=32:bn=32:se=36'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias py=python

set -g fish_greeting

