Sub Main1()
    arrList = Array("cat", "dog", "dogfish", "mouse")

    Debug.Print "dog", inList("dog", arrList)   'True
    Debug.Print "horse", inList("horse", arrList) 'False
End Sub

Function inList(strIn As String, arrList As Variant) As Boolean
    inList = Not (IsError(Application.Match(strIn, arrList, 0)))
End Function






''''''''''''''
sub inListFilter()
    
    For Each outArray In Filter(Array("apple", "banana"), "apple", True, vbTextCompare)
        Debug.Print (outArray)
    Next outArray

    '>> "apple"
end sub