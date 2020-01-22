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
- Range object는 엑셀에 입력되는 대부분의 데이터들이 보관되는 오브젝트로, 한개 내지 복수의 셀로 구성됨
- Range object에 접근하는 방법은 1) Range속성을 사용하거나, 2) Cells 속성을 사용하거나, 3) Offset 속성을 사용하거나, 4) Union 메서드를 사용하여 접근 가능
- Range 속성은 절대 위치를 지정해주며, 다음 명령으로 "A1"셀에 100 값을 입력: `Worksheets("Sheet1").Range("A1").Value = 100`
- Cell 속성은

*ref. http://iexceller.com
