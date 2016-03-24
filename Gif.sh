#!/bin/sh

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a recording using gtk-recordmydesktop
image=$(mktemp /tmp/twitter_XXXXXXX.gif)
gtk-recordmydesktop

date=$(date +%Y-%m-%d)
time=$(date +%T)

term.sh -e "ffmpeg -i ~/out.ogv $image"

cp $image "${XDG_PICTURES_DIR}/sharexin/twitter-$date-$time.gif"

export image

# check file size (0 bytes means that gnome-screenshot was cancelled)
sharenixtmpsize=$(wc -c <"$image")
if [ $sharenixtmpsize != 0 ]; then
    ./term.sh -e "python3 Gif.py"
fi
