#!/bin/sh

DEFAULT_SESSION="openbox"
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

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

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
# x server parameters
xset s 0
xset dpms 0 0 1800

if [ -n "$failsafe" ]; then
 # twm &
 # xclock -geometry 50x50-1+1 &
 # xterm -geometry 80x50+494+51 &
 # xterm -geometry 80x20+494-0 &
 # exec xterm -geometry 80x66+0+0 -name login
 exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session
else
 exec $command
fi
