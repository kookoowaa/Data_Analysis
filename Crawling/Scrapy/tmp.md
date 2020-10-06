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

