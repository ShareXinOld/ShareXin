#!/bin/sh

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter_clip_XXX.png)
shutter -s --output="$image" -n -e 

date=$(date +%m-%d-%y)
time=$(date +%T)

cp $image ~/Pictures/Screenshots/twitter_clip-$date-$time.png

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 /home/thebitstick/Twitter/Selection.py"
fi
