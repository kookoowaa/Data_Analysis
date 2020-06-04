'For ~ Next
'숫자를 1씩 증가시키면서 반복
sub v_number()

    dim i as long
    
    for i = 1 to 9 '== for i in range(1,10)

        cells(i,1) = i

    Next

end sub

sub h_number()

    dim i as long
    
    for i = 1 to 9

        cells(1,i) = i

    Next

end sub

sub multiple()
    dim i as long
    dim ii as long

    for i =1 to 9
        for ii = 1 to 9

        cells (i,ii) = i*ii

        Next
    Next
end sub


'For each Next
'변수(리스트)를 순환하면서 하나씩 입력

sub shape_color()

    dim sh      as object
    dim lngC    as long

    for each sh in Worksheets("Sheet2").Shapes

        lngC = lngC + 1
        sh.Left = Range("B1").Left
        sh.Fill.ForeColor.SchemeColor = lngC

    Next

end sub

Sub shape_color_rev()

    Dim sh      As Object
    Dim lngC    As Long
    
    lngC = Worksheets("Sheet2").Shapes.Count

    For Each sh In Worksheets("Sheet2").Shapes
        
        sh.Left = Range("G1").Left - sh.Width
        sh.Fill.ForeColor.SchemeColor = lngC
        lngC = lngC - 1    

    Next
    
End Sub