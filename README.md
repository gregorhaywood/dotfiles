# dotfiles


## Config Files in ~/.config

* Fish: symlink the directory
* Helix: link dir
* Alacritty: link file
* Starship: link file
* Sway: link dir, copy swaylocal to ~/.config/swaylocal and modify
* Brave: link file
* Dunst: link dir
* Systemd: link dir
* Bottom: link dir

Config files going elsehere:

* Pacman (requires sudo):
  * In /etc/pacman.conf uncomment 'HookDir = /etc/pacman.d/hooks'
  * Create dir /etc/pacman.d/hooks
  * Copy hook file to /etc/pacman.d/hooks

## AUR

* brave-bin
* swaylock-effects-git

texcount

## TODO

* Confirm upgrade nudge works, change timer to 5 days, and inform
  systems that all is up and running
* Add new volume modifier keys
* Set up backups
  * Ideally with remote access to my server
  * Potentially extend it to a remote file system
* Why does sway fail to run fish scripts?
* Enhance Sway config
* Swayidle for auto-locking?
