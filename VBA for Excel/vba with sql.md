## VBA로 SQL 접근하기 (SQL-Server)

## 1. 전제조건

- VBA 창에서 reference 설정이 필수
- 추가해야 하는 reference는 `Microsoft ActiveX Data Objects 2.8 Library`임

## 2. VBA로 SQL 접근하기

- 1번의 전제 조건이 갖춰지면, VBA로 SQL 접근이 가능

- 아래 전체코드 참조 후 하나 씩 설명:

  ```vb
  Option Explicit
  
  
  Sub GetData()
  
  
  Dim cnLogs As New ADODB.Connection
  
  Dim rsHeaders As New ADODB.Recordset
  
  Dim rsData As New ADODB.Recordset
  
  
  Dim l_counter As Long: l_counter = 0
  
  Dim strConn As String
  
  
  Sheets(1).UsedRange.Clear
  
  strConn = "PROVIDER=SQLOLEDB;"
  
  strConn = strConn & "DATA SOURCE=(local);INITIAL CATALOG=LogData;"
  
  strConn = strConn & " INTEGRATED SECURITY=sspi;"
  
  
  cnLogs.Open strConn
  
  
  With rsHeaders
  
  .ActiveConnection = cnLogs
  
  
  .Open "SELECT * FROM syscolumns WHERE id=OBJECT_ID('LogTable')"
  
  '.Open "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'LogTable'"
  
  '.Open "SELECT * FROM LogData.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'LogTable'"
  
  '.Open "SELECT * FROM SYS.COLUMNS WHERE object_id = OBJECT_ID('dbo.LogTable')"
  
  
  Do While Not rsHeaders.EOF
  
  Cells(1, l_counter + 1) = rsHeaders(0)
  
  l_counter = l_counter + 1
  
  rsHeaders.MoveNext
  
  Loop
  
  .Close
  
  End With
  
  
  With rsData
  
  .ActiveConnection = cnLogs
  
  .Open "SELECT * FROM LogTable"
  
  Sheet1.Range("A2").CopyFromRecordset rsData
  
  .Close
  
  End With
  
  
  cnLogs.Close
  
  Set cnLogs = Nothing
  
  Set rsHeaders = Nothing
  
  Set rsData = Nothing
  
  
  Sheets(1).UsedRange.EntireColumn.AutoFit
  
  
  End Sub
  ```

- 2016년 버전을 참조하면 다음과 같음:

  ```vb
  Sub DataFromSQLServer()
      
      'connection related variables
      Dim oCoon As ADODB.Connection
      Dim rs As ADODB.Recordset
      Dim fld As ADODB.Field
      
      'query related variables
      Dim mssql As String
      
      'excel related variables
      Dim row As Integer
      Dim col As Integer
      Dim ws As ThisWorkbook
      Set ws = ThisWorkbook
      Application.ScreenUpdating = False
      
      'process begins
      Set oConn = New ADODB.Connection
      Set rs = New ADODB.Recordset
      mssql = "Select" & _
                    "userid" & _
                    ", initiateddatetime" & _
                    "From" & _
                    "I3_IC.dbo.Calldetail_viw"
      
                  oConn.ConnectionString = "driver=RETKRCSC-NT8004;server=I3_IC;" & _ 
                  "authenticateduser=True;database={database}"
                  'select @@ servername to retrive servername
      
                  '===== If you have ID and password for SQL-server to log in =====
      'oConn.ConnectionString = "driver={DriverName};server={ServerName};" & _
      '                                            "uid={UserName};pws={Password};database={database}"
      '==================================================
       oConn.ConnectionTimeout = 30
       oConn.Open
       rs.Open mssql, oConn
       If rs.EOF Then
          MsgBox "No matching records found."
          rs.Close
          oConn.Close
          Exit Sub
      End If
      
      'paste data to exel sheet
      row = 5
      col = 1
      For Each fld In rs.Fields
          Sheet1.Cells(row, col).Value = fld.Name
          col = col + 1
      Next fld
      
      rs.MoveFirst
      row = row + 1
      
      Do While Not rs.EOF
          col = 1
          For Each fld In rs.Fields
              Sheet1.Cells(row, col).Value = fld
              col = col + 1
          Next fld
          row = row + 1
          rs.MoveNext
      Loop
      
      os.Close
      oConn.Close
      
  End Sub
  ```

ref. https://www.youtube.com/watch?v=kUpaknY5dh0

