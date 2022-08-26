#! /bin/bash


function vol {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

up() {
	amixer set Master 3%+
	volume=`vol`
	notify-send -i "audio-volume-high-symbolic" -c sound -h "INT:value:$volume" "sound"
}

down() {
	amixer set Master 3%-
	volume=`vol`
	notify-send -i "audio-volume-low-symbolic" -c sound -h "INT:value:$volume" "sound"
}


mute() {
	(amixer get Speaker | grep off > /dev/null && 
		amixer -q set Master toggle && 
		amixer -q set Headphone unmute) || 
		(amixer -q set Master toggle && 
		amixer -q set Speaker unmute)
	volume=`vol`
	
	notify-send -i "audio-volume-muted-symbolic" -c sound -h "INT:value:$volume" "sound"
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


