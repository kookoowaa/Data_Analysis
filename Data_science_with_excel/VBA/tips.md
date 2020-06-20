- 직접실행 창에서 `?{오브젝트}`를 입력하면 오브젝트에 할당되어 있는 값을 확인 가능

- Cell에 접근하는 방식은 `Range("D2")` 혹은 `Cells(2,4)` 처럼 가능

- `With`를 사용하면, `With` 이하의 구문을 재사용 가능 (띄어쓰기로 구분된 아래의 코드는 동일 기능 수행):

  ```
  Range("F8").CurrentRegion.Interior.ColorIndex = 0
  Range("F8").CurrentRegion.Font.ColorIndex = 0
  
  With Range("F8").CurrentRegion
      .Interior.ColorIndex = 0
      .Font.ColorIndex = 0
  ```

- `Range({인덱스}).CurrentRegion`은 인덱스 셀을 포함하는 데이터 테이블을 선택

- `Range({인덱스}).Resize({행크기},{열크기})`은 인덱스 셀로부터 지정한 범위만큼 새롭게 범위를 지정

