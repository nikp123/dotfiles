#!/usr/bin/env sh

display_used=$(xrandr | grep \ 1920 | grep connect | cut -d' ' -f1)

#echo $display_used
xrandr --output $display_used --primary
