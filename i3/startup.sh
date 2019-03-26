#!/bin/sh

# Terminate already running bar instances
killall -q polybar
killall -q dunst
killall -q pulseaudio

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Start pulseaudio
pulseaudio --daemonize

# Start notifier 
dunst & 

# Launch polybar
polybar status &

# Start autolock
xautolock -time 10 -locker "~/.config/i3/i3lock.sh lock" -killtime 10 -killer "systemctl suspend" &
