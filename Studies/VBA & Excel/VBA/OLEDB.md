# OLEDB, VBA and string connection

> - VBA 창에서 reference 설정이 필수
> - 추가해야 하는 reference는 `Microsoft ActiveX Data Objects x.x Library`임 (6.1 사용)
> - **String connection**을 통해 다른 dataset에 접근하여 원하는 데이터만 추출

## 1. 기본 세팅

- 기본적으로 가져가게 되는 코드 구조는 아래와 같음

  ```vb
  Dim Rs         As New ADODB.Recordset
  Dim strSQL     As String '{쿼리문}'
  Dim strConn    As String '{string connection}'
  
  strSQL = 
  strConn = 
  
  Rs.Open strSQL, strConn
  
  Range("A1").CopyFromRecordset Rs
  ```

- `ADODB.Recordset`으로 객체를 생성하고, 쿼리문과 string connection을 통해 Dataset에 접근하여 원하는 결과물을 담아오게 됨

- 이때 접근하려는 dataset의 종류에 따라 사용하는 string connection이 상이하게 됨

## 2. String connection to excel

- 엑셀파일을 dataset으로 사용할 때에는 다음과 같은 string connection 구조를 사용

  ```vb
  strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
  strConn = strConn & "Data Source= {엑셀파일 경로 및 파일명};"
  strConn = strConn & "Extended Properties=Excel 12.0;"
  ```

- 위의 파라미터에 `Data Source` 파라미터만 파일 경로로 설정해주면 string connection은 완성

- 이때 StrSQL의 `FROM` 절에서 참조하는 테이블명은 시트명을 (시트명 뒤에 $문자 추가) 사용

  ```vb	
  '시트명이 Table_1일 때
  strSQL = "SELECT * FROM [Table_1$]"
  ```

## 3. String connection to CSV

- csv를 dataset으로 사용할 때에는 다음과 같은 string connection 구조를 사용

  ```vb
  strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
  strConn = strConn & "Data Source= {csv 파일 경로};"
  strConn = strConn & "Extended Properties=""text;HDR=Yes;FMT=Delimited"";"
  ```

- 위의 파라미터에 `Data Source` 파라미터만 파일 경로로 설정해주면 string connection은 완성

- 이때 StrSQL의 `FROM` 절에서 참조하는 테이블명은 csv 파일명을(확장자 포함) 사용

  ```vb	
  strSQL = "SELECT * FROM ["&{파일명}&"]"
  strSQL = "SELECT * FROM [sampledata.csv]"
  ```

## 4. String connection to Access

- Access를 dataset으로 사용할 때에는 다음과 같은 string connection 구조를 사용

  ```vb
  strConn = "Provider=Microsoft.ACE.OLEDB.12.0;"
  strConn = strConn & "Data Source= {Access 파일 경로 및 파일명};"
  'rs.Open strSQL, strConn, adOpenStatic, adLockReadOnly, adCmdText
  ```

- 위의 파라미터에 `Data Source` 파라미터만 파일 경로로 설정해주면 string connection은 완성

- 이때 StrSQL의 `FROM` 절에서 참조하는 테이블명은 Access db 내의 테이블명을 사용

  ```vb	
  strSQL = "SELECT * FROM ["&{테이블명}&"]"
  strSQL = "SELECT * FROM [sampledata]"
  ```

## 5. recordset.Open

- `recordset.Open` 의 구조를 살펴보면 다음과 같음

  ```vb
  recordset.Open Source, ActiveConnection, CursorType, LockType, Options  
  ```

- 여기서 `Source:=`는 SQL문, `ActiveConnection:=`에는 String connection이 들어가게 됨

- 이 외 선택 파라미터로 `CursorType`, `LockType`, `Options`가 들어갈 수 있음:

  >### CursorTypeEnum
  >
  >- 기본 값으로 `adOpenForwardOnly`를 갖으며 Connection 기준으로, 레코드 앞으로만 이동 가능함
  >- `adOpenDynamic`을 사용하면, 동적 커서를 사용하며, 다른 사용자에 의한 추가, 변경 및 삭제 내용이 표시됨
  >- `adOpenStatic`의 경우 복사본 커서를 사용하며, 다른 사용자의 추가, 변경 또는 삭제는 표시하지 않음

  > ### LockType
  >
  > - 기본값으로 `adLockReadOnly`를 갖으며, 데이터 변경을 허용하지 않음
  > - 반대의 경우 `adLockOptimistic`이나 (`Update` 메서드 필수),  `adLockBatchOptimistic`을 지정 시 업데이트가 가능

  > ### Options
  >
  > - `adCmdText`를 지정할 경우 SQL 문장 같이 텍스트로 된 명령을 사용
  > - `adCmdTable`은 레코드셋을 생성하는 테이블 명을 지칭

## 다른 방식으로 OLEDB 사용하기

- 위의 방식은 `RecordSet`을 열고 SQL문과 String connection을 한번에 push

- 위의 프로세스를 조금더 한단계씩 끊어서 살펴보면 다음과 같음

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
  end sub
                  
  ```

  

