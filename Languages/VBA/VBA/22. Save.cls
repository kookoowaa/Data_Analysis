' Excel 파일을 PDF로 저장해주는 프로시져

Sub PDF_Save()
    
    Dim strSave As String
    
    strSave = "D:\Git\Data_Analysis\Data_science_with_excel\VBA\Outcome_" & Format(Date, "YYMMDD") & ".pdf"
    
    Sheet1.ExportAsFixedFormat _
        Type:=xlTypePDF, _
        Filename:=strSave, _
        Quality:=xlQualityStandard, _
        IncludeDocProperties:=True, _
        IgnorePrintAreas:=False, _
        From:=1, To:=1, _
        OpenAfterPublish:=True
        '인쇄 범위만 출력할 경우 IgnorePrintAreas를 True 값으로, 아닐경우 False로 지정
        
    Sheet1.DisplayPageBreaks = False '페이지 구분선 표시를 삭제
        
        
End Sub