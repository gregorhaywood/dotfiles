#!/bin/sh


REGEX="s/GMAIL_ADDR/$gmail/g; s/LIVE_ADDR/$live/g; s/UNI_ADDR/$uni/g"

# Set up emails
sed "$REGEX" msmtprc > ~/.msmtprc 
sed "$REGEX" mbsyncrc > ~/.mbsyncrc 
sed "$REGEX" mutt/gmail.mutt > ~/Mail/.config/gmail.mutt 
sed "$REGEX" mutt/live.mutt > ~/Mail/.config/live.mutt 
sed "$REGEX" mutt/uni.mutt > ~/Mail/.config/uni.mutt 






