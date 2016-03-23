#!/bin/sh

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using maim
image=$(mktemp /tmp/twitter_clip_XXX.png)
maim -s $image

date=$(date +%Y-%m-%d)
time=$(date +%T)

cp $image $XDG_PICTURES_DIR/sharexin/twitter_clip-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    ./term.sh -e "python3 Selection.py"
fi
