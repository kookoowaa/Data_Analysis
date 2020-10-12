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


# 라이브러리와 프레임워크

> - 정확하게 이야기 하면 모듈 > 라이브러리 > 프레임워크 순으로 확장되는 개념으로 이해할 수 있음
> - 함수를 정의하고 반복적으로 사용하는 부분은 따로 빼고 불러 사용하며, 이를 **모듈**이라고 명명함
> - 모듈이 많아져, 특정 개발 목적에 편리하게 묶을 수 있다면 **모듈의 집합을 라이브러리**라고 부르게 됨
> - **프레임워크는 라이브러리의 집합**으로 볼 수 있음
> - 단 프레임워크는 특정한 기능을 수행한다고 볼 수 있으며, 핵심(core)에 해당하는 프레임워크에 개발자들이 변형을 하며 결과물을 만듬
> - 자동차의 골조 및 주요 부품이 프레임워크라면, 디자인 등은 개발자들이 개발하는 변형으로 이해할 수 있음

