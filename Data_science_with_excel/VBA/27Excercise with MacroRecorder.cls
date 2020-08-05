Sub t1()
    
    Dim strMonth As String
    Dim strTrans As String
    Dim strCrit As String
    Dim lngVal As Long
    Dim lngCol As Long
    Dim rngtmp As Range
    Dim rngMonth As Range
    Dim rngTrans As Range
    Dim rngCrit As Range
    
    
    strMonth = Range("I5").Value
    strTrans = Range("I7").Value
    strCrit = Range("i9").Value
    lngVal = Range("J9").Value
    lngCol = Range("I11").Interior.Color
    
    
    Set rngtmp = Range("B5").CurrentRegion.Resize(, 1)
    
    For Each Rng In rngtmp.Offset(, 1)
        If Rng = strMonth Then
            If rngMonth Is Nothing Then
                Set rngMonth = Rng.Offset(, -1).Resize(, 5)
            Else
                Set rngMonth = Union(rngMonth, Rng.Offset(, -1).Resize(, 5))
            End If
        End If
    Next Rng
    
    For Each Rng In rngtmp.Offset(, 3)
        If Rng = strTrans Then
            If rngTrans Is Nothing Then
                Set rngTrans = Rng.Offset(, -3).Resize(, 5)
            Else
                Set rngTrans = Union(rngTrans, Rng.Offset(, -3).Resize(, 5))
            End If
        End If
    Next Rng
    
    For Each Rng In rngtmp.Offset(, 4)
        If strCrit = "이상" Then
            If Rng >= lngVal Then
                If rngCrit Is Nothing Then
                    Set rngCrit = Rng.Offset(, -4).Resize(, 5)
                Else
                    Set rngCrit = Union(rngCrit, Rng.Offset(, -4).Resize(, 5))
                End If
            Else
                If rngCrit Is Nothing Then
                    Set rngCrit = Rng.Offset(, -4).Resize(, 5)
                Else
                    Set rngCrit = Union(rngCrit, Rng.Offset(, -4).Resize(, 5))
                End If
            End If
        End If
    Next Rng
    
    Intersect(rngMonth, rngTrans, rngCrit).Interior.Color = lngCol

End Sub



'차트 만들기
Sub 매크로8()
    
    Dim cht As ChartObject
    
    Dim rngCht As Range
    
    
    
    If Sheet4.ChartObjects.Count = 0 Then
        ActiveSheet.Shapes.AddChart2(227, xlLine).Select
        Sheet4.ChartObjects(1).Left = Range("H10").Left
        Sheet4.ChartObjects(1).Top = Range("H10").Top
    End If
    Set cht = Sheet4.ChartObjects(1)
    cht.Chart.ChartArea.ClearContents
    
    For Each Rng In Range("C5:C27")
        If Rng = "2월" Then
            If rngCht Is Nothing Then
                Set rngCht = Union(Rng.Offset(, -1), Rng.Offset(, 3))
            Else
                Set rngCht = Union(rngCht, Rng.Offset(, -1), Rng.Offset(, 3))
            End If
        End If
    Next Rng
    
    cht.Chart.SetSourceData Source:=rngCht
    cht.Chart.ChartStyle = 300
    
    
End Sub