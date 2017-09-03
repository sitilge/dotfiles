#!/bin/bash

# remove all sessions
if [ -d ~/.cache/sessions ]; then
	rm ~/.cache/sessions/* && chmod 500 ~/.cache/sessions
fi

# set keymap
setxkbmap lv

# initialize conky
conky -qc ~/.conkyrc

# start xfce4
exec startxfce4
