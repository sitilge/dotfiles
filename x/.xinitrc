#!/bin/sh

# set keymap
setxkbmap lv &&

# start compositor
compton -b &&

# start awesome
exec awesome
