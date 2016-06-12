#!/bin/sh

# pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using maim and xdotool
gnome-screenshot -w -f /tmp/sharexin_img.png

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# copies to permanent location
cp /tmp/sharexin_img.png $XDG_PICTURES_DIR/ShareXin/Window/twitter_window-$date-$time.png

# launches python script
python3 ~/ShareXin/Picture.py
