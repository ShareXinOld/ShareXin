#!/bin/sh

# sets pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using gnome-screenshot
gnome-screenshot -f /tmp/sharexin_img.png

  python3 ~/ShareXin/Picture.py

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# copies tmo file to permanent location
cp /tmp/sharexin_img.png $XDG_PICTURES_DIR/ShareXin/Full/twitter-$date-$time.png
