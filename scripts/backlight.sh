#! /bin/sh

F='/sys/class/backlight/intel_backlight/brightness'
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
STRIDE=$(( $MAX / 10 ))

i() {
	typeset -i B=$(( $(cat $F)  + $STRIDE ))
	echo $(( $MAX >= $B  ? $B : $MAX )) > $F
}

d() {
	typeset -i B=$(( $(cat $F)  - $STRIDE ))
	echo $(( 0 <= $B  ? $B : 0 )) > $F
}

case "$1" in
    inc)
        i
    	;;
    dec)
        d
        ;;
    *)
        exit 2
esac


