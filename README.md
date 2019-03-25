# dotfiles

Dotfiles. You know the deal.

Unless I say otherwise, dotfiles go in $HOME and directories go in $HOME/.config. This should be done with symlinks.

Where possible, access should be through scripts in the script directory (for maintainability). For simplicity, i3 assumes the scripts are located in ~/dotfiles/scripts.


## Active WIP
Dunst 
i3 Autolaunch Stuff
Vim 
Build script (include vim plugins and other symlinks?)


## Dependancies
### xcwd
This is used to open terminals in the focused terminal's directory. It is availible here: https://github.com/schischi/xcwd



## Email
There's a lot going on here.

The build script fills out masked email addresses in config files. It expects that certain address variables have been defined (eg, in 

### Isync
Isync synchonises email to a local directory structure. It is scheduled using cron:
 */5 * * * * mbsync auto

It is described in terms of channels, which map remote IMAPStore directories to local MaildirStores. 

### Msmtp
Msmtp is used for sending mail. It is invoked by:
<email>|msmtp -a <account>

Msmtp can be used to queue emails to send later. This is good for offline use: queue mail instead of sending it, then schedule cron to send stuff.

### Mutt
Here is your email client. It uses folder-hook to select an account given a current maildir. This should be able to switch between sending accounts easily, but I've not set up and tested it. 

### Notmuch
I've not set this up, but this could be used for seraching emails if necessary. 

TODO
msmtp has a queuing system. Work out ho'sw to use this with cron for scheduling offline sending.
add other accounts

## Vim
Vim WIki
Comentery
Polygot
Suround.vim


# TODO
https://wiki.archlinux.org/index.php/backlight
Set up backlight adjusting
Set up volume control
Set up ssh stuff

Locking
Hibernating
Email




