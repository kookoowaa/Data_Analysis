'' 유사한 기능을 수행하는 코드를 2가지 방법으로 구현
'' 하나는 워크시트에서 특정 셀을 더블클릭하는 방법이고, 다른 하나는 별도로 실행하는 방식임
'' 본 강의에서 중요 포인트는 1) 파일을 검색하고 2) 불러오는 법이라고 할 수 있겠음

'' 파일을 검색하기 위해서 디렉터리를 지정해 주어야 하는데, 
'' 우선 ThisWorkbook.Path 명령어로 현재 파일이 위치한 디렉터리 String 값을 가져올 수 있음
'' 또 다른 방법으로는 Application.GetOpenFilename()으로 파일 열기 기능이 실행되며, 선택한 파일의 전체 경로를 String 값으로 반환하는 방법도 있음
'' 마지막으로 Dir({디렉터리 주소}) 함수로 파일 경로를 가져올 수도 있는데, 이 때 *같은 방식으로 RE를 사용할 수 있어서 자동화에 써먹기도 함 (".*", 확장자가 불확실한 경우)
'' 가져온 경로 값으로 이미지를 불러오는 것은 ActiveSheet.Pictures.Insert()함수로 실행함
'' ActiveSheet.Pictures.Insert()함수는 인터넷 주소로 이미지를 가져올 수도 있음


'' 31강 과제물 풀이.xlsm 파일 참조
Private Sub Worksheet_BeforeDoubleClick(ByVal Target As Range, Cancel As Boolean)

    Dim strPath     As String
    
    Application.EnableEvents = False
    
    If Target.Address = "$G$17:$G$23" Then
        ChDir ThisWorkbook.Path & "\Image" '''' 기본경로
        strPath = Application.GetOpenFilename(Title:="이미지 선택하기") '' 기본경로로 열림
        Range("J17").Select ''' 더블클릭 취소
        
        If strPath <> "False" Then
            Call Image_Insert(strPath)
            Range("J17").Select
        End If
    End If
    
    Application.EnableEvents = True
    
End Sub


Sub Image_Insert(Optional strPath As String)
    Dim strFolder   As String
    Dim strFile     As String
    Dim Img         As Object
    Dim rngT        As Range
    
    strFolder = ThisWorkbook.Path & "\Image\"
    If strPath = "" Then
        strPath = strFolder & Range("B5")
        strFile = Dir(strPath & ".*")
        strPath = strFolder & strFile
    End If
    
    Set rngT = Range("G17:G23")
    ActiveSheet.Pictures.Insert(strPath).Select
    With Selection
        .ShapeRange.LockAspectRatio = msoFalse
        .Width = rngT.Width - 4
        .Height = rngT.Height - 4
        .Left = rngT.Left + 2
        .Top = rngT.Top + 2
    End With
End Sub


'' VBA실무_이미지가져오고저장하기.xlsm 파일 참조
Sub Get_image_Url()

    Dim strUrl      As String
    Dim rngT        As Range
    Dim img         As Object
    
    ActiveSheet.Pictures.Delete
    
    strUrl = Range("D6").Value
    Set rngT = Range("D8")
    
    Set img = ActiveSheet.Pictures.Insert(strUrl)
    
    img.Left = rngT.Left + (rngT.Width - img.Width) / 2
    img.Top = rngT.Top + (rngT.Height - img.Height) / 2
    
End Sub

Sub Get_image_Url_change_dim()

    Dim strUrl      As String
    Dim rngT        As Range
    Dim img         As Object
    
    ActiveSheet.Pictures.Delete
    
    strUrl = Range("D6").Value
    Set rngT = Range("D8")
    
    Set img = ActiveSheet.Pictures.Insert(strUrl)
    img.Name = Range("C6")
    
    ' 너비/높이 조정
    If img.Height > rngT.Height Then
        img.Height = rngT.Height
    End If
    
    If img.Width > rngT.Width Then
        img.Width = rngT.Width
    End If
    
    img.Left = rngT.Left + (rngT.Width - img.Width) / 2
    img.Top = rngT.Top + (rngT.Height - img.Height) / 2
    
End Sub

Sub Image_Save()
    
    Dim strSavePath     As String
    Dim img                     As Object
    
    Set img = ActiveSheet.Shapes(Range("C6").Value)
    strSavePath = ActiveWorkbook.Path & "\" & Range("C6").Value & ".png"
    
    img.CopyPicture appearance:=xlScreen, Format:=xlPicture
    
    With Sheet6.ChartObjects.Add(0, 0, img.Width, img.Height)
        With .Chart
                 .Paste
                 .Export strSavePath
                 .Parent.Delete
        End With
    End With
    
End Sub