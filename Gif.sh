#!/bin/sh

# pictures directory
XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

# take a recording using gtk-recordmydesktop
gtk-recordmydesktop

# date and time for naming
date=$(date +%Y-%m-%d)
time=$(date +%T)

# ogv to gif conversion
xfce4-terminal -e "ffmpeg -i /home/thebitstick/out.ogv /tmp/sharexin_gif.gif -y"

# copies gif to permanent location
cp /tmp/sharexin_gif.gif "${XDG_PICTURES_DIR}/sharexin/twitter-$date-$time.gif"

# launches python script
xfce4-terminal -e "python3 /home/thebitstick/ShareXin/Gif.py"
