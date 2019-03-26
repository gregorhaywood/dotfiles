#! /bin/sh


up() {
	amixer set Master 3%+
}

down() {
	amixer set Master 3%-
}


mute() {
	(amixer get Speaker | grep off > /dev/null && 
		amixer -q set Master toggle && 
		amixer -q set Headphone unmute) || 
		(amixer -q set Master toggle && 
		amixer -q set Speaker unmute)
}

case "$1" in
    up)
        up
    	;;
    down)
		down
        ;;
    mute)
		mute	
	;;
    *)
        exit 2
esac


