#!/bin/fish

function lock
	swaylock -f --screenshot \
		--effect-blur 5x5 \
		--effect-vignette 0:1 \
		--indicator \
		--indicator-radius 150 \
		--indicator-thickness 15 \
		--inside-color 00000000 \
		--separator-color 00000000 \
		--text-color 00000000 \
		--text-clear-color 00000000 \
		--text-ver-color  00000000 \
		--text-wrong-color 00000000 \
		--ring-color 14b36e \
		--ring-clear-color 8a35f1 \
		--ring-ver-color 8476ea \
		--ring-wrong-color f86844 \
		--inside-clear-color 00000000 \
		--inside-ver-color 00000000 \
		--inside-wrong-color 00000000 \
		--key-hl-color 6f44f0 \
		--line-color 00000000 \
		--line-clear-color 00000000 \
		--line-ver-color 00000000 \
		--line-wrong-color 00000000 \
		--fade-in 0.2
end


switch $argv
	case lock
		lock
	case suspend
		lock; systemctl suspend
	case hibernate
		lock && sleep 1; systemctl hibernate
	case "*"
        echo "Usage: $0 {lock|suspend|hibernate}"
        exit 2
end

