'WorksheetChange는 셀이 변경 되었을 때, 변경된 셀의 Range 정보를 가져와서 이하 트리거 이벤트를 실행

Private Sub Worksheet_Change(ByVal Target As Range)
    '변경된 셀을 range로 받은 후 Target으로 전달

    Dim StrS    As String
    Dim RngR    As Range
    
    StrS = Target.Value
    'Range를 지정할 때에는 Set 명령어가 필수
    Set RngR = Range("F7:L26")
    
    'If StrS <> Range("G2") Then Exit Sub
    '위의 함수와 동일한 기능 수행
    If Intersect(Target, Range("G2")) Is Nothing Then Exit Sub
                
    RngR.Interior.ColorIndex = 0
    For i = 7 To 26
        If Range("G" & i) = StrS Then
            Range("F" & i).Resize(1, 7).Interior.ColorIndex = 7

        End If
        
    Next i
    
End Sub




Private Sub Worksheet_Change(ByVal Target As Range)
    '위 함수에 L2셀에 점수 트리거를 추가
    'RngR의 L행에 점수 리스트와 비교

    Dim StrS    As String
    Dim DblS As Double
    Dim RngR    As Range
    
    StrS = Range("G2").Value
    DblS = Range("L2").Value
    Set RngR = Range("F7:L26")
    
    If Intersect(Target, Range("G2, L2")) Is Nothing Then Exit Sub
                
    RngR.Interior.ColorIndex = 0

    For i = 7 To 26
    
        If Range("G" & i) = StrS And Range("L" & i) > DblS Then
            Range("F" & i).Resize(1, 7).Interior.ColorIndex = 7
        End If
        
    Next i
    
    


End Sub
