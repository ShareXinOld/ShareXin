#!/bin/sh

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-~/Pictures}"

# take a recording using gtk-recordmydesktop
image=$(mktemp /tmp/twitter_XXXXXXX.gif)
gtk-recordmydesktop

date=$(date +%Y-%m-%d)
time=$(date +%T)

xterm -e "ffmpeg -i ~/out.ogv $image"

cp $image "${XDG_PICTURES_DIR}/sharexin/twitter-$date-$time.gif"

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    "$(basename $0)"/term.sh -e "python3 $(basename $0)/Gif.py"
fi
