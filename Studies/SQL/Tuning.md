# SQL 튜닝

> 풀스캔 되지 않도록 구문을 튜닝해야 성능도 향상

## 1. Case.. When.. > Update.. Set..

- Update로 신규 열을 생성하는 것보다, Case문으로 가상의 열로 데이터 처리하는 것이 상대적으로 가벼움

## 2. 기본 키를 형변환 하는 함수는 사용을 자제

- Int 열에 `substring()` 같이 전체 데이터를 형변환 시키는 함수를 사용하게 되면, 데이터 전체를 풀스캔 하게 됨
- 이런 경우 `>`나 `Between.. and..` 같이 데이터를 range 단위로 처리하면 속도가 비약적으로 개선 됨


https://hahyuning.tistory.com/67
https://taewooblog.tistory.com/m/63
