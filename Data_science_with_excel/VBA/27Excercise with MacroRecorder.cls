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