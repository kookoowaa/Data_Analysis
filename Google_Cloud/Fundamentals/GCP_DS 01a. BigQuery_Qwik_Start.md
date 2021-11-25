# BigQuery

> ### BigQuery에서 테이블을 호출하는 방법
>
> - BigQuery에서의 테이블은 `<데이터세트>.<테이블명>`으로 호출 가능 (where절)
>
> - 아래의 경우라면 `from babynames.names_2014`와 같이 호출 가능
>
>   ![](BQ_table.png)

> ### BigQuery에서 테이블을 생성하는 방법 (외부데이터, Google Storage 사용 시)
>
> - 기본적으로 데이터세트가 있음을 가정
> - Google Storage의 주소는 gs://<버켓 명>을 기본으로 함
> - Cloud shell 환경은 기본적으로 `$HOME`에 5GB의 영구 디스크를 제공
> - 따라서 shell 환경에 테이블이 있다면, `gsutil cp <원본 위치> gs://<버켓 명>` 같은 커맨드도 활용 가능
> - 반복적인 작업이 필요한 경우가 아니라면, 그냥 Console에서 제공하는 GUI를 활용하는 것도 어렵지 않음
> - GUI를 사용할 경우 **BigQuery > 데이터세트 > 테이블 생성** 클릭으로 메뉴 진입 가능
> - 스키마의 경우 직접 설정할 수 있는데 `컬럼1:데이터타입, 컬럼2:데이터타입....` 방식으로 설정 가능
>   `name:string, gender:string, count:integer`