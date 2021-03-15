Sub ClearAll()
    
    'Clear All
    Range("F7:L26").Clear

End Sub



Sub ClearVals()
    
    'Clear values leaving formats as how it is
    Range("F7:L26").ClearContents

End Sub



Sub DelAll()
    
    'Delete(remove) entire range
    Range("7:26").Delete

End Sub



Sub ClearFormat()
    
    'Delte format only
    Range("F7:L26").ClearFormat

End Sub



Sub ConditionalDel()

    Dim i As Integer
    
    For i = 26 To 7 Step -1

        If Cells(i, "G") = "남" Then

            Rows(i).Delete
            'Cells(i, "G").EntireRow.Delete
            
        End If
        
    Next i
    
End Sub