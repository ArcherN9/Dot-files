#!/bin/sh

# For more information, read https://wiki.archlinux.org/title/Xinit
# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Set the Keyboard map to US International layout
#setxkbmap us intl &

# Set the wallpaper using Nitrogen
# nitrogen --restore &

# Start an SSH-Agent during login. This is particuarly a turn of when trying
# to add SSH Keys for authentication
ssh-add -s &

# wmname is a utility to give a name to the window manager. Much like 
# the hostname utility. it can be used to trick certain applications
# This is added to fix grey box issues with IntelliJ and Android studio
# Refer https://wiki.archlinux.org/title/Java#Non-reparenting_window_managers
# wmname compiz &

# The DWM status bar is updated using xsetroot command. 
# A cron job creates a temp file with the content to be updated
# and the below script simply reads the output and sets it to the status bar
# $HOME/.dot-files/Acer/dwm/./dwm-xsetroot-execute.sh &

# Execute DWM desktop manager
exec startxfce4
