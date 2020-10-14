import scrapy

class NewsSpider(scrapy.Spider):
    name = 'news'
    allowed_domains = ['engadget.com']
    start_urls = ['http://engadget.com/']

    def parse(self, response):
        #link = response.css('a.o-hit_link::attr("href")').extract() # <a> 태그 중 <href> 태그를 필터
        link = response.css('a::attr(href)').getall()
        for url in link:
            if url.find("products")==1:
                continue
            elif url == "#":
                continue
            yield scrapy.Request(response.urljoin(url), self.parse_topics)
        link = filter(lambda x: x != '#', link) # 추출한 태그 중 속성이 '#'로 지정되는 경우 이를 제거
	
    def parse_topics(self, response):
        pass