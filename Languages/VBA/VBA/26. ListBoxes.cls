' UserForm에서 ListBox에서 ListBox로 값복사도 가능



' VBA의 Format() 함수는 Format({값}, {포맷})으로 포맷 지정한 후 값을 넣을 수 있음


Private Sub CommandButton1_Click()

    Dim lngindex        As Long
    ' Userform의 객체는 각각 Control object로 Dim 가능
    Dim LB_1            As Control
    Dim LB_2            As Control
    Dim lngTemp         As Long
    
    Set LB_1 = Me.ListBox1
    Set LB_2 = Me.ListBox2
    lngindex = LB_1.ListIndex
    
    If lngindex = -1 Then Exit Sub
    
    With LB_2
        lngTemp = ListBox2.ListCount
        .AddItem ListBox1.List(0, 0) '(0,0) 보다는 하나의 행렬을 추가한다는 개념으로 지정

        .List(lngTemp, 0) = Format(LB_1.List(lngindex, 0), "yyyy-mm-dd")
        .List(lngTemp, 1) = LB_1.List(lngindex, 1)
        .List(lngTemp, 2) = LB_1.List(lngindex, 2)
        .List(lngTemp, 3) = LB_1.List(lngindex, 3)
        .List(lngTemp, 4) = Format(LB_1.List(lngindex, 4), "#,##0")
    End With
    
End Sub