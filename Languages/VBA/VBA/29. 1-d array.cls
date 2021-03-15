Sub test2()
    Dim i       As Long
    Dim T
    Dim v1(50000 - 3)
    Dim v2(50000 - 3)
    Dim v3(50000 - 3)
    
    T = Now
    
    For i = 1 To 50000 - 3
        v1(i) = Range("G1").Offset(i + 2)
        v2(i) = Range("H1").Offset(i + 2)
        v3(i) = v1(i) * v2(i)
    Next
    
    Range("i3").Resize(50000 - 3, 1) = Application.Transpose(v3)
    
    T = Now - T
    MsgBox Format(T, "HH:MM:SS")
End Sub
    
