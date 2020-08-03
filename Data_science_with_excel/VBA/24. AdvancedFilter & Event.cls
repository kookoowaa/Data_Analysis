' Regular expression과 Like 문을 활용한 유효성 검증

Private Sub Worksheet_Change(ByVal Target As Range)
    
    Dim lngE        As Long
    Dim rngD        As Range '데이터 Range
    Dim rngC        As Range '조건 Range
    Dim rngP        As Range '결과 table의 header Range
    
    If Intersect(Target, Range("I2")) Is Nothing Then Exit Sub
    
    Application.EnableEvents = False
    
    lngE = Range("A10000").End(xlUp).Row
    
    Set rngD = Range("A2:F" & lngE)
    Set rngC = Range("I1:I2")
    Set rngP = Range("H4:M4")
    
    rngP.CurrentRegion.Offset(1, 0).Clear
    rngD.AdvancedFilter xlFilterCopy, rngC, rngP, True
    
    Application.EnableEvents = True
    
End Sub