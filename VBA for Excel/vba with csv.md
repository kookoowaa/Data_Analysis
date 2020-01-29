# VBA로 CSV 파일 활용하기

- 두가지 방식으로 CSV 파일 불러오는 것이 가능

- 1번 방식은 CSV 파일을 한줄씩 읽어서 불러오는 방법으로 UTF-8을 정상적으로 읽어오는지 확인 필요

  ```vb
  Sub OpenTextFile1()
  
      Dim strPath As String
      Dim intRow As Integer
      Dim strSeparate As String
      
      Dim strCSV() As String
      Dim intLenCSV As Integer
      
          
       
      strPath = "D:\Git\Data_Analysis\VBA for Excel\samples\SalesJan2009.csv"
      strSeparate = ","
      
      Open strPath For Input As #1
      
      intRow = 1
      ' 첫번째 행 Line 1 을 정의
      
      Do Until EOF(1)
      
          Line Input #1, LineFromFile
          
          'lineitems = Split(LineFromFile, strSeparate)
          strCSV = Split(LineFromFile, strSeparate)
          'lineLen = UBound(lineitems) - 1
          intLenCSV = UBound(strCSV)
          
              For singleLine = 0 To intLenCSV
              
                  Cells(intRow, singleLine + 1).Value = strCSV(singleLine)
              Next singleLine
  
          'Cell 위치 row_number 는 행번호이고 뒤에 붙는 1,2,3 은 A,B,C 순서대로...
                          
                          
          intRow = intRow + 1
          'row_number 를 하나씩 증가 즉, 행번호 1,2,3,4,.... 로 증가함
          
      Loop
      
      Close #1
      
  End Sub
  ```

- 2번 방식은 `ActiveWorkbook.Sheets({시트명}).QueryTables` 함수를 활용하는 방법으로 훨씬 간단함

  ```vb
  Sub readCSV()
      Dim ws As Worksheet, strFile As String
  
      Sheets.Add.Name = "CSV"
      Worksheets("CSV").Range("A1:Z9999").Clear
      Set ws = ActiveWorkbook.Sheets("CSV")
  
      strFile = "D:\Git\Data_Analysis\VBA for Excel\samples\SalesJan2009.csv"
  
      With ws.QueryTables.Add(Connection:="TEXT;" & strFile, Destination:=ws.Range("A1"))
           .TextFileParseType = xlDelimited
           .TextFilePlatform = 65001 'UTF-8은 65001로 정의
           .TextFileCommaDelimiter = True
           .Refresh
      End With
  End Sub
  ```

ref1. https://stackoverflow.com/questions/46638267/import-csv-using-utf-8

ref2. http://blog.naver.com/PostView.nhn?blogId=iotc21&logNo=221488099948