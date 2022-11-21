'usecase: 
'out:     

Sub DeleteAccess()
    Dim strPath     As String
    Dim rs         As New ADODB.Recordset
    Dim conndb As New ADODB.Connection
    Dim strSQL     As String
    Dim strConn    As String


    strPath = GetLocalWorkbookName(True)
    strPath = strPath + "\FC.accdb"
    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
    strConn = strConn & "Data Source="
    strConn = strConn & strPath
    
    
    conndb.Open strConn
    strSQL = "Delete * from FC21  where unit='STO373' and FC = 'FCA'"
    conndb.Execute strSQL

    conndb.Close
    
    
End Sub


Sub InsertAccess()
    Dim strPath     As String
    'dim rs         As New ADODB.Recordset
    Dim Cn As New ADODB.Connection
    Dim strSQL     As String
    Dim strConn    As String

    
    strPath = GetLocalWorkbookName(False)
    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
    strConn = strConn & "Data Source=" & strPath
    strConn = strConn & ";Extended Properties=Excel 12.0;"
    
    Cn.Open strConn
   
    strSQL = "Insert into FC21 in 'C:\Users\chpar10\OneDrive - IKEA\Dev_onedrive\Test(adodb update)\FC.accdb' select 'STO373' as Unit, FC, line, period, balance from [Sheet1$a2:d2554] where FC='FCA'"
    Cn.Execute strSQL

    Cn.Close
    
    
End Sub
