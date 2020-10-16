# Installing Arch

By default, follow the wiki: https://wiki.archlinux.org/index.php/Installation_guide

## Points of Note

### Partitions
* Use the following partitions:
	* UFI Boot (512MB)
	* Swap (size is system dependant)
	* Root (rest of disk)

SSD/HDD set up:
* Use SSD for booting, etc.
	* Swap (mainly used for suspend-to-disk due to sufficient RAM)
	* Put /var, /tmp on other partition
* Use F2FS for SSD
	* Use periodic trim (prefered to continuous trim)
	* util-linux provides an fstrim.service and fstrim.timer
* For HDD, use ext4

[ HARDENING ]
* Use disk encryption
	* LVM on LUKS
		* Whole disk in encrypted
		* Logical volumes used inside
	* Note that there are some issues with SSD trim and LUKS that I don't 
		really understand

### Boot
* Use systemd-boot
* Disable EFI shell and editor
* Create and sign a unified kernel image (can then use secure boot)

### Post-Install

It may be necessary to use the nomodeset parameter until graphics things have 
been set up. Installing graphics drivers (eg, mesa & xf86-video-nouveau) and 
the xorg group seems to be enough.

It is necessary to install something like networkmanager to set up a network 
(even using DHCP, although manually configuration of addr, DNS server, and 
route is possible).


## Configurations
You will need to make new password files for mutt. Note that Gmail will need a 
new app password.


## Packages
To install all not yet installed packages run:
# pacman -S --needed - < pkglist.txt

To update the package list (of non-AUR/local packages):
$  pacman -Qqen > pkglist.txt

## AUR Packages
To install AUR packages, add them as submodules to this repository, change 
into the directory, and run:
$ makepkg -si

## Python Packages
Install with pip from pip.txt.


