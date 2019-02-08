#!/bin/sh

# Update Emails 
notify-send "Syncing..." -u low

# Recieve
mbsync auto 

# Send 
# Not yet needed

# Show update
notify-send "Email synced!" -u low

