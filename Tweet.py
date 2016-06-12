#!/usr/bin/env python3
import sys
from PyQt4 import QtGui, QtCore
from twitter import *
from gi.repository import Notify

import config

class Example(QtGui.QWidget):
    
    def __init__(self):
        super(Example, self).__init__()
        
        self.initUI()
        
    def initUI(self):

        self.tweetEdit = QtGui.QTextEdit()
        cancel = QtGui.QPushButton('Cancel')
        tweet = QtGui.QPushButton('Tweet')
        cancel.clicked.connect(QtCore.QCoreApplication.instance().quit)
        tweet.clicked.connect(self.tweet)

        grid = QtGui.QGridLayout()
        grid.setSpacing(10)

        grid.addWidget(self.tweetEdit, 0, 0)
        grid.addWidget(cancel, 1, 0)
        grid.addWidget(tweet, 2, 0)
        
        self.setLayout(grid)
        
        self.setGeometry(480, 280, 350, 240)
        self.setWindowTitle('Tweet message')    
        self.show()
    def tweet(self):
        self.close()
        tweet = self.tweetEdit.toPlainText()
        t = Twitter(auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))
        t.statuses.update(status=tweet)
        Notify.init('Sent to twitter')
        Sent = Notify.Notification.new('')
        Sent.show()
        exit()
        
def main():
    
    app = QtGui.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
