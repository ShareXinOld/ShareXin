#!/bin/bash

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter_XXXXXX.png)
shutter -a --output="$image" -n -e

date=$(date +%Y-%m-%d)
time=$(date +%T)

cp $image ~/Pictures/Screenshots/twitter_window-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 /home/thebitstick/Twitter/Window.py"
fi
