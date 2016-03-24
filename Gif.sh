#!/bin/sh

# pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a recording using gtk-recordmydesktop
gtk-recordmydesktop

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# ogv to gif conversion
./term.sh -e "ffmpeg -i ~/out.ogv /tmp/sharexin_gif.gif -y"

# copies gif to permanent location
cp /tmp/sharexin_gif.gif "${XDG_PICTURES_DIR}/sharexin/twitter-$date-$time.gif"

# launches python script
./term.sh -e "python3 Gif.py"
