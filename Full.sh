#!/bin/sh

# sets pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using maim
maim /tmp/sharexin_img.png

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# copies tmo file to permanent location
cp /tmp/sharexin_img.png $XDG_PICTURES_DIR/sharexin/twitter-$date-$time.png

# launches python script
./term.sh -e "python3 Full.py"
