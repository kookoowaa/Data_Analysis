' UserForm의 ListBox
' 특정 테이블 값을 보여주는 UserForm

' Table을 맵핑 하는 방법은 ListBox의 속성값 중 RowSource에 범위/이름을 입력
' 동적 범위로 ListBox를 구성하려면 Offset(), Counta() 함수로 이름을 정의한 후 적용
' 테이블 맵핑 후 ColumCount 속성을 변경하여 테이블을 보여줌 (default=1 하나의 열값만 반환)
' ColumnWidth는 하나의 열씩 세미콜론(;)으로 열 너비를 지정 가능
' 이외 아래와 같이 함수로 위와 동일한 기능을 구현할 수 있음

Private Sub UserForm_Initialize()

    Dim lngEndRow As Long
    Dim rngList As Range
    
    lngEndRow = Range("B10000").End(xlUp).Row
    Set rngList = Range("B5:F" & lngEndRow)
    
    Me.ListBox1.RowSource = rngList.Address
    Me.ListBox1.ColumnCount = 5
    
End Sub


''' 이하 과제

Private Sub UserForm_Initialize()
    
    Me.ListBox1.ColumnCount = 5
    Me.ListBox1.ColumnHeads = True
    Me.OptionButton1 = True
    ' OptionButton1을 default로 함
        
End Sub

Private Sub OptionButton1_Click()
    Me.ListBox1.RowSource = Range("January").Address
End Sub

Private Sub OptionButton2_Click()
    Me.ListBox1.RowSource = Range("February").Address
End Sub