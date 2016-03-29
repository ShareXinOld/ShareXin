import sys
from PyQt4 import QtGui, QtCore
from twitter import *

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
        self.setWindowTitle('Tweet image w/ message')    
        self.show()
    def tweet(self):
        tweet = self.tweetEdit.toPlainText()
        image = "/tmp/sharexin_img.png"
        t = Twitter(auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))
        with open(image, "rb") as imagefile: imagedata = imagefile.read()
        t_up = Twitter(domain='upload.twitter.com', auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))
        id_img1 = t_up.media.upload(media=imagedata)["media_id_string"]
        t.statuses.update(status=tweet, media_ids=",".join([id_img1]))
        exit()
        
def main():
    
    app = QtGui.QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()