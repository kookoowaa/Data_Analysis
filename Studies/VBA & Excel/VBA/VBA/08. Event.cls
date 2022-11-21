Private Sub Workbook_Open()
    
    MsgBox "안녕하세요"
    
End Sub



Private Sub Workbook_BeforeClose(Cancel As Boolean)
    
    If MsgBox("close?", vbYesNo) = vbNo Then
        MsgBox "Lets continue"
        Cancel = True
    End If
    

End Sub
