'Samples 폴더의 "21강 실습파일.xlsm"과 병행


Sub sample_01()

    Dim rngD As Range
    Dim rngX As Range
    
    Set rngD = Union(Range("A1:A17"), Range("D1:D17"), Range("G1:G16"))
    
    For Each rngX In rngD
        rngX.Offset(0, 1).Interior.ColorIndex = rngX.Value
    Next rngX
    
End Sub

Sub sample_02()
    
    Dim rngD As Range
    Dim rngX As Range
    
    Set rngD = Range("A1:I17")
    For Each rngX In rngD
        If rngX.Interior.ColorIndex >= 0 Then
            rngX.Offset(0, 1).Value = rngX.Interior.ColorIndex
        End If
    Next rngX
    
End Sub

Sub sample_03()
    
    Dim rngD As Range
    Dim rngX As Range
    
    Set rngD = Range("rngImage")
    
    For Each rngX In rngD
        If rngX.Value = 1 Then
            rngX.Interior.ColorIndex = 1
        End If
    Next rngX

End Sub

