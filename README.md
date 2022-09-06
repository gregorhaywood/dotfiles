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
* Sirula: link dir

Config files going elsehere:

* Pacman (requires sudo):
  * In /etc/pacman.conf uncomment 'HookDir = /etc/pacman.d/hooks'
  * Create dir /etc/pacman.d/hooks
  * Copy hook file to /etc/pacman.d/hooks

## AUR

* brave-bin
* swaylock-effects-git
* wev

texcount

## TODO

* Set up backups
  * Ideally with remote access to my server
  * Potentially extend it to a remote file system
* Why does sway fail to run fish scripts?
* Enhance Sway config
* Integrate calander and comms with notifications
* Set up Matrix for collective logging

* Convert Helix theme to source colours from terminal
  * Also make sure I set these to what I want
  * This avoids problems when true color isn't supported
  * I can do this by just using the 16 named colours
