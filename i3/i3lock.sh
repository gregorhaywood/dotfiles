#! /bin/sh

lock() {
 	~/dotfiles/i3/bar.sh  
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
    *)
        echo "Usage: $0 {lock|suspend|hibernate|off|on}"
        exit 2
esac


