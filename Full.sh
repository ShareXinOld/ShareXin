#!/bin/bash

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter_XXXXXX.png)
shutter -f --output="$image" -n -e

date=$(date +%Y-%m-%d)
time=$(date +%T)

cp $image ~/Pictures/Screenshots/twitter-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 /home/thebitstick/Twitter/Twitter.py"
fi
