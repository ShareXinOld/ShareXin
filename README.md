# ShareXin

#### Requirements
python3  
[Twitter](https://github.com/sixohsix/twitter)  
PyQt5  
gnome-screenshot  

#### Features
* Uploads to Twitter
* Notification via libnotify
* Works with Wayland and X11
* Compatible with Pyinstaller

#### Installation
1. `git clone https://github.com/ShareXin/ShareXin`
2. Add your username to `Picture.py` and `Tweet.py`
3. Add your Twitter App details into `config.ini`
4. Attach the scripts to a keyboard shortcut
5. Done!

#### Changelog
### [0.5.6] - 2016-06-22
### Added
- Changelog
- Proper configuration file
- Fixed README
- Notification closes after 2 seconds
- Small modification on exiting for compatibility with Pyinstaller

#### Pyinstaller
Pyinstaller allows you to turn Python scripts into executables that can be run even without Python installed.  
You can even turn them into Windows executables and macOS apps.  

### Steps for using Pyinstaller
1. `pip3 install pyinstaller` as sudo/root
2. `pyinstaller (optional -F flag for one file instead of a folder) [file.py]`
3. Done.
