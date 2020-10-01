```bash
├─── myproject
|   ├─── __init__.py
|   ├─── __pycache__
|   ├─── items.py
|   ├─── pipelines.py
|   ├─── settings.py
|   └─── spiders
|      ├─── __init__.py
|      └─── __pycache__
└─── scrapy.cfg

```
- 별도로 설명이 없을 경우 `scrapy.cfg`가 있는 디렉터리에서 명령어를 실행
- `settings.py`에 `DOWNLOAD_DELAY`를 `1`로 변경
- Spider는 기본적으로 **ITEM**을 사용해서 추출한 데이터를 저장하며, `items.py`에 저장 (`scrapy.Item`을 상속받음)
- 
