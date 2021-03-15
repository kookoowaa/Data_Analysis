Sub Test01()

    Dim i       As Long
    
    Range("F8").CurrentRegion.Interior.ColorIndex = 0
    Range("F8").CurrentRegion.Font.ColorIndex = 0

    'Same as above
    'With Range("F8").CurrentRegion
    '    .Interior.ColorIndex = 0
    '    .Font.ColorIndex = 0
    


    for i = 9 to Range("B2")

        if range("G"&i) = range("B3") and _
            range("H"&i) <= Range("B4") then

            range("B5").Copy
            Range("F"&i ).Resize(1, 3).PasteSpecial xlformats
        end if

    Next i

End Sub
