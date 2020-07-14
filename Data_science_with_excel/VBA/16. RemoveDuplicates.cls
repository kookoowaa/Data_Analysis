Sub test01()

    Dim rngD As Range
    Dim lngE As Long
    
    lngE = Range("F10000").End(xlUp).Row
    '아래와 같이 위와 동일한 결과 도출 가능
    'lngE = Cells(Rows.Count, "F").End(xlUp).Row
    
    Set rngD = Range("F6:F" & lngE)
    Range("H:H").Clear
    rngD.Copy Range("H6")
    
    Set rngD = Range("H6:H" & lngE)
    rngD.RemoveDuplicates Columns:=1, Header:=xlYes
        
End Sub


Sub test02()

    Dim rngD As Range
    Dim lngE As Long
    
    lngE = Range("F10000").End(xlUp).Row
    'lngE = Cells(Rows.Count, "F").End(xlUp).Row
    
    Set rngD = Range("F6:G" & lngE)
    Range("I:J").Clear
    rngD.Copy Range("I6")
    
    Set rngD = Range("I6:J" & lngE)
    '파라미터로 array 입력 가능
    rngD.RemoveDuplicates Columns:=Array(1, 2), Header:=xlYes
    
End Sub


Sub test03()

    Dim rngD As Range
    Dim lngE As Long
    
    lngE = Range("F10000").End(xlUp).Row
    
    Set rngD = Range("F6:H" & lngE)
    Range("J:L").Clear
    rngD.Copy Range("J6")
    
    Set rngD = Range("J6:L" & lngE)
    rngD.RemoveDuplicates Columns:=Array(1, 2, 3), Header:=xlYes
    
End Sub



'중복 제거 후 정렬
Sub test01()

    Dim rngD As Range
    Dim lngE As Long
    
    lngE = Range("F10000").End(xlUp).Row
    
    Set rngD = Range("F6:F" & lngE)
    Range("H:H").Clear
    rngD.Copy Range("H6")
    
    Set rngD = Range("H6:H" & lngE)
    rngD.RemoveDuplicates Columns:=1, Header:=xlYes
    
    Range("H6").CurrentRegion.Sort key1:=Range("H6"), order1:=xlAscending, Header:=xlYes
    
End Sub