from twitter import *

tweet = input('Message: ')

t = Twitter(auth=OAuth("315304273-1h5li2TbgIV3hQMbbFaiCyXpEOPgszfbayH1pYxR", "ZAzVWZTvco02IZ4n1x6B0y3tCElfKkiNBrLRoLWMM2cyt", "x98GOr5etAXLFXYi2UBdhQg8u", "yD0TbmsbJqnlTRiwmBaSMD374x1KH9AvnTJfgPRbuZBj1tTZep"))

t.statuses.update(status=tweet)
