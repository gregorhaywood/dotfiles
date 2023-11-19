#! /bin/bash


function vol {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ |cut -d '.' -f 2
}

function isMute {
	wpctl get-volume @DEFAULT_AUDIO_SINK@ |cut -d ' ' -f 3
}

up() {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+
	volume=`vol`
	notify-send -i "audio-volume-high-symbolic" -c sound -h "INT:value:$volume" "sound"
}

down() {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-
	volume=`vol`
	notify-send -i "audio-volume-low-symbolic" -c sound -h "INT:value:$volume" "sound"
}

mute() {
		volume=`vol`
	mute=`isMute`
	if [ "$mute" == "[MUTED]" ]; then
		wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
		sym="audio-volume-high-symbolic"
	else
		wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
		sym="audio-volume-muted-symbolic"
	fi	
	notify-send -i $sym -c sound -h "INT:value:$volume" "sound"
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


