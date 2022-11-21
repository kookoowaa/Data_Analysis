Function UserName() As String
    Dim PathName As String
    Dim FileName As String
    
    PathName = "C:\Users\"
    FileName = Dir(PathName, vbDirectory)
    Do While FileName <> ""
        If GetAttr(PathName & FileName) = vbDirectory Then
            If Not (IsError(Application.Match(FileName, Array("chpar10", "nacha32", "solee2", "Yekim20", "Yenam2", "Ypark"), 0))) Then
                UserName = FileName
           End If
        End If
        FileName = Dir()
    Loop
End Function