'우클릭 시 지정 범위를 대상으로 차트 생성
'1)차트생성 함수와 2)조건에 따른 BeforeRightClick 이벤트 함수로 구현

'BeforeRightClick 이벤트 (Sheet)
Private Sub Worksheet_BeforeRightClick(ByVal Target As Range, Cancel As Boolean)
    If Target.Count > 1 Then
        'Cells 함수는 지정한 범위 영역 안에서도 적용 가능
        If Target.Cells(1, 1) <> "" Then
        
            Call Chart01
            Cancel = True
            
        End If
    
    ElseIf Target.Count = 1 And Target = "" And ActiveSheet.ChartObjects.Count > 1 Then
    
        ActiveSheet.ChartObjects.Delete
    
    End If
    
End Sub

'차트생성 함수
Sub Chart01()
    Dim rngd As Range
    Dim cht As Object
    
    Set rngd = Selection
    '빈 차트 생성
    Set cht = ActiveSheet.Shapes.AddChart2
    
    위 범위를 차트에 할당
    cht.Chart.SetSourceData Source:=rngd
    
End Sub



'빈칸 우클릭 시 차트 삭제
Private Sub Worksheet_BeforeRightClick(ByVal Target As Range, Cancel As Boolean)
    If Target.Count > 1 Then
 
        If Target.Cells(1, 1) <> "" Then
        
            Call Chart01
            Cancel = True
            
        End If
    
    '한칸 선택 + 빈칸선택 + 시트에 차트가 있을 경우에만 발동
    ElseIf Target.Count = 1 And Target = "" And ActiveSheet.ChartObjects.Count > 1 Then
    
        ActiveSheet.ChartObjects.Delete
    
    End If
    
End Sub