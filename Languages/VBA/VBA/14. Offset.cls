' Offset은 기준셀로부터 n행, n열만큼 이동할 때 사용

' 응용하기 1 - For Each를 사용하여 표 안의 데이터 접근하기
' 구현은 1)UserForm을 호출한 후, 2)UserForm 통해서 변수를 입력 받고, 3)변수로 필터를 건 후 색깔을 변경토록 함


'UserForm 호출
Sub Show_Filter()

    UserForm1.Show
    
End Sub


'유저폼에서 콤보박스를 선택 시 내부 데이터는 RowSource에서 지정 가능 ('{시트명}'!{정의된 이름 범위})
'유저폼의 콤보박스 값 변경 시 B3에 해당 값을 전달
Private Sub ComboBox1_Change()

    Range("B3") = Me.ComboBox1.Value
    Call Col_Make
    
End Sub

'전달받은 변수로 loop 돌며 조건에 맞을 시 색깔 변경
Sub Col_Make()
    
    '조건 대상 범위 RngD에서 하나씩 순환하며 RngR에 값 부여
    
    Dim RngR As Range
    Dim RngD As Range
    Dim lngE As Integer
    
    lngE = Range("B2")
    Set RngD = Range("M13:M" & lngE)
    Range("L13:R" & lngE).Interior.ColorIndex = 2
    
    'M열에 반정보가 담겨 있어 해당 열을 loop 돌며 조건 확인
    '조건 필터 기준은 userform에서 전달받아 B3에 기록된 변수를 사용
    For Each RngR In RngD
        If RngR = Range("B3") Then
            RngR.Offset(0, -1).Resize(1, 7).Interior.ColorIndex = 6
        End If
    
    Next RngR
    
End Sub





'평균 조건이 하나 추가된다면 다음과 같이 코드를 추가
Sub Col_Make()
    
    Dim RngR As Range
    Dim RngD As Range
    Dim lngE As Integer
    
    lngE = Range("B2")
    Set RngD = Range("M13:M" & lngE)
    Range("L13:R" & lngE).Interior.ColorIndex = 2
    For Each RngR In RngD
        'If 조건에 And조건이 추가되어 평균점수(B4)와 비교
        If RngR = Range("B3") And RngR.Offset(0, 5) > Range("B4") Then
            RngR.Offset(0, -1).Resize(1, 7).Interior.ColorIndex = 6
        End If

    Next RngR
    
End Sub

'또한 TextBox의 경우 Change 대신 AfterUpdate로 함수를 적용해야 숫자 하나씩 입력될때마다 함수를 호출하는 것을 방지
Private Sub TextBox1_AfterUpdate()
    
    If Me.TextBox1.Value > 0 Then
        Range("B4") = Me.TextBox1.Value
        Call Col_Make
    End If
End Sub
