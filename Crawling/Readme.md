## 파이썬을 활용한 웹크롤링 기법

### 1. request/urllib + beautifulsoup

- HTML 소스를 내려받음
- beautifulsoup으로 내려받은 html을 파싱하여 python 객체 구조로 변환
- 이후 주로 find 명령어로 원하는 정보만 추출

### 2. selenium

- 매크로 형식으로 사전에 정의한 object에 `click`, `input` 등의 명령어를 통해 웹 운용을 자동화 (직관적)
- 1번에서 추출하기 어려운 javascript 렌더링을 통해 생성되는 데이터도 손쉽게 가져올 수 있음
- 다만 느리고 GUI가 필수

### 3. scrapy 

- 크롤링을 위해 개발된 프레임워크
- 동작 메커니즘이 약간 까다롭기는 하지만,  구조 자체가 심플하여 (문서화도) 여러모로 만능인 프레임워크
- 다만 플러그인끼리 호환이 잘 안되는 편
- 참조. https://excelsior-cjh.tistory.com/86
