if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
export XDG_CONFIG_HOME="$HOME/.config"

alias atril='i3-swallow atril'
alias libreoffice='i3-swallow libreoffice'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

export GREP_COLORS='ms=01;4;32:mc=01;4;32:sl=:cx=:fn=35:ln=32:bn=32:se=36'

alias reboot='echo This machine is $hostname'
alias py=python
# alias pip='python3 -m pip'
alias venv='. venv/bin/activate'
alias vim='nvim'

fish_add_path ~/bin
fish_add_path ~/.cargo/bin
set -g fish_greeting

