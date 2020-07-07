import scrapy

from myfirstspider.items import WikiItem


class WikiSpider(scrapy.Spider):
    name = 'wiki'
    allowed_domains = ['en.wikipedia.org']
    start_urls = ['https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data']

    def parse(self, response):
        lis = response.xpath('//*[@id="thetable"]/tbody/tr')
        country = []
        case = []
        death = []
        recovery = []
        item = WikiItem()
        cnt = 1
        for li in lis:
            if cnt < 3:
                cnt = cnt + 1
                continue
            country.append(li.xpath("./th[2]/a/@title").extract_first())
            case.append(li.xpath("./td[1]/text()").extract_first())
            death.append(li.xpath("./td[2]/text()").extract_first())
            recovery.append(li.xpath("./td[3]/text()").extract_first())
        item["country"] = country
        item["case"] = case
        item["death"] = death
        item["recovery"] = recovery
        return item
