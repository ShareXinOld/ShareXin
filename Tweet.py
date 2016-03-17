from twitter import *

tweet = input('Message: ')

t = Twitter(auth=OAuth("token", "token_secret", "consumer_key", "consumer_key_secret"))

t.statuses.update(status=tweet)
