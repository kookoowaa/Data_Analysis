Private Sub CommandButton1_Click()
    
    Sheet3.Range("B2") = Me.TextBox1.Value
    
    If Sheet3.Range("B3") = 1 Then
        MsgBox ("hej, welcome")
        Unload UserForm1
        
    Else
        MsgBox ("Wrong ID")
        ActiveWorkbook.Close (False)
        
    End If
    
End Sub
