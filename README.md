# ShareXin

#### Requirements
python3
xdotool
[maim](https://github.com/naelstrof/maim)
[slop](https://github.com/naelstrof/slop)
[Twitter](https://github.com/sixohsix/twitter)  
a terminal emulator
ffmpeg
gtk-recordmydesktop


#### How to use
1. git clone
2. add keyboard shortcuts
3. Add in Twitter App details into `config.py`
4. Done

#### Troubleshooting

### Maim is difficult to compile
That's just the nature of maim, work it out and it's worth it.

### The same gif is converted everytime
The script checks for the output of gtk-recordmydesktop, which is always out.ogv, but if the file exists, it will be named out-1.ogv, so make sure to replace the file or move it before making a new gif.

### Gif fails to upload
It might be bigger than the Twitter API allows. Try creating the gif again, but shorter and smaller, or try optimizing the gif in ~/Pictures/Screenshots/ and manually uploading.
