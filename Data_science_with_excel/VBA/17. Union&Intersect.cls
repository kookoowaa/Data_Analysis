Sub union_test01()
    Dim lange As Long
    Dim rngd As Range
    Dim i As Long
    
    lnge = Range("F10000").End(xlUp).Row
    
    For i = 7 To lnge
    
        If Range("G" & i) = "남" Then
            If rngd Is Nothing Then
                Set rngd = Range("G" & i)
            Else
                Set rngd = Union(rngd, Range("G" & i))
            End If
        End If
        
    Next i
    
    rngd.EntireRow.Delete
    
    ' 매크로 버튼의 경우, 설정 > 속성 > 변하지 않음으로 설정하여야 행을 지우더라도 버튼 크기가 변하지 않음
End Sub



Sub union_test02()

    Dim lange As Long
    Dim rngd As Range
    Dim i As Long
    
    lnge = Range("F10000").End(xlUp).Row
    
    Range("o7").CurrentRegion.Offset(1, 0).Delete
    
    For i = 7 To lnge
    
        If Range("G" & i) = "여" Then
            If rngd Is Nothing Then
                '행을 한번에 삭제하는 위의 예제와는 다르게 표를 선택해야 하는 만큼, offset과 resize를 활용
                Set rngd = Range("G" & i).Offset(0, -1).Resize(1, 7)
            Else
                Set rngd = Union(rngd, Range("G" & i).Offset(0, -1).Resize(1, 7))
            End If
        End If
        
    Next i
    
    rngd.Copy Range("o7")
End Sub


'union_test03과 test04는 동일한 결과를 반환하며, intersect를 쓰는지 nested and 문을 쓰는지 차이가 있음
Sub union_test03()

    Dim lange As Long
    Dim rngd As Range
    Dim rngd2 As Range
    Dim rngd3 As Range
    Dim i As Long
    
    lnge = Range("F10000").End(xlUp).Row
    
    Range("o7").CurrentRegion.Offset(1, 0).Delete
    
    For i = 7 To lnge
    
        If Range("G" & i) = "여" Then
            If rngd Is Nothing Then
                Set rngd = Range("G" & i).Offset(0, -1).Resize(1, 7)
            Else
                Set rngd = Union(rngd, Range("G" & i).Offset(0, -1).Resize(1, 7))
            End If
        End If
        
        If Range("l" & i) > 70 Then
            If rngd Is Nothing Then
                Set rngd2 = Range("l" & i).Offset(0, -7).Resize(1, 7)
            Else
                Set rngd2 = Union(rngd2, Range("l" & i).Offset(0, -7).Resize(1, 7))
            End If
        End If
            
    Next i
    
    Set rngd3 = Intersect(rngd, rngd2)
    rngd3.Copy Range("o7")
End Sub



Sub union_test04()

    Dim lange As Long
    Dim rngd As Range
    Dim i As Long
    
    lnge = Range("F10000").End(xlUp).Row
    
    Range("o7").CurrentRegion.Offset(1, 0).Delete
    
    For i = 7 To lnge
    
        If Range("G" & i) = "여" And Range("l" & i) > 70 Then
            If rngd Is Nothing Then
                Set rngd = Range("f" & i).Resize(1, 7)
            Else
                Set rngd = Union(rngd, Range("F" & i).Resize(1, 7))
            End If
        End If
            
    Next i

    rngd.Copy Range("o7")
End Sub
