#!/bin/bash

swayidle -w timeout 1800 'swaylock' \
            timeout 2400 'hyprctl dispatch dpms off; systemctl suspend' \
            resume 'hyprctl dispatch dpms on' \
            after-resume 'hyprctl dispatch dpms on' \
            before-sleep 'swaylock' &
