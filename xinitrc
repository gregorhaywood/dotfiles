xrdb ~/.Xresources
setxkbmap -layout "gb"
xset b off
xset s 0 0
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
