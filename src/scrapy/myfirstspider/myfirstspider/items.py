# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy

class WikiItem(scrapy.Item):
    # define the fields for your item here like:
    country = scrapy.Field()
    case = scrapy.Field()
    death = scrapy.Field()
    recovery = scrapy.Field()
