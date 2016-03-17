#!/bin/bash

# take a screenshot using gnome-screenshot
image=$(mktemp /tmp/twitter.XXXXXX.png)
gnome-screenshot -f $image

cp $image ~/Pictures/Screenshots/

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    xterm -e "python3 ~/ShareXin/Full.py"
fi