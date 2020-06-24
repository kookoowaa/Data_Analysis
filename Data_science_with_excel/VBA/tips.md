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

- `For ~ Next`는 사실 `For ~ Next Step 1`와 같이 다시 적을 수 있으며 여기서 `Step {n}`으로 이동 크기를 지정할 수 있음 (음수 가능)

- Row를 선택하는 방법은 `Rows({n})` 혹은 `Cells({n}, {n 또는 알파벳}).EntireRow`로 선택 가능

- `if`문 사용 시 `AND` 조건은 중첩문으로 또는 `If {조건1} and {조건2} Then`으로 사용 가능하며, `OR` 조건은 `If {조건1} Or {조건2} Then`으로 적용 가능

- VBA 코드 창에서 좌상단 드랍다운에서 `일반` 대신 `Workbook`을 선택하면 우측 드랍다운이 이벤트로 바뀌며, `Open`, `BeforeClose` 등 이벤트에 대한 trigger 함수를 적용할 수 있음