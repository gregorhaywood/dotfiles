xrdb ~/.Xresources
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
setxkbmap -layout "gb"
xset b off
xset s 0 0
exec i3
