from twitter import *
import os

tweet = input('Message: ')
image = os.environ["image"]
print(image)

t = Twitter(auth=OAuth("315304273-1h5li2TbgIV3hQMbbFaiCyXpEOPgszfbayH1pYxR", "ZAzVWZTvco02IZ4n1x6B0y3tCElfKkiNBrLRoLWMM2cyt", "x98GOr5etAXLFXYi2UBdhQg8u", "yD0TbmsbJqnlTRiwmBaSMD374x1KH9AvnTJfgPRbuZBj1tTZep"))

with open(image, "rb") as imagefile:
	imagedata = imagefile.read()
t_up = Twitter(domain='upload.twitter.com',
    auth=OAuth("315304273-1h5li2TbgIV3hQMbbFaiCyXpEOPgszfbayH1pYxR", "ZAzVWZTvco02IZ4n1x6B0y3tCElfKkiNBrLRoLWMM2cyt", "x98GOr5etAXLFXYi2UBdhQg8u", "yD0TbmsbJqnlTRiwmBaSMD374x1KH9AvnTJfgPRbuZBj1tTZep"))
id_img1 = t_up.media.upload(media=imagedata)["media_id_string"]
t.statuses.update(status=tweet, media_ids=",".join([id_img1]))
