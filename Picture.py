#!/usr/bin/env python3
import sys
import os
from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtGui import QIcon
import PyQt5
from PyQt5 import *
from twitter import *
from gi.repository import Notify
import time
import configparser

config = configparser.ConfigParser()
config.read(os.path.expanduser("~")  + '/.config/ShareXin/config.ini')
keys = config['Twitter']
access = keys['access']
access_secret = keys['access_secret']
api = keys['api']
api_secret = keys['api_secret']

class Example(QWidget):
    
    def __init__(self):
        super().__init__()
        
        self.initUI()
        
    def initUI(self):

        self.tweetEdit = QtWidgets.QTextEdit()
        cancel = QtWidgets.QPushButton('Cancel')
        tweet = QtWidgets.QPushButton('Tweet')
        cancel.clicked.connect(QtCore.QCoreApplication.instance().quit)
        tweet.clicked.connect(self.tweet)

        grid = QtWidgets.QGridLayout()
        grid.setSpacing(10)

        grid.addWidget(self.tweetEdit, 0, 0)
        grid.addWidget(cancel, 1, 0)
        grid.addWidget(tweet, 2, 0)
        
        self.setLayout(grid)
        
        self.setGeometry(480, 280, 350, 240)
        self.setWindowTitle('Tweet image w/ message')    
        self.show()
    def tweet(self):
        self.close()
        tweet = self.tweetEdit.toPlainText()
        image = "/tmp/sharexin_img.png"
        t = Twitter(auth=OAuth(access, access_secret, api, api_secret))
        with open(image, "rb") as imagefile: imagedata = imagefile.read()
        t_up = Twitter(domain='upload.twitter.com', auth=OAuth(access, access_secret, api, api_secret))
        id_img1 = t_up.media.upload(media=imagedata)["media_id_string"]
        t.statuses.update(status=tweet, media_ids=",".join([id_img1]))
        Notify.init('ShareXin')
        Sent = Notify.Notification.new('Success', 'Sent to Twitter', '/tmp/sharexin_img.png')
        Sent.show()
        time.sleep(2)
        Sent.close()
        
if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
