Sub CODA_split_by_ADODB()
    Dim strPath     As String
    Dim Rs         As New ADODB.Recordset
    Dim strSQL     As String
    Dim strConn    As String
     
    strUnit = "373"
    
    
    strPath = GetLocalWorkbookName(ThisWorkbook.fullName, False)
    
    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
    strConn = strConn & "Data Source="
    strConn = strConn & strPath & ";"
    strConn = strConn & "Extended Properties=Excel 12.0;"
       

    Sheets("Query").Range("A1").CurrentRegion.Offset(2, 0).ClearContents
    strSQL = "SELECT account, period, sum(value)/1000 FROM [balance21$] WHERE unit = 'STO" & strUnit & "' and function = 'Store' group by account, period"
    Rs.Open strSQL, strConn
    Sheets("Query").Range("A3").CopyFromRecordset Rs
    Rs.Close


End Sub