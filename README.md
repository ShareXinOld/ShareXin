# ShareXin  

On Windows
![On Windows](https://raw.githubusercontent.com/ShareXin/ShareXin/master/twitter-2016-10-08-05_48_543_PM.png)  

On Linux
![On Linux](https://raw.githubusercontent.com/ShareXin/ShareXin/master/twitter-2016-10-08-10_07_602_PM.png)

#### Requirements
python3  
[Twitter](https://github.com/sixohsix/twitter)  
PyQt5  
gnome-screenshot (on Linux)  
feh (for Selection)  

#### Features
* Uploads to Twitter
* Notification via libnotify
* Works with Wayland (On Gnome only) and X11 (On everything since the 90s)
* Compatible with Pyinstaller

#### Installation
1. `git clone https://github.com/ShareXin/ShareXin`
2. Add your Twitter App details into `config.ini`
3. Place `config.ini` to `~/.config/ShareXin/`
4. Attach the scripts to a keyboard shortcut
5. Done!

### Changelog
#### [0.7.4] - 2017-07-10
#### Added
- Better notification
- Selection pauses the screen by taking a screenshot of it and displaying it

#### [0.7.3] - 2016-10-08
#### Added
- Better configuration, similar to ShareJin's config
- Requirements.txt

#### [0.6.4] - 2016-09-15
#### Added
- Fixed syntax in scripts
- Removed useless if/else since Gnome-Screenshot doesn't give exit codes

#### [0.5.7] - 2016-06-22
#### Added
- Changelog
- Proper configuration file
- Fixed README
- Notification closes after 2 seconds
- Small modification on exiting for compatibility with Pyinstaller

### Pyinstaller
Pyinstaller allows you to turn Python scripts into executables that can be run even without Python installed.  
You can even turn them into Windows executables and macOS apps.  

#### Steps for using Pyinstaller
1. `pip3 install pyinstaller` as sudo/root
2. `pyinstaller (optional -F flag for one file instead of a folder) [file.py]`
3. Done.
