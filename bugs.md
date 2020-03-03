# Bugs
A list of problems to resolve.


## ACPI BIOS Error
From #dmsg:

[   35.577615] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.PEG0.PEGP.BRT6.LCD], AE_NOT_FOUND (20190816/psargs-330)

This is suspected to be a harmless bug caused by BIOS updates being out of 
date or out of sync with hardware. I'm reluctant to mess with BIOS due to the 
complexity of a dual boot setup, so am content to leave this bug for now.

## Swap Space
My swap space doesn't work. It would be nice to set up encrypted hibernate, 
but enabling the resume hook causes suspend to hang, and hibernating still 
fails.

Note that the swapfile, */swapfile*, could be deleted to free space.

## NordVPN Bug
Currently, my VPN crashes after about an hour. The kill switch remains active, 
but the VPN refuses to connect.



