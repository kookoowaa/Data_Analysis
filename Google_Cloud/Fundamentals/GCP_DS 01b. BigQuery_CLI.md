# BigQuery - CLI

**Command Line Interface**를 사용해서 BigQuery를 사용 하는 방법도 있으며, 아래 명령어들은 Cloud Shell을 통해서 사용

이때 사용하는 command는 `bq`를 사용

> ### CLI에서 BigQuery의 데이터세트, 데이터테이블  확인하기
>
> - 리눅스 명령어처럼 `ls`를 사용해서 보유한 데이터세트와 테이블을 확인할 수 있음
> - 데이터세트를 확인할 때에는 `bq ls`로 계정에 속한 데이터 세트들을 확인
> - 데이터테이블을 확인할 때에는 `bq la <데이터세트>`로 데이터세트에 속한 데이터테이블을 확인
> - 데이터테이블의 스키마를 확인할 때에는 `bq show <데이터세트>.<데이터테이블>`을 사용

> ### CLI에서 데이터테이블 생성(삭제)
>
> - 데이터세트를 만들거나 지울 때에도 리눅스 명령어를 사용 (`mk`, `rm`)
> - 데이터테이블은 생성용 데이터를 `load`하면서 생성할 수 있으며, 스키마도 이때 함께 입력
> - 명령어는 `bq load <데이터세트>.<데이터테이블> <DB용 데이터> <스키마>`와 같은 구조로 사용
>   `bq load babynames.names2010 yob2010.txt name:string,gender:string,count:integer`
> - 삭제 시에는 `bq rm`으로 데이터세트를 삭제 가능하며 이때 `-r` 플래그를 심으면 데이터세트 내 모든 테이블을 함께 삭제

> ### CLI에서 쿼리 날리기
>
> - `bq query "[SQL_STATEMENT]"`로 쉽게 쿼리 날리는 것이 가능
> - 이때 `FROM` 절에는 `<데이터세트>.<데이터테이블>`로 원하는 데이터테이블을 선택