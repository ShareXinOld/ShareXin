#!/bin/sh

# pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using maim
maim -s /tmp/sharexin_img.png --opengl

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# copies to permanent location
cp /tmp/sharexin_img.png $XDG_PICTURES_DIR/sharexin/twitter_clip-$date-$time.png

# launches python script
xfce4-terminal -e "python3 /home/thebitstick/ShareXin/Selection.py"
