'원본범위, 조건범위, 결과범위 세가지 range를 활용


Sub Filter_Test01()

    Dim lngE            As Long
    Dim rngD            As Range
    Dim rngC            As Range
    Dim rngP            As Range
    
    lngE = Range("F10000").End(xlUp).Row
    Set rngD = Range("F6:L" & lngE)
    Set rngC = Range("O2:O3")
    Set rngP = Range("O6:U6")
    
    rngP.CurrentRegion.Offset(1, 0).Clear
    rngD.AdvancedFilter xlFilterCopy, CriteriaRange:=rngC, _
                                            CopyToRange:=rngP, Unique:=True
    'xlFilterInPlace는 필터하여 현재 범위에 덮어쓰기를 적용
    
End Sub


Sub AND_filter()

    Dim lngE            As Long
    Dim rngD            As Range
    Dim rngC            As Range
    Dim rngP            As Range
    
    lngE = Range("F10000").End(xlUp).Row
    Set rngD = Range("F6:L" & lngE)
    Set rngC = Range("O2:p3")
    'And조건의 경우 조건들을 하나의 행에 모두 기입
    Set rngP = Range("O6:Q6")
    '결과범위 수정
    
    rngP.CurrentRegion.Offset(1, 0).Clear
    rngD.AdvancedFilter xlFilterCopy, CriteriaRange:=rngC, _
                                            CopyToRange:=rngP, Unique:=True
    '결과범위에 해당하는 column 값만 가져와서 적용
    
End Sub

Sub OR_filter()

    Dim lngE            As Long
    Dim rngD            As Range
    Dim rngC            As Range
    Dim rngP            As Range
    
    lngE = Range("F10000").End(xlUp).Row
    Set rngD = Range("F6:L" & lngE)
    Set rngC = Range("O2:p4")
    'OR 조건은 행을 추가하여 조건을 기입
    Set rngP = Range("O6:Q6")
    
    
    rngP.CurrentRegion.Offset(1, 0).Clear
    rngD.AdvancedFilter xlFilterCopy, CriteriaRange:=rngC, _
                                            CopyToRange:=rngP, Unique:=True

End Sub

Sub Sample_outcome()

    Dim lngE            As Long
    Dim rngD            As Range
    Dim rngC            As Range
    Dim rngP            As Range
    
    '이상/이하의 조건 값은 엑셀 if function으로 자동 적용
    lngE = Worksheets("원본데이터(과제물)").Range("F10000").End(xlUp).Row
    Set rngD = Worksheets("원본데이터(과제물)").Range("F6:L" & lngE)
    Set rngC = Worksheets("원본데이터(과제물)").Range("O3:p4")

    Set rngP = Range("h8:k8")
    
    rngP.CurrentRegion.Offset(1, 0).Clear
    rngD.AdvancedFilter xlFilterCopy, CriteriaRange:=rngC, _
                                            CopyToRange:=rngP, Unique:=True

    
End Sub