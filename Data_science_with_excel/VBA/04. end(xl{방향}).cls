Sub Test01()

    Dim i       As Long
    Dim lngR    As Long
    
    lngR = Range("b1").End(xlDown).Row
    
    For i = 2 To lngR
        If Cells(i, 2) <= 70 Then
            Cells(i, 2).Font.ColorIndex = 3
        End If
    Next
End Sub

Sub Test02()
    Dim i       As Long
    Dim lngC    As Long
    
    lngC = Range("A2").End(xlToRight).Column
    
    For i = 2 To lngC
        If Cells(2, i) <= 70 Then
            Cells(2, i).Font.ColorIndex = 3
        End If
    Next
    
End Sub

Sub test03()
    Dim i       As Long
    Dim t       As Long
    Dim lngR    As Long
    Dim lngC    As Long
    
    lngR = Range("a1").End(xlDown).Row
    lngC = Range("a1").End(xlToRight).Column
    
    For i = 2 To lngR
        For t = 2 To lngC
            If Cells(i, t) <= 70 Then
                Cells(i, t).Font.ColorIndex = 3
            End If
        Next
    Next
                
    
    
End Sub
