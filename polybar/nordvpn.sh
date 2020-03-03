#!/bin/sh

exit 1



STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
	AREA=$(nordvpn status | grep Country | cut -d ':' -f2)
	echo $AREA' '
else
	# needed to clear output
    echo ""
fi
