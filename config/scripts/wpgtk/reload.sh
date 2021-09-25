#!/bin/sh

source ~/.cache/wal/colors.sh
feh --bg-fill $wallpaper

#dunst &

# wait for the garbage program to do it's job
#sleep 2

killall -SIGUSR1 xava

# reset the notification daemon
#killall mako;mako&

