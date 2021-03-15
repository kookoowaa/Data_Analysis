Sub Scripting_Dictionary()

    Dim Dict        As New Scripting.Dictionary
    Dim rngD        As Range
    Dim rngT        As Range
    Dim i           As Long
    Dim strKey      As String
    Dim strValue    As String
    
    Set rngD = Range("A2:A" & Cells(Rows.Count, 1).End(xlUp).Row)
    
    For Each rngT In rngD
        strKey = rngT
        strValue = rngT.Offset(0, 1)
        
        ' Key 와 Item을 쌍으로 저장하는 구조
        ' 따라서 여기에서는 Item 값들을 콤마로 묶어 하나의 String을 구성
        If Dict.Exists(strKey) Then
            Dict(strKey) = Dict(strKey) & "," & strValue
        Else
            Dict.Add strKey, strValue
        End If
    Next
    
    Range("H1").CurrentRegion.Offset(1, 0).Clear
    
    ' n*1 형태의 array 값 (Key, Item)을 transpose 하여 수직으로 입력
    Range("H2").Resize(Dict.Count, 2) = Application.Transpose(Dict.Keys)
    Range("I2").Resize(Dict.Count, 1) = Application.Transpose(Dict.Items)
    
    Set rngD = Range("I2:I" & Cells(Rows.Count, "I").End(xlUp).Row)
    rngD.TextToColumns Destination:=Range("I2"), Comma:=True
    
    With Range("H1").CurrentRegion
        .Borders.LineStyle = 1
        .HorizontalAlignment = xlCenter
    End With
    
End Sub