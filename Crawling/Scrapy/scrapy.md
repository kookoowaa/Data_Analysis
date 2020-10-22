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
  ## news.py
  import scrapy
  
  class NewsSpider(scrapy.Spider):
      name = 'news'
      allowed_domains = ['engadget.com']
      start_urls = ['http://engadget.com/']
  
      def parse(self, response):
          pass
  ```

  > - Spider로 클래스를 정의하면 3가지 속성과 1가지 메서드가 정의됨
  > - `name` 속성은 `scrapy genspider {스파이더 이름} {크롤링 대상 도메인}`의 첫번째 파라미터 값을 상속받음
  > - `allowed_domains`와 `start_urls`는 위에서 두번째 파라미터 값을 상속받음
  > - `start_urls` 같은 경우는 복수의 URL을 지정할 수도 있음
  > - `parse()` 메서드는 추출한 웹페이지 처리를 위한 콜백 함수임

- 동시에 `items.py`에 클래스를 생성하며,  **ITEM** 객체에 추출한 데이터를 저장하는 것을 원칙으로 함 (`scrapy.Item`을 상속받음)

  ```python
  # items.py
  class Headline(scrapy.Item):
      title = scrapy.Field()
      body = scrapy.Field()
      
  item = Headline()
  item['title'] = "Example"
  print(item['title'])
  ```

- **http://engadget.com/** 에서 링크들을 크롤링 하려면 위의 `news.py`의 parse 함수를 아래와 같이 변경

  ```python
  import scrapy
  
  class NewsSpider(scrapy.Spider):
      name = 'news'
      allowed_domains = ['engadget.com']
      start_urls = ['http://engadget.com/']
  
      def parse(self, response):
          #link = response.css('a.o-hit_link::attr("href")').extract() # <a> 태그 중 <href> 태그를 필터
          link = response.css('a::attr(href)').getall()
          link = filter(lambda x: x != '#', link) # 추출한 태그 중 속성이 '#'로 지정되는 경우 이를 제거
          link = list(link)
          print(link)
          pass
  ```

- 이어서 위에서 parse한 링크를 순회하도록 변경하려면 다시 아래와 같이 `news.py`를 변경

  ```python
  import scrapy
  
  class NewsSpider(scrapy.Spider):
      name = 'news'
      allowed_domains = ['engadget.com']
      start_urls = ['http://engadget.com/']
  
      def parse(self, response):
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
  ```

- Shell scripte를 통해 interactive로 테스트 해보는 것도 가능

  ```bash
  $ scrapy shell
  ...
  ...
  ln [1]: 
  ```

- 


___


# 라이브러리와 프레임워크

> - 정확하게 이야기 하면 모듈 > 라이브러리 > 프레임워크 순으로 확장되는 개념으로 이해할 수 있음
> - 함수를 정의하고 반복적으로 사용하는 부분은 따로 빼고 불러 사용하며, 이를 **모듈**이라고 명명함
> - 모듈이 많아져, 특정 개발 목적에 편리하게 묶을 수 있다면 **모듈의 집합을 라이브러리**라고 부르게 됨
> - **프레임워크는 라이브러리의 집합**으로 볼 수 있음
> - 단 프레임워크는 특정한 기능을 수행한다고 볼 수 있으며, 핵심(core)에 해당하는 프레임워크에 개발자들이 변형을 하며 결과물을 만듬
> - 자동차의 골조 및 주요 부품이 프레임워크라면, 디자인 등은 개발자들이 개발하는 변형으로 이해할 수 있음

___

