Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    
    'Range를 Target변수로 받아서 적용
    With Target.Interior
    
        If .ColorIndex = 3 Then
            .ColorIndex = 0
        Else
            .ColorIndex = 3
        End If
        
    End With
    
    
End Sub



Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    
    '위의 함수에서 범위 제한을 추가할 경우 아래 라인을 추가
    'Intersect 함수는 n개의 인자값 중에 겹치는 부분을 반환
    'Exit Sub는 중간에 Sub를 중지토록 함
    If Intersect(Target, Range("F7:L26")) Is Nothing Then Exit Sub
    
    '범위 선택의 경우 sub 중지
    If Target.Count > 1 Then Exit Sub
        
    With Target.Interior
    
        If .ColorIndex = 3 Then
            .ColorIndex = 0
        Else
            .ColorIndex = 3
        End If
        
    End With
    
    
End Sub



Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    
    If Intersect(Target, Range("E9", Range("e9").End(xlDown))) Is Nothing Then Exit Sub

    If Target.Count > 1 Then Exit Sub
        
    With Target.Interior
    
        If .ColorIndex = 3 Then
            .ColorIndex = 2
        Else
            .ColorIndex = 3
        End If
        
    End With
    
    '표의 첫번째 컬럼에 국한하여 색깔을 변경 시키되,
    '첫번째 컬럼의 색깔에 따라 표의 나머지 컬럼의 font 속성을 변경
    If Target.Interior.ColorIndex = 3 Then
        Target.Offset(0, 1).Resize(1, 5).Font.Bold = True
    ElseIf Target.Interior.ColorIndex = 2 Then
        Target.Offset(0, 1).Resize(1, 5).Font.Bold = False
    End If
    
    
End Sub

