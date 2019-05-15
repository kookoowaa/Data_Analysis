# BigQuery

### ERROR 1) `Invalid dataset ID "bigquery-public-data:samples". Dataset IDs must be alphanumeric (plus underscores and dashes) and must be at most 1024 characters long. Project name and dataset name must be separated by a dot.`

> - `SELECT mother_age, sum(weight_pounds) FROM [bigquery-public-data:samples.natality] GROUP BY mother_age order by mother_age` 쿼리문으로 데이터 추출 시도
>
> - 위의 쿼리문은 outdated 되었으며 2가지 문제가 발생
>
>   1. 테이블을 호출할 때 `[`나 `]` 대신 `(이스케이프) 사용
>   2. `natality`를 호출할 때, `bigquery-public-data:` 대신 `bigquery-public-data.`을 사용 (`:` 대신 `.` 사용)
>
> - 최종 수정된 쿼리문은 다음과 같음:
>
>   ```sql
>   SELECT 
>     mother_age, sum(weight_pounds) as total_weight
>   FROM
>     `bigquery-public-data.samples.natality`
>   GROUP BY
>     mother_age 
>   ORDER BY
>     mother_age
>   ```



