## ADODB <sup>Active X Data Objects Database</sup>

> - ADO는 데이터 원본에 접근하기 위해 MS에서 표준으로 제작한 컴포넌트 오브젝트 모델 객체들의 모임을 의미 (or API)
> - 프로그래밍 언어와 DB 사이의 계층을 제공함으로써, 데이터에 접근하는 프로그램을  짤 수 있게 도움

## 종류

- ADO는 몇가지 객체로 이루어져 있으며, 가장 주요하게 사용되는 객체는 다음 3가지라고 볼 수 있음

  > 1. 연결 객체 (Connection Object)는 특정 DBMS에 대한 연결을 설정함
  > 2. 레코드셋 객체 (Recordset Object)는 요청에 대한 결과 데이터가 담겨 있음
  > 3. 명령 객체 (Command Object)는 SQL 명령어를 대표함

## 기본 사용법

- 위의 대표 객체를 사용해서 DB에 접근하고 이용하려면 다음 프로시져를 따름

  > 1. 연결객체와 레코드셋 객체를 생성
  > 2. `Open` 함수로 연결을 열고 SQL 명령을 전달하여 레코드셋을 갱신
  > 3. 갱신된 레코드셋에서 검색 및 처리작업 수행
  > 4. 레코드 셋을 닫음
  > 5. 연결을 닫음

https://ko.wikipedia.org/wiki/%EC%95%A1%ED%8B%B0%EB%B8%8C%EC%97%91%EC%8A%A4_%EB%8D%B0%EC%9D%B4%ED%84%B0_%EC%98%A4%EB%B8%8C%EC%A0%9D%ED%8A%B8 