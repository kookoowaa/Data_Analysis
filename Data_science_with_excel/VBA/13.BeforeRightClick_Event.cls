'셀에 작성된 문장을 클릭하면 음성으로 읽어주는 기능 구현
'셀 더블클릭 이벤트 > 유저폼 > 유저폼의 레이블에서 셀값 호출 > 버튼으로 음성 구현

'더블클릭 이벤트 (Sheet)
Private Sub Worksheet_BeforeDoubleClick(ByVal Target As Range, Cancel As Boolean)
    
    If Target = "" Then Exit Sub
    '셀 값을 레이블로 전송
    UserForm1.Label1 = Target.Value
    
    UserForm1.Show
    
End Sub

'유저폼 버튼
Private Sub CommandButton1_Click()
    
    Application.Speech.Speak UserForm1.Label1
    Unload Me
    
End Sub