#! /bin/bash


# assumed setup:
# pipewire-alsa
# alsa-utils
# 
# wireplumber
# pipewire
# pipewire-audio
# 
# Not:
# * jack
# * pulseaudio


function vol {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function isMute {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 3 | cut -d ']' -f 1
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
	
	# amixer set Master toggle
	volume=`vol`
	case `isMute` in
		on)
			amixer set Master mute
			sym="audio-volume-muted-symbolic"
			;;
		off)
			amixer set Master unmute
			sym="audio-volume-high-symbolic"
			;;
	esac
	
	# notify-send -i "audio-volume-low-symbolic" -c sound -h "INT:value:$volume" "sound"
	notify-send -i "$sym" -c sound -h "INT:value:$volume" "sound"
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


