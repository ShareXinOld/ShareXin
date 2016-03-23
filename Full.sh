#!/bin/sh

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-~/Pictures}"

# take a screenshot using maim
image=$(mktemp /tmp/twitter_XXXXXX.png)
maim $image

date=$(date +%m-%d-%y)
time=$(date +%T)

cp $image $XDG_PICTURES_DIR/sharexin/twitter-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    $(basename $0)/term.sh -e "python3 $(basename $0)/Twitter.py"
fi
