## Scrapy

> - **Scrapy**는 기존의 다른 크롤러와는(request, selenium) 다르게 프레임워크를 제공하고, 프레임워크를 통해 크롤링을 하는 구조를 띄고 있음
> - 그 외에도 interactive shell 환경을 지원하기도 함

## 프로젝트 생성하기

- Scrapy의 프레임워크를 활용하기 위해서는 프로젝트를 만들어야 함

- 이는 아래와 같이 생성:

  ```bash
  scrapy startproject {프로젝트명}
  ```

- *스파이더 만들기* (\프로젝트명\프로젝트명 디렉토리로 이동 후):

```bash
scrapy genspider {스파이더명} {url주소}
```

- 스파이더(`{스파이더명}.py`)가 생성됨과 동시에`item.py`에 `{스파이더명}`의 class가 동시에 생성됨

## 프로젝트 구조

- 스파이더에서 `items.py`의 `class`가 상호작용하는 구조

- 스파이더를 통해 크롤링 된 데이터는 `items.py`의  `{스파이더명}` 클래스에 저장

- `itmes.py`에 저장된 데이터는 `{프로젝트명}.items`의 `{스파이더명}` (클래스)를 호출하는 방식으로 사용 가능:

  ```python
  from {프로젝트명}.items import {스파이더명}
  ```

  

- 



https://pycoding.tistory.com/22

https://kscodebase.tistory.com/143?category=1110549