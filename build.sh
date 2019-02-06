#!/bin/sh


# Set up emails
sed "s/GMAIL_ADDR/$gmail/g" msmtprc > ~/.msmtprc 
sed "s/GMAIL_ADDR/$gmail/g" mbsyncrc > ~/.mbsyncrc 






