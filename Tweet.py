from twitter import *

import config

tweet = input('Message: ')

t = Twitter(auth=OAuth(config.access, config.access_secret, config.api, config.api_secret))

t.statuses.update(status=tweet)
