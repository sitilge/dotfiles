#!/bin/sh

# set keymap
setxkbmap lv

# start compositor
# note: there is a major issue with compton -b (do not use it!)
# daemonize the process instead with &
compton -cCGf -m 0.8 -o 0.3 -I 0.03 -O 0.03 -D 5 -t 0 -l 0 -r 3 &

# start awesome
exec awesome
