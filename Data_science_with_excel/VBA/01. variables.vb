Sub var_test()

'변수는 크게 Long과 String만 알아도 크게 지장 없음
    Dim lngT As Long
    Dim lngA As Integer
    Dim lngB As Integer
    Dim strA As String

    lngA = 10
    lngB = 20
    lngT = lngA + lngB
    strA = Str(lngA) & "+" & Str(lngB) & " 의 결과는 " & Str(lngT)
    
    MsgBox strA

End Sub
