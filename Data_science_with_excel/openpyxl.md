# openpyxl

- `openpyxl`은 `xlwings`와 더불어 python으로 excel을 다루는 유용한 library임
- 느리다는 단점이 있지만, 쓰기밖에 못하는 `XlsxWriter`와 `PyExcelerate`에 비해 장점이 명확

## 1. 기본적인 사용 방법
- 액샐 파일 object 생성
```python
# 모듈 불러오기
from openpyxl import Workbook

# 엑셀 파일 object 생성
wb = Workbook()

# object 내 워크시트 정의
ws1 = wb.active
ws2 = wb.create_sheet(title='Sheet2')

# object 저장
wb.save('sample.xlsx')
```

- 엑셀 셀 다루기
```python
# 셀 선택
ws1["A1"]
ws1.cell(row=1, column=1)

# 셀 값 선택
ws1["A1"].value

# 셀 값 기입
ws1["A1"].value = 1
ws1.cell(1,1) = 1

# 셀 함수 기입
ws1.cell(1,1) = "=SUM(1,2,3)"

# 셀 문자 포맷 확인
ws1["A1"].number_format
```

- 그래프 그리기
``` python
from openpyxl import Workbook
from openpyxl.chart import BarChart, Reference
from random import random

# 랜덤 함수
def get_random():
    while True:
        ret = int(random()*100)
        if ret < 40:
            return ret - 20

# Workbook 오브젝트 생성
wb = Workbook()
ws = wb.active

# 데이터 생성
ws['C1'] = 'R1'
ws['D1'] = 'R2'
for row in range(2,14):
    ws[f'C{row}'].value = get_random();
    ws[f'D{row}'].value = get_random();    

# BarChart 오브젝트 생성    
chart = BarChart()
chart.type = 'col'
chart.style = 10
chart.title = 'Random draw'
chart.x_axis.title = 'random_1'
chart.y_axis.title = 'random_2'

# BarChart에 데이터 맵핑
data = Reference(ws, min_col = 3, max_col=4, min_row =1, max_row=14)
chart.add_data(data, titles_from_data=True)
ws.add_chart(chart, "E1")

# 파일 저장
wb.save('chart_sample.xlsx')
```

- 

ref.  

https://nowonbun.tistory.com/682

http://blog.naver.com/PostView.nhn?blogId=okkam76&logNo=221325026239

https://devlog.jwgo.kr/2020/02/25/openpyxl-basic/  

https://myjamong.tistory.com/51

