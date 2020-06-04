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
    
    for i = 1 to 9 '== for i in range(1,10)

        cells(1,i) = i

    Next

end sub
'For each Next

