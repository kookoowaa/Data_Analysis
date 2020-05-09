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

- 참조용 소스
```python
# 엑셀을 사용하기 위한 모듈
from openpyxl import Workbook
from openpyxl import load_workbook
from openpyxl.styles import PatternFill, Border, Side, Alignment, Protection, Font
from random import random

# 랜덤 함수를 이용해 -20부터 20까지의 랜덤 값을 취득하는 함수
def get_random():
  while True:
    ret = int(random()*100);
    if ret < 40:
      return ret - 20;

# 엑셀을 읽어 온다.
wb = load_workbook(filename = "TestExcel.xlsx");

# 엑셀 시트를 active한다.
ws = wb[wb.sheetnames[0]];

# C2부터 D13까지의 데이터를 랜덤으로 입력한다.
for row in range(2,14):
  key = f'C{row}';
  # 랜덤 값을 입력한다.
  ws[key].value = get_random();
  # 해당 cell의 폰트 설정이다. (폰트 스타일, 크기, 두께, 이탤릭, 정렬, 아래선, 취소선, 색)
  ws[key].font = Font(name='Calibri',size=11,bold=False,italic=False,vertAlign=None,underline='none',strike=False,color='FF000000');
  # 해당 cell의 폰트 설정이다. (색 스타일, 시작색(그라데이션이 아니라면 바탕색), 종료색(그라데이션 용))
  ws[key].fill = PatternFill(fill_type="solid", start_color='FFFFFFFF', end_color='FF000000');
  # 해당 cell의 테두리 설정이다.
  ws[key].border = Border( left=Side(style="thick", color="000000"),
                           right=Side(style='double', color="000000"),
                           top=Side(style="thick", color="000000"),
                           bottom=Side(style="thick", color="000000"),
                           diagonal=Side(style="thick", color="000000"),
                           diagonal_direction=0,
                           outline=Side(style="thick", color="000000"),
                           vertical=Side(style="thick", color="000000"),
                           horizontal=Side(style="thick", color="000000"));
  key = f'D{row}';
  # 랜덤 값을 입력한다.
  ws[key].value = get_random();
  # 정렬 설정이다. (가로 정렬, 세로 정렬, 회전, 줄바꿈, .., ..)
  ws[key].alignment=Alignment(horizontal='general',vertical='bottom',text_rotation=0,wrap_text=False,shrink_to_fit=False,indent=0);
  # 셀의 속성이다(잠금, 가리기 등..).
  ws[key].protection = Protection(locked=True, hidden=False);

# 행의 높이를 설정한다.
for row in range(1, 14):
  ws.row_dimensions[row].height = 30;

# 열의 너비를 설정한다.
for col in range(65,70):
  ws.column_dimensions[chr(col)].width = 20;

# 열의 너비를 자동 설정하는 기능인데, 작동을 안한다...
ws.column_dimensions['A'].auto_size = True;

#위 작성한 엑셀 시트를 파일로 저장합니다.
wb.save('Example2.xlsx');
```
ref.  
https://nowonbun.tistory.com/682
https://devlog.jwgo.kr/2020/02/25/openpyxl-basic/  
https://myjamong.tistory.com/51
