#! /bin/sh

lock() {
	scrot /tmp/screen_locked.png
	convert /tmp/screen_locked.png -scale 10% -scale 1000% /tmp/screen_locked.png
	i3lock -i /tmp/screen_locked.png
}

case "$1" in
    lock)
        lock
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    off)
	xautolock -disable
	notify-send "Autolock Disabled"
	;;
    on)
	xautolock -enable
	notify-send "Autolock Enabled"
	;;
    off)
	xautolock -disable
	notify-send "Autolock Disabled"
	;;
    on)
	xautolock -enable
	notify-send "Autolock Enabled"
	;;
    *)
        echo "Usage: $0 {lock|suspend|hibernate}"
        exit 2
esac


