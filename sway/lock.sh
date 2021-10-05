#!/bin/sh

B='#000501aa'   # black
C='00050100'    # clear
T='#8A35F1'     # text
D='#4d14dc'     # ring colour
H='#8A35F1'     # highlighy colour
W='#f86844'     # wrong
V='#14b36e'     # verifying


i3lock \
--color=$C        \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$C        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$H       \
--bshlcolor=$W        \
\
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A %B %Y" \
\
--radius 120 \
--ring-width 26 \
# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc


i3-msg workspace 99-conky
