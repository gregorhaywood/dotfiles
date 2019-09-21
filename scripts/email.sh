#!/bin/sh

# Synchronise emails
# $1 is the account

# geowatch
STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
	# don't update if VPN is up and not in UK
    
	AREA=$(nordvpn status | grep Country | tr -d ' ' | cut -d ':' -f2)
	if [ "$AREA" != "UnitedKingdom" ]; then
		exit 0
	fi
else
	# or VPN is down an IP address is not UK
	AREA=$(geoiplookup $(curl ifconfig.me) | tr -d ' ' | cut -d ',' -f2)
	if [ "$AREA" != "UnitedKingdom" ]; then
		exit 0
	fi
fi


# do update
mbsync $1

# update record of update times
# only triggers aftera a sucessful update
if [ "$1" = "uni" ]; then
	date --date='2 min' -u +%s > ~/dotfiles/state/$1
elif [ "$1" = "live" ]; then
	date --date='80 min' -u +%s > ~/dotfiles/state/$1
elif [ "$1" = "gmail" ]; then
	date --date='30 hours' -u +%s > ~/dotfiles/state/$1
fi

# Send 
# Not yet implemented
# use some kind of queue
# potentially run this as a different service?



