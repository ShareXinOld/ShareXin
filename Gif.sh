#!/bin/bash

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter_XXXXXXX.gif)
gtk-recordmydesktop

date=$(date +%Y-%m-%d)
time=$(date +%T)

xterm -e "ffmpeg -i ~/out.ogv $image"

cp $image ~/Pictures/Screenshots/twitter-$date-$time.gif

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 /home/thebitstick/Twitter/Gif.py"
fi
