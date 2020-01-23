# VBA for Excel

## 1. VBA
### 가. 기본 구조
- BASIC<sup>Beginner's All purpose Symbolic Instruction Code</sup>에서 출발, **V**isual **B**asic for **A**pplication으로 발전
- VBA는 객체지향형 언어임
- 기본적인 구조는 아래와 같음:
  ```
  Sub 안녕하세요()
      Msg = Application.UserName & "님 안녕하세요?"
      Answer = MsgBox(Msg, vbYesNo)

      If Answer = vbYes Then
          MsgBox "안녕하시다니 다행이네요!"
      Else
          MsgBox "저런, 무슨 일이 있었나요?"
      End If
  End Sub
  ```
- `Sub`으로 시작해서 `End Sub`으로 서브 프로시져 실행을 컴퓨터에 지시
### 나. Property/Method
- VBA의 오브젝트는 하나 이상의 **property**와 **method**로 구성되어 있음
- 오브젝트를 **Property**로 표현하면 다음과 같음: `candy.sweet = True`
- 오브젝트를 **method** 형태로 표현하면 다음과 같음: `candy makes sweet`
- 아래와 같이 2개의 서브 프로시져를 연결시키면, 1번 서브 프로시져로 프로퍼티를 생성하고, 2번 서브 프로시져로 이를 삭제하는 메서드를 구현:
  ```
  Sub ValueProperty()
    Dim i As Integer

    For i = 1 To 20
        Cells(i, 1).Value = "안녕하세요!"
    Next i
  End Sub
  ```
  ```
  Sub ClearContentsMethod()

    Dim i As Integer

    For i = 1 To 20
        Cells(i, 1).ClearContents
    Next i
    
  End Sub
  ```
### 다. 중요한 objects
- 엑셀 VBA에서 중요한 object를 몇개 나열하자면 `Workbooks`, `Worksheet`, 그리고 `Range`가 있음
- Workbooks object는 엑셀 통합문서를 의미하며 자주 사용하는 명령어로는 `Workbooks.Add`, `ActiveWorkbook.SaveAs` 등이 있음
- Worksheet object는 워크시트 그 자체를 의미하며 자주 사용하는 명령어로는 `Worksheets("Sheet2").Activate`, `ActivSheet.Name`,`Worksheets.Add` 등이 있음
- **Range object는 엑셀에 입력되는 대부분의 데이터들이 보관되는 오브젝트**로, 한개 내지 복수의 셀로 구성됨
- Range object에 접근하는 방법은 크게 다음 4가지로, 1) Range속성을 사용하거나, 2) Cells 속성을 사용하거나, 3) Offset 속성을 사용하거나, 4) Union 메서드를 사용하여 접근 가능
- Range 속성은 절대 위치를 지정해주며, 다음 명령으로 "A1"셀에 100 값을 입력: `Worksheets("Sheet1").Range("A1").Value = 100`
-  아래와 같이 복수의 영역을 선택하고 동시에 값을 입력하는 것도 가능
	```
	Sub WriteData()

    With Range("A1,A3,A5,A7,A9,B2,B4,B6,B8,B10")
        .Select
        .Value = "VBA"
    End With
    
	End Sub
	```
- Cell 속성은 상대적 위치의 Range object에 접근 (pandas의 `iloc`와 비슷): `Cells(3, 2).Select`
- Cell 속성 앞에 아무 조건이 없다면, 전체 worksheet에서 (A1에서) 행, 열 위치의 Range object를, 앞에 조건이 붙는다면 (`Range("C2:E5").Cells(2,2).Select`) 조건이 시작하는 곳(C2)로부터 행, 열만큼 떨어져 있는 상대적 위치의 Range object에 접근
- Offset 속성은 `Rows`(`EntireRow`), `Columns`(`EntireColumn`), `CurrentRegion`, `UsedRange` `Offset`, `Resize`등을 사용하여 Range object에 접근
- Union 속성은 여러개의 Range를 하나로 묶어 Range object에 접근토록하며 합집합 개념의 `Union`과 교집합 개념의 `Intersect`가 있음: `Union(Arg1 As Range, [Arg2], [Arg3]....)`
- 이 외 이동 명령어(F5)의 기능들을 VBA로 구현하는 방법은 `SpecialCells` 라고 하며, 아래 파라미터를 참조:

	|상 수|셀 타입|
	|---|---|
	|xlCelltypeAllFormatConditions|표시 형식이 설정되어 있는 셀|
	|xlCelltypeValidations|유효성 조건이 설정된 셀|
	|xlCelltypeBlanks|빈 문자열이 들어있는 셀|
	|xlCelltypeComments|메모가 들어있는 셀|
	|xlCelltypeConstants|상수가 포함되어 있는 셀
	|xlCelltypeFormulas|수식이 들어있는 셀|
	|xlCelltypeLastCell|사용된 범위 내의 마지막 셀
	|xlCelltypeSameFormatConditions|같은 서식을 가진 셀
	|xlCelltypeSameValidation|같은 유효성 조건을 가진 셀
	|xlCelltypeVisible|화면에 보이는(나타나 있는) 모든 셀
	|xlErrors|에러값
	|xlLogical|논리값
	|xlNumbers|숫자값
	|xlTextValues|문자열값
  
- 예를 들어 "A1:G20"에서 빈 셀만 선택하고 싶다면 다음과 같이 구현 가능: `Range("A1:G20").SpecialCells(xlCellTypeBlanks).Select`
- `End` 속성도 빈번하게 활용하는 기능 중 하나로, ctrl + 방향키 조합의 기능을 VBA로 구현하는 방법임: `Range("A65536").End(xlUp).Offset(1, 0).Select`

	|이동 방향|인 수|단축 키|
	|---|---|---|
	|위쪽 끝|End(xlUp)|<Ctrl> + ↑|
	|아래쪽 끝|End(xlDown)|<Ctrl> + ↓|
	|왼쪽 끝|End(xlToLeft)|<Ctrl> + ←|
	|오른쪽 끝|End(xlToRight)|<Ctrl> + →|

### 라.	프로시져 종류
- VBA for Excel의 프로시져는 크게 `Sub` 프로시져와 `Function` 프로시져로 구분
- Sub 프로시져는 상대적으로 제약이 적고 다양한 방법으로 프로시져를 실행 가능 
- Function 프로시져는 사용자 함수 느낌으로, 1) 다른 프로시져에서 지정된 function을 호출하거나, 2) 시트 내에서 함수 사용하듯이 호출하는 방법으로만 실행이 가능
- Function을 만드는데 있어서, 파라미터가 없거나, 기본 값과 함께 선택적으로 변경하거나, 개수 제약이 없는 등 다양하게 파라미터를 활용 가능	


*ref. http://iexceller.com
