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
    *)
        echo "Usage: $0 {lock|suspend|hibernate}"
        exit 2
esac


