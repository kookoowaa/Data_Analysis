# PandasGUI

`Pandas` 는 python 환경에서 데이터를 다루는 가장 강력한 라이브러리라고 보아도 과언이 아니다. 다만 excel이나 R(studio) 등과 비교하여 GUI가 부족하고, 초심자에게 다소 낯설게 느껴질 수가 있다는 단점아닌 단점이 있다. 이에 대한 보완 차원에서 개발된 라이브러리가 **`pasdasgui`**이며, 간단한 데이터 전처리를 효율적으로 진행할 수 있도록 도와주는 만큼 알아두면 유용하게 사용할 수 있다.

*20년 10월 27일 기준 0.2.5.1 버전*

## 1. 설치

- `pandasgui`는 `pip` 명령어를 통해 손쉽게 설치할 수 있음

```bash
# from PyPi
pip install pandasgui
or
# from Github
pip install git+https://github.com/adamerose/pandasgui.git
```

## 2. 데이터 불러오기

```python
import pandas as pd
from pandasgui import show as pdgui
from pandasgui.datasets import titanic
```

- 데이터는 `pandasgui`에서 제공하는 `titanic` 샘플 데이터를 사용
- 데이터를 `pandasgui`로 불러오는 방법은 `pandasgui`의 `show()` 함수를 사용
- 이때, `show()`는 pandas의 `DataFrame` 오브젝트를 입력값으로 받음

```python
pdgui(titanic)
```

![](https://miro.medium.com/max/1000/1*SmMJbtESZrlYlelhN-43NA.png)

- 혹은 `pandasgui.show()`로 인터페이스 창만 열고, 드래그앤 드랍으로 데이터를 가져오는 것도 가능 (csv, xlsx)

## 3. pandasgui의 기능

- 데이터를 불러오면 익숙한 엑셀 형식의 GUI가 나타남

- GUI에는 총 5개의 탭이 존재함 ['DataFrame', 'Filter', 'Statistics', 'Grapher', 'Reshaper']

  > - 'DataFrame' 탭에서는 데이터를 테이블 형태로 살펴볼 수 있으며, 정렬 및 데이터 수정 기능도 제공함
  > - 'Filter' 탭에서는 `pd.DataFrame.query()`와 동일한 sql 형태의 필터 기능을 제공
  > - 'Statistics' 탭에서는 데이터프레임의 기초통계량을 제공
  > - 'Grapher' 탭에서는 `plot.ly` 기반의 상호작용이 가능한 시각화를 제공
  > - 'Reshaper' 탭에서는 pivot/melt 기능을 지원

## 4. python 환경에서 pandasgui 데이터 접근하기

- pandasgui에서 전처리한 데이터를 역으로 python 환경으로 가져오는 것도 가능
- 이때는 `pandasgui.show().get_dataframes()`함수를 사용하고, 결과 값은 딕셔너리 오브젝트를 반환
- 각각의 딕셔너리 value는 DataFrame을 담고 있으며, gui의 왼쪽 패널의 `Name`값을 딕셔너리의 key 값으로 갖고 있음

```python
pdgui(titanic).get_dataframes()['titanic']
```