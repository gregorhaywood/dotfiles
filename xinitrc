xrdb ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
setxkbmap -layout "gb"
xset b off
exec i3
