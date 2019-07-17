# Topics to think about

# 1. Confidence Interval에 대한 정의

- 예를 들어 95% (또는 68%, 99%) 신뢰구간이 [1,10] 이라면, 모집단의 참값이 위 신뢰 구간에 포함 될 확률이 95%라고 해석 가능
- 현실적으로 참값(모수)를 확인하는 것은 불가능하기 때문에 구간 추정 아이디어가 나왔고, 반복 샘플링을 통해 구한 분포를 통해 특정 구간(신뢰구간<sup>Confidence Interval</sup>) 안에 모수가 포함될 확률(신뢰수준<sup>Confidence Level</sup>)로 모집단의 특성을 설명

# 2. Overfitting에 대응하는 법

- 가장 기본적인 방법은 훈련데이터를 더 많이 모으는 것으로, 데이터의 미묘한 패턴이나 극단값을 방지하는데 효과적
- 그 외에 정규화를 거쳐 적당한 복잡도를 갖는 모델을 자동으로 찾도록 하는 방법이 있음 (다차원의 함수를 2~3차 함수의 형태로)
- 마지막으로는 훈련 데이터 내에 아웃라이어를 사전에 제거하는 방법이 있음

# 3. Overfitting을 인지하는 법

- Overfitting을 판별하려면 학습된 모델과 실제 모델을 비교해야하는데, 결국 실제 모델이 어떠한 형태를 띄는지 알 수 없는 만큼 학습 모델이 얼마나 실제모델에 적합한지, 또는 학습모델에 과적합하는지는 알 수 없음
- 특히 training 결과가 지나치게 좋은 경우를 무조건적으로 overfitting이라고 할 수는 없음 (어쨌든 궁극적으로 추구하는 방향은 training이든 test든 에러를 낮추는 것)
- 직접적으로는 판단을 내리는 것이 사실상 불가능하지만, test set error와 trainnng set의 error 차이로 간접적으로 측정하는 것만 가능

# 4. xgBoosting 기법이란?

- 앙상블에 대해 먼저 이해할 필요가 있음
- 앙상블은 **동일한** 학습 알고리즘을 사용해서, weak learner를 결합해 strong learner를 만들어 내는 방법으로, **서로 다른** 학습알고리즘을 사용하는 유사한 개념으로는 Stacking이 있음
- 대표적인 앙상블 기법으로는 **Bagging**과 **Boosting**이 있음
- Bagging은 **Bootstrap Aggregating**을 의미하며 복원 랜덤 샘플링을 통해 표본집단으로 동일한 모델을 학습시키고, 예측변수들을 집계하여 모델을 생성 (대표적인 모델이 Random Forest)
- 그렇게 하는 이유는 샘플에서 나타난 결과를 일종의 *중간값*으로 맞추기 때문에 overfitting을 피할 수 있으며,  CART 모델의 단점인 discrete 한 boundary를 유연하게 가져갈 수 있음 (Categorical data는 투표로, Continuous data는 평균으로)

![](https://swalloow.github.io/assets/images/agg_result.png)

- **Boosting**은 일반 적인 모델을 만드는데 목적이 있는 bagging과는 다르게, 맞추기 어려운 문제를 맞추는 데 초점을 둠
- 예를 들어, 수학문제 9번이 어려워 반복적으로 틀리는 경우라면, **Boosting**은 9번 문제에 가중치를 부여, 9번 문제를 잘 맞춘 모델을 최종 모델로 선정함
- Boosting도 동일하게 복원 랜덤 샘플링을 하지만, 순차적으로 틀린 문제에 가중치를 부여해가며 학습이 진행되고, 학습이 끝나면 결과에 따라 가중치가 재분배되는 만큼 정확도가 높게 나타남

# 5. 통계적 가설 검정이란?

- 기존의 알려진 `H0`에 반하는 입증하고자 하는 가설 `h1`을  유의확률 `p-value`로  평가하여 새로운 가설의 채택여부 검증
- 여기서 유의확률 `p-value`는 `h1`을 채택했을 때의 오류 즉 `유의수준`이며 통상적으로 실혐 결과에서 유의확률 `p-value`이 5% 이하일 경우`h1` 채택
- 다만 현재 빅데이터 시대에서 문제는 샘플 수가 늘어나며 유의확률 `p-value` 5% 이하에 들어가는 검정통계량이 늘어남 (다 유의하다고 나옴)
- https://ssacstat.com/default/cs/cs_05.php?com_board_basic=read_form&com_board_idx=421&topmenu=5&left=5&com_board_search_code=&com_board_search_value1=&com_board_search_value2=&com_board_page=7
- https://nittaku.tistory.com/448

# 6. Classification에서 Logistic Regression(Sigmoid Function)을 쓰는 이유는?

- 예외적인 데이터세트(아웃라이어)가 있는 경우, 선형 회귀는 모델을 잘 표현하기 어렵고,  정상적인 데이터를 잘못 분류하게 될 가능성이 다분함 (threshold)
- 또한, classification에서 0-1 범위 밖을 넘어나는 가설을 얻기 위함이기도 함
- https://38402160.tistory.com/38?category=617404 참조



