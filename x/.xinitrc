#!/bin/sh

# set keymap
setxkbmap lv &&

# start compositor
compton -bcCGf -m 0.8 -o 0.3 -I 0.03 -O 0.03 -D5 -t 0 -l 0 -r 3 &&

# start awesome
exec awesome
