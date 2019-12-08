#! /bin/sh

lock() {
 	~/dotfiles/i3/lock.sh  
}

case "$1" in
    lock)
        lock
    	;;
    suspend)
      	lock; systemctl suspend; pkill mbsync
        ;;
    hibernate)
        lock && sleep 1; systemctl hibernate
        ;;
    *)
        echo "Usage: $0 {lock|suspend|hibernate}"
        exit 2
esac


