import scrapy


class TestspiderSpider(scrapy.Spider):
    name = 'TestSpider'
    allowed_domains = ['wikibook.co.kr/list/']
    start_urls = ['http://wikibook.co.kr/list//']

    def parse(self, response):
        pass
