#!/bin/sh

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a screenshot using maim and xdotool
image=$(mktemp /tmp/twitter_XXXXXX.png)
maim -i $(xdotool getactivewindow)

date=$(date +%Y-%m-%d)
time=$(date +%T)

cp $image $XDG_PICTURES_DIR/sharexin/twitter_window-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    ./term.sh -e "python3 Window.py"
fi
