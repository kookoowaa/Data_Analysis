'InputBox는 크게 2가지만 알고 있으면 향후 활용하기가 용이

' "InputBox 함수"는 InputBox( prompt, [title], [default],.... 등의 파라미터를) 갖고 있음
' prompt는 InputBox의 내용, title은 제목표시줄, default는 입력창에 default로 기입되어 있는 값을 의미
' InputBox에서 취소를 누를 경우 len(InputBox의 값) = 0을 갖게 됨

' "Application의 InputBox 메서드"는 Application.InputBox( prompt, [title], [default], [Type]... 등의 파라미터)로 구성
' 위의 함수와 가장 큰 차이점은 [Type] 파라미터로, Type=8일 경우 Range를 입력값으로 받음
' 취소 시 text는 False를, Range는 Nothing을 반환
' 가급적 함수 보다는 메서드 사용을 권장

Sub InputBoxTest01()

    Dim strName     As String
    
    'Range("C3") = InputBox(Default:="홍길동", Title:="성명", prompt:="성명을 입력하세요.")
    strName = Application.InputBox("성명을 입력하세요.")
    
    If strName = "False" Then
        MsgBox "입력한 성명이 없습니다."
    Else
        Range("C3") = strName
    End If
    
End Sub



Sub InputBoxTest02()
    
    Dim rngT        As Range

    On Error Resume Next
    
    Set rngT = Application.InputBox("성별을 선택하세요", "성별", "성별선택", , , , , 8)
    ' InputBox에 아무 값도 없을 경우 rngT를 Set 하는 것이 불가능 하여 에러가 발생
    ' 위의 On Error Resume Next 문구로 인해 rngT는 변수 선언 후 range가 할당되지 않은 상태이고, 아래의 If rngT Is Nothing 조건에 부합하는 결과를 반환하게 됨
    If rngT Is Nothing Then
        MsgBox "선택한 성별이 없습니다."
    Else
        Range("C5") = rngT
    End If
    
    On Error GoTo 0
    ' On Error GoTo 0는 에러 무시 처리를 원점으로 돌림을 의미함
    
End Sub


' 하나의 Sub 프로시져로 여러개의 sub 프로시져를 호출 가능하도록 연결
Sub InputBoxTest()
    
    Dim strBT        As String
    
    ' Application.Caller는 해당 프로시져를 실행한 caller 이름을 반환
    ' 예를 들어 아래와 같이 버튼 1~3까지를 모두 본 프로시져에 연결하였을 때, 누른 버튼의 이름을 반환하도록 함
    strBT = Application.Caller
    
    If strBT = "버튼1" Then
        MsgBox "버튼2를 클릭 했을 경우"
        ' call {프로시저명}
    ElseIf strBT = "버튼2" Then
        MsgBox "버튼2를 클릭 했을 경우"
    ElseIf strBT = "버튼3" Then
        MsgBox "버튼3을 클릭 했을 경우"
    End If
    
End Sub


' 예제
Sub change_col()

    Dim rngCol As Range
    Dim rngD As Range
    Dim strCol As String
    
    Range("A5:R20").Delete
    
    Set rngCol = Application.InputBox(Prompt:="색 범위를 선택", Title:="색 선택", Type:=8)
    strCol = rngCol.Interior.ColorIndex
    
    Set rngD = Application.InputBox(Prompt:="색 변경 범위를 선택", Title:="범위 선택", Type:=8)
    
    rngD.Interior.ColorIndex = strCol

End Sub
