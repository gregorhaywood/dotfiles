#!/bin/sh

# use SIGALARM to wait efficiently

pscircle \
	--root-pid=1 \
	--show-root=1 \
	--tree-rotate=true \
	--tree-rotation-angle=1.047 \
	--tree-center=-900:0 \
	--tree-sector-angle=2.0943 \
	--output=/tmp/wallpaper \
	--output-height=1080 \
	--output-width=1920 \
	--tree-radius-increment=170 \
	--dot-radius=4 \
	--dot-border-width=0 \
	--dot-color-max=FF0000FF \
	--dot-color-min=00FF00FF \
	--link-color-max=FF0000FF \
	--link-color-min=00FF00FF \
	--link-width=1 \
	--link-convexity=0.5 \
	--cpu-max-value=5 \
	--memory-min-value=0 \
	--memory-max-value=500000000 \
	--tree-font-size=12 \
	--tree-font-face=FantasqueSansMono-Regular \
	--cpulist-center=600:-400 \
	--memlist-center=600:400 \
	--background-color=262626 \
	--tree-font-color=BBBBBB \
	--toplists-font-color=BBBBBB \
	--toplists-pid-font-color=BBBBBB \
	--toplists-bar-color=BBBBBB \
	--toplists-font-size=12 

# feh --bg-scale /tmp/wallpaper
