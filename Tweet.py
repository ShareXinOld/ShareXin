from twitter import *
import sys

import config

print('Type message: (Ctrl+D to "enter" message)')
tweet = sys.stdin.read()

t = Twitter(auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))

t.statuses.update(status=tweet)
