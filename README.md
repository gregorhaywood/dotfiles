# dotfiles

Dotfiles. You know the deal.

Unless I say otherwise, dotfiles go in $HOME and directories go in $HOME/.config. This should be done with symlinks.

Where possible, access should be through scripts in the script directory (for maintainability). For simplicity, i3 assumes the scripts are located in ~/dotfiles/scripts.

## Dependancies
### xcwd
TODO: make this a submodule
This is used to open terminals in the focused terminal's directory. It is availible here: https://github.com/schischi/xcwd

AUR modules as submodules

## Email
Email is provided through a combination of tools. Neomutt is the email client. Isync is responsible for downloading mail, and is scheduled through a systemd service under the name mbsync (the command line tool provided by isync). Mail sending is provided by msmtp. It does not work while offline.

To protect email addresses, a build script is used to create dotfiles for mbsync and msmtp. They should not use symlinks. The build script requires addresses to be provided as variables.

### Msmtp
Msmtp can be used to send offline mail through queueing. I have not yet set this up.

TODO
* Create script for sending mail
* Set up queueing
	* Sending should queue, and try to trigger a send
	* Queue should be sent by a service at regular intervals
* Script should also cover stuff like creating an html email version


# TODO
Hibernating

newsboat:
set this all up. May just incorporate into conky.
...so set up conky

Build script to install and set up everything in a clean system

