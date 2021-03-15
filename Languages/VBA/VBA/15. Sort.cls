Sub sort_test()
    Dim rngD As Range
    
    Set rngD = Range("L13:R" & Range("B2"))
    
    rngD.Sort Range("M13"), xlAscending, Header:=xlNo
    'rngD.Sort Range("M12"), xlDescending, Header:=xlYes
    'Header 파라미터를 Yes로 하면 해당 행 위 값을 헤더로 사용
    
End Sub


Sub sort_test2()
    Dim rngD As Range
    
    Set rngD = Range("L13:R" & Range("B2"))
    
    rngD.Sort key1:=Range("M12"), order1:=xlAscending, _
                       key2:=Range("R12"), order2:=xlDescending, _
                       Header:=xlYes
    
End Sub
