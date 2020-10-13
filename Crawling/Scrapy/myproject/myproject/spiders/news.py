import scrapy


class NewsSpider(scrapy.Spider):
    name = 'news'
    allowed_domains = ['engadget.com']
    start_urls = ['http://engadget.com/']

    def parse(self, response):
        link = response.css('a.o-hit_link::attr("href")').extract()
        link = filter(lambda x: x != '#', link)
        link = list(link)
        print(link)
        pass
