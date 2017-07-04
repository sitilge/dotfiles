#!/bin/bash

# remove all sessions
if [ -d ~/.cache/sessions ]; then
    rm -R ~/.cache/sessions/*
fi

# set keymap for x11 only
setxkbmap lv

# initialize conky
conky -qc ~/.conkyrc

# start xfce4
exec startxfce4
