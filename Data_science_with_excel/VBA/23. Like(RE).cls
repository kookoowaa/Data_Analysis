' Regular expression과 Like 문을 활용한 유효성 검증

Sub Like_RE()

    Dim lngText         As Long
    Dim i               As Long
    Dim lngTemp         As Long
    Dim lngHan          As Long
    Dim lngEngL         As Long
    Dim lngEngS         As Long
    Dim lngNum          As Long
    Dim lngEtc          As Long
    
    Range("G9:L9").ClearContents
    lngText = Len(Range("E8"))
    Range("G9") = lngText
    
    For i = 1 To lngText
        'Mid() 함수는 텍스트를 입력 받아서 중간에 원하는 길이만큼 텍스트 값을 출력해주는 함수임
        'Mid(입력텍스트, i번째 시작위치, n개의 텍스트 길이)
        If Mid(Range("E8"), i, 1) Like "[ㄱ-힣]" Then
            lngHan = lngHan + 1
        ElseIf Mid(Range("E8"), i, 1) Like "[a-z]" Then
            lngEngL = lngEngL + 1
        ElseIf Mid(Range("E8"), i, 1) Like "[A-Z]" Then
            lngEngS = lngEngS + 1
        ElseIf Mid(Range("E8"), i, 1) Like "[0-9]" Then
            lngNum = lngNum + 1
        Else
            lngEtc = lngEtc + 1
        End If
    Next i
    
    Range("H9") = lngHan
    Range("I9") = lngEngL
    Range("J9") = lngEngS
    Range("K9") = lngNum
    Range("L9") = lngEtc
    
End Sub