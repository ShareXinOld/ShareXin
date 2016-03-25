from twitter import *
import os
import sys

import config

print('Type message: (Ctrl+D to "enter" message)')
tweet = sys.stdin.read()
image = "/tmp/sharexin_gif.gif"
print(image)

t = Twitter(auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))

with open(image, "rb") as imagefile:
	imagedata = imagefile.read()
t_up = Twitter(domain='upload.twitter.com',
    auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))
id_img1 = t_up.media.upload(media=imagedata)["media_id_string"]
t.statuses.update(status=tweet, media_ids=",".join([id_img1]))
