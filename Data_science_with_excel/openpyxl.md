# openpyxl

- `openpyxl`은 `xlwings`와 더불어 python으로 excel을 다루는 유용한 library임

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

ref.  
https://nowonbun.tistory.com/682
https://devlog.jwgo.kr/2020/02/25/openpyxl-basic/  
https://myjamong.tistory.com/51
