# Topics to think about

## 1. BigQuery에서의 non-equi Join 사용
- BigQuery에는 2 종류의 query문이 존재: StandardSQL과 LegacySQL
- StandardSQL을 사용하는 추세이기는 하나 LegacySQL이 가지는 장점도 있음
- 특히 LegacySQL은 병렬 처리가 가능하여 대규모 연산에 강점이 있음
- 잠시 토픽이 벗어난 듯 하지만 non-equi Join을 사용하는 이유도 여기에 있음
- Equi Join 사용 시 모든 값들이 동일한지 아닌지 1:1 비교해야 하지만, Non-equi Join 사용 시 1:N으로 비교가 가능하여 연산 처리가 빨라짐
