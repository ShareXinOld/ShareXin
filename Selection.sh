#!/bin/sh

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter_clip.XXXXXX.png)
shutter -s --output="$image" -n -e 

cp $image ~/Pictures/Screenshots/

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 /home/thebitstick/Twitter/Selection.py"
fi
