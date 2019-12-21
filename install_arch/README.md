# Installing Arch

By default, follow the wiki: https://wiki.archlinux.org/index.php/Installation_guide

## Installation
* Boot into live machine
* Set up keyboard by following wiki instructions
* Connect to the internet (Ethernet is easiest here)
* Set time: timedatectl set-ntp true
* Set up disk partitions
* Set up partitions and mount:
	* LVM on LURKS
	* F2FS filesystem
* Install essential packages
* Generate fstab, using UUIDs
* Change root into new system
* Set timezone: # ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
	* And hardware clock stuff as specified
* Complete localisation
* Change the HOOKS in /etc/mkinitcpio.conf to include
	* base udev autodetect keyboard keymap modconf block encrypt resume 
		filesystems fsck
	* Then run # mkinitcpio -P
* Use systemd-boot

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


