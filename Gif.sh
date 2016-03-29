#!/bin/sh

# pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# box selection
eval $(slop --opengl)

# launches ffmpeg and python script
xfce4-terminal -e "ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y -f alsa -i pulse /tmp/sharexin_gif.gif"

# copies gif to permanent location
cp /tmp/sharexin_gif.gif "${XDG_PICTURES_DIR}/ShareXin/twitter-$date-$time.gif"

# launches python script
python3 ~/ShareXin/Gif.py
