## SQL 키워드: GROUP BY, COUNT, AS 및 ORDER BY

### GROUP BY

`GROUP BY` 키워드는 공통 기준(예: 열 값)을 공유하는 결과 집합 행을 집계하며 이러한 기준에 대해 찾은 모든 고유 항목을 반환합니다.

이 키워드는 테이블에 대한 카테고리 정보를 찾는 데 유용합니다. 이 키워드의 기능을 이해하려면 **새 쿼리 작성**을 클릭하고 다음 명령어를 복사하여 쿼리 편집기에 붙여넣습니다.

```
SELECT start_station_name FROM `bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name;
content_copy
```

**실행**을 클릭합니다.

비슷한 출력이 표시되어야 합니다(행 값이 다음과 일치하지 않을 수 있음).

![30b04fc6f21c544c.png](https://cdn.qwiklabs.com/WcheomnmNVxpZflsIhCmoSmxbakCLWCugBjaQ6ARrLI%3D)

`GROUP BY`가 없었으면 쿼리는 **24,369,201**개의 행 전체를 반환했을 것입니다. `GROUP BY`는 테이블에 있는 고유한(중복되지 않은) 열 값을 출력합니다. 오른쪽 하단에서 이를 직접 확인할 수 있습니다. **880**개의 행이 표시됩니다. 즉, 880개의 고유한 런던 자전거 공유 출발점이 있습니다.

### COUNT

`COUNT()` 함수는 동일한 기준(예: 열 값)을 공유하는 행 수를 반환합니다. 이 함수를 `GROUP BY`와 함께 사용할 경우 매우 유용할 수 있습니다.

앞의 쿼리에 `COUNT` 함수를 추가하여 각 출발점에서 출발한 라이딩 횟수를 계산합니다. **새 쿼리 작성**을 클릭하고 다음 명령어를 복사하여 쿼리 편집기에 붙여넣고 **쿼리 실행**을 클릭합니다.

```
SELECT start_station_name, COUNT(*) FROM `bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name;
content_copy
```

비슷한 출력이 표시되어야 합니다(행 값이 다음과 일치하지 않을 수 있음).

![b62aaf26b7a35e35.png](https://cdn.qwiklabs.com/rvBPMCHcoM0etV%2BNXOvBwHnfh6LWgAAzBI5o0%2FKM97Y%3D)

이를 통해 각 출발점에서 출발한 자전거 공유 라이딩 수를 알 수 있습니다.

### AS

SQL에는 테이블 또는 열의 *별칭*을 작성하는 `AS` 키워드도 있습니다. 별칭은 `AS`의 지정 대상에 관계없이 반환된 열이나 테이블에 지정된 새 이름입니다.

마지막으로 실행한 쿼리에 `AS` 키워드를 추가하여 실행해 보겠습니다. **새 쿼리 작성**을 클릭하고 다음 명령어를 복사하여 쿼리 편집기에 붙여넣습니다.

```
SELECT start_station_name, COUNT (*) AS num_starts from 'bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name;
content_copy
```

**실행**을 클릭합니다.

비슷한 출력이 표시되어야 합니다(행 값은 동일하지 않을 수 있음).

![a45a8b122dbfea2b.png](https://cdn.qwiklabs.com/tne5HErHLjL7JXpNCIHadDKX1n70jKGnDJcdgwKdHXM%3D)

이제 반환된 테이블의 `COUNT(*)` 열에 별칭 이름 `num_starts`가 설정된 것을 볼 수 있습니다. 이 키워드는 대용량의 데이터세트를 다루는 경우에 특히 유용합니다. 모호하게 지정한 테이블이나 열 이름을 잊어버리는 일이 생각보다 더 자주 발생합니다.

### ORDER BY

`ORDER BY` 키워드는 쿼리에서 반환된 데이터를 지정된 조건 또는 열 값을 기준으로 오름차순 또는 내림차순으로 정렬합니다. 이전 쿼리에 이 키워드를 추가하여 다음 작업을 수행해 보겠습니다.

- 각 출발 스테이션에서 출발한 자전거 공유 라이딩 수가 포함된 테이블 반환(출발 스테이션 알파벳순 정렬)
- 각 출발 스테이션에서 출발한 자전거 공유 라이딩 수가 포함된 테이블 반환(오름차순 정렬)
- 각 출발 스테이션에서 출발한 자전거 공유 라이딩 수가 포함된 테이블 반환(내림차순 정렬)

아래의 각 명령어는 별도의 쿼리입니다. 각 명령어에 대해 쿼리 편집기를 지우고 명령어를 복사하여 쿼리 편집기에 붙여넣은 다음 **실행**을 클릭합니다. 결과를 검사합니다.

```
SELECT start_station_name, COUNT(*) AS num FROM `bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name ORDER BY start_station_name;
content_copy
SELECT start_station_name, COUNT(*) AS num FROM `bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name ORDER BY num;
content_copy
SELECT start_station_name, COUNT(*) AS num FROM `bigquery-public-data.london_bicycles.cycle_hire` GROUP BY start_station_name ORDER BY num DESC;
content_copy
```

마지막 쿼리는 다음을 반환해야 합니다.

![368742bde0aa54d6.png](https://cdn.qwiklabs.com/L3uDkzg%2B3uiiBgBwaGSnhVmqVpXP9waOgMIg9zLDG2c%3D)

여기서 'Belgrove Street, King 's Cross'에서 출발한 수가 가장 많음을 알 수 있습니다. 그러나 전체 건수와 비교했을 때(234,458/24,369,201) 이 스테이션에서 출발하는 라이딩 수가 1% 미만임을 알 수 있습니다.





___

# Cloud SQL에서 테이블 만들기 (console)

Cloud Shell에서 다음 명령어를 실행하여 SQL 인스턴스에 연결하고 인스턴스에 다른 이름을 사용한 경우 `qwiklabs-demo`를 바꿉니다.

```
gcloud sql connect  qwiklabs-demo --user=root
content_copy
```

인스턴스에 연결하는 데 1분 정도 걸릴 수 있습니다.

메시지가 표시되면 인스턴스에 대해 설정한 루트 비밀번호를 입력합니다.

이제 다음과 같은 출력이 표시되어야 합니다.

```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 494
Server version: 5.7.14-google-log (Google)

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MySQL [(none)]>
content_copy
```

Cloud SQL 인스턴스는 미리 구성된 데이터베이스와 함께 제공되지만 런던 자전거 공유 데이터를 저장할 데이터베이스를 직접 만들겠습니다.

MySQL 서버 프롬프트에서 다음 명령어를 실행하여 `bike`라는 데이터베이스를 만듭니다.

```
CREATE DATABASE bike;
content_copy
```

다음과 같은 출력이 표시됩니다.

```
Query OK, 1 row affected (0.05 sec)

MySQL [(none)]>
content_copy
```

### 완료된 작업 테스트

**내 진행 상황 확인하기**를 클릭하여 진행 상황을 확인하고 수행한 작업을 확인합니다. Cloud SQL 인스턴스에 데이터베이스가 만들어지면 평가 점수가 표시됩니다.

데이터베이스를 만듭니다.

내 진행 상황 확인하기



다음 명령어를 실행하여 bike 데이터베이스 내부에 테이블을 만듭니다.

```
USE bike;
CREATE TABLE london1 (start_station_name VARCHAR(255), num INT);
content_copy
```

이 구문은 `CREATE` 키워드를 사용하지만 이번에는 `TABLE` 절을 사용하여 데이터베이스 대신 테이블을 빌드하도록 지정합니다. `USE` 키워드는 연결할 데이터베이스를 지정합니다. 이제 'start_station_name'과 'num'의 두 열을 포함하는 'london1'이라는 테이블이 만들어졌습니다. `VARCHAR(255)`는 255자까지 저장할 수 있는 가변 길이 문자열 열을 지정하며 `INT`는 정수 유형의 열입니다.

다음 명령어를 실행하여 "london2"라는 다른 테이블을 만듭니다.

```
USE bike;
CREATE TABLE london2 (end_station_name VARCHAR(255), num INT);
content_copy
```

이제 빈 테이블이 만들어졌는지 확인합니다. MySQL 서버 프롬프트에서 다음 명령어를 실행합니다.

```
SELECT * FROM london1;
SELECT * FROM london2;
content_copy
```

두 명령어 모두에 대해 다음과 같은 출력이 표시되어야 합니다.

```
Empty set (0.04 sec)
content_copy
```

아직 데이터를 로드하지 않았기 때문에 "empty set"라고 표시됩니다.



