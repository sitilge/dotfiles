#!/bin/sh

if [ -f ~/.Xresources ]; then 
    xrdb -merge ~/.Xresources;
fi

rm -R ~/.cache/sessions

conky -c ~/.conkyrc0 && conky -c ~/.conkyrc1

exec startxfce4
