#! /usr/bin/bash

# Get days since last update
mod=$(date -r /etc/pacman.d/updatetracker +%s)
now=$(date +%s)          
days=$(expr \( $now - $mod \) / 86400)

# Prompt updates if needed
if [ "$days" -gt 5 ]; then
  notify-send -u critical "Upgrade Time!"
fi
