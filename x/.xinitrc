#!/bin/bash

# remove all xfce4 sessions
if [ -d ~/.cache/sessions ]; then
    rm -R ~/.cache/sessions/*
fi

# set up the xterm colors
if [ -f ~/.Xresources ]; then 
    xrdb -merge ~/.Xresources;
fi

# set keymap for x11 only
setxkbmap lv

# initialize conky
conky -qc ~/.conkyrc

# start xfce4
exec startxfce4