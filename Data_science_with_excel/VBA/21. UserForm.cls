'Userform의 콤보박스의 값을 코딩으로 설정 가능
'UserForm, Initialize 선택 후 Me.ComboBox1.List에 Array를 입력하는 것으로 초기 데이터 세팅 가능
'또한 오입력을 방지하기 위해, 속성의 Style에서 "2 - fmStyleDropDownList"로 세팅아면 유효성 검증이 됨

Private Sub UserForm_Initialize()
    Me.ComboBox1.List = Array("남", "여")
End Sub


'확인 버튼을 호출 시 아래와 같은 프로시져 실행
Private Sub CommandButton1_Click()
    
    Dim lngR        As Long
    
    lngR = Range("D65536").End(xlUp).Row + 1
    
    Range("C" & lngR) = "=row()-2"
    Range("D" & lngR) = Me.TextBox1
    Range("E" & lngR) = Me.ComboBox1
    '나이 값은 숫자로 입력되어야 하기 때문에 Val() 사용
    '정확하게 하려면, Cdbl()이나 Clng()를, 그리고 Me.TextBox3.value를 사용하는 것이 정석
    Range("F" & lngR) = Val(Me.TextBox3)
    
    With Range("C" & lngR).Resize(1, 4)
        .Borders.LineStyle = 1
        .HorizontalAlignment = xlCenter
    End With
    
    Range("D" & lngR + 1).Select
    
    Unload UserForm1
    
End Sub


'조회 기능은 역으로 Me.{오브젝트}에 값을 입력하는 방식을 사용
'코드가 간단한 이유는 입력값("A1")으로부터 엑셀 worksheet 함수 Match, Index로 구한 값을 ("A3:A4") 역으로 가져오기 때문
Private Sub CommandButton1_Click()
    
    Range("A1") = Me.TextBox1
    Me.ComboBox1 = Range("A3")
    Me.TextBox3 = Range("A4")
        
End Sub


'수정 기능은 이름열로 For Loop를 구현, Me.TextBox1.value 값과 일치 할 경우, 동일 행의 값들을 업데이트 하는 방식을 차용
Private Sub CommandButton2_Click()
    Dim rngT As Range
    
    For Each rngT In Range("D2", Range("D2").End(xlDown))
        If rngT.Value = Me.TextBox1 Then
            rngT.Offset(0, 1).Value = Me.ComboBox1.Value
            rngT.Offset(0, 2).Value = CDbl(Me.TextBox3.Value)
        End If
    Next rngT
        
    
    
    
End Sub
