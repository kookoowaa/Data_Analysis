# VBA and string connection

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

- 이때 StrSQL의 `FROM` 절에서 참조하는 테이블명은 시트명을 사용

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

## 





