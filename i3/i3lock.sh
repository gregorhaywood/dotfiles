#! /bin/sh

lock() {
 	~/dotfiles/i3/bar.sh  
}

case "$1" in
    lock)
        lock
    	;;
    suspend)
      	lock && sleep 1; systemctl suspend; systemctl --user restart mbsync.timer
        ;;
    hibernate)
        lock && sleep 1; systemctl hibernate
        ;;
    *)
        echo "Usage: $0 {lock|suspend|hibernate}"
        exit 2
esac


