```bash
$ scrapy startproject myproject
$ tree myproject /f
    │  scrapy.cfg
    │
    └─myproject
        │  items.py
        │  middlewares.py
        │  pipelines.py
        │  settings.py
        │  __init__.py
        │
        └─spiders
                __init__.py
```

- 별도로 설명이 없을 경우 `scrapy.cfg`가 있는 디렉터리에서 명령어를 실행

- `settings.py`에 `DOWNLOAD_DELAY`를 `1`로 변경

- `Spider`는 `scrapy.Spider`를  상속받는 클래스로, 이를 통해 크롤링을 수행

  ```bash
  $ cd myproject
  $ scrapy genspider news engadget.com
  # scrapy genspider {스파이더 이름} {크롤링 대상 도메인} 명령어로 스파이더를 생성
  $ tree /f
      │  scrapy.cfg
      │
      └─myproject
          │  items.py
          │  middlewares.py
          │  pipelines.py
          │  settings.py
          │  __init__.py
          │
          ├─spiders
          │  │  news.py
          │  │  __init__.py
          │  │
          │  └─__pycache__
          │          __init__.cpython-38.pyc
          │
          └─__pycache__
                  settings.cpython-38.pyc
                  __init__.cpython-38.pyc
  ```

  ```python
  import scrapy
  
  
  class NewsSpider(scrapy.Spider):
      name = 'news'
      allowed_domains = ['engadget.com']
      start_urls = ['http://engadget.com/']
  
      def parse(self, response):
          pass
  ```

- Spider는 기본적으로 **ITEM**이라는 객체에 추출한 데이터를 저장하며, `items.py`를 통해 정의(`class`) (`scrapy.Item`을 상속받음)

  ```python
  class Headline(scrapy.Item):
      title = scrapy.Field()
      body = scrapy.Field()
      
  item = Headline()
  item['title'] = "Example"
  print(item['title'])
  ## Example
  ```

- 

