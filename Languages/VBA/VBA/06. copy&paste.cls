Sub CopyAll()
    
    'Copy All
    
    Range("O6").CurrentRegion.Clear
    Range("F6").CurrentRegion.Copy
    Range("O6").PasteSpecial
    
    'Unselect copied cell
    Application.CutCopyMode = False

End Sub


Sub CopyVals()
    
    'Copy Values only
    
    Range("O6").CurrentRegion.Clear
    Range("F6").CurrentRegion.Copy
    Range("O6").PasteSpecial xlPasteValues
    
    'Unselect copied cell
    Application.CutCopyMode = False

End Sub

Sub CopyFormula()

    'Copy Formula

    Dim LngR1 As Integer
    Dim LngR2 As Integer
    
    LngR1 = Range("F1").End(xlDown).Row + 1
    LngR2 = Range("F1").End(xlDown).End(xlDown).Row
    
    Range("K3:L3").Copy
    Range("K" & LngR1 & ":K" & LngR2).PasteSpecial xlPasteFormulas
    
    'Unselect copied cell
    Application.CutCopyMode = False

End Sub

Sub CopyFormat()
    Dim LngR1 As Integer
    Dim LngR2 As Integer
    
    LngR1 = Range("F1").End(xlDown).Row + 1
    LngR2 = Range("F1").End(xlDown).End(xlDown).Row
    
    'Copy Format
    
    Range("F3:L3").Copy
    Range("F" & LngR1 & ":L" & LngR2).PasteSpecial xlPasteFormats
    
    'Unselect copied cell
    Application.CutCopyMode = False

End Sub
