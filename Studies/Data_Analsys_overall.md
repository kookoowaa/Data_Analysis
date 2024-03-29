# Topics to think about

## 1. Confidence Interval에 대한 정의

- 예를 들어 95% (또는 68%, 99%) 신뢰구간이 [1,10] 이라면, 모집단의 참값이 위 신뢰 구간에 포함 될 확률이 95%라고 해석 가능
- 현실적으로 참값(모수)를 확인하는 것은 불가능하기 때문에 구간 추정 아이디어가 나왔고, 반복 샘플링을 통해 구한 분포를 통해 특정 구간(신뢰구간<sup>Confidence Interval</sup>) 안에 모수가 포함될 확률(신뢰수준<sup>Confidence Level</sup>)로 모집단의 특성을 설명

## 2. Overfitting에 대응하는 법

- 가장 기본적인 방법은 훈련데이터를 더 많이 모으는 것으로, 데이터의 미묘한 패턴이나 극단값을 방지하는데 효과적
- 그 외에 정규화를 거쳐 적당한 복잡도를 갖는 모델을 자동으로 찾도록 하는 방법이 있음 (다차원의 함수를 2~3차 함수의 형태로)
- 마지막으로는 훈련 데이터 내에 아웃라이어를 사전에 제거하는 방법이 있음

## 3. Overfitting을 인지하는 법

- Overfitting을 판별하려면 학습된 모델과 실제 모델을 비교해야하는데, 결국 실제 모델이 어떠한 형태를 띄는지 알 수 없는 만큼 학습 모델이 얼마나 실제모델에 적합한지, 또는 학습모델에 과적합하는지는 알 수 없음
- 특히 training 결과가 지나치게 좋은 경우를 무조건적으로 overfitting이라고 할 수는 없음 (어쨌든 궁극적으로 추구하는 방향은 training이든 test든 에러를 낮추는 것)
- 직접적으로는 판단을 내리는 것이 사실상 불가능하지만, test set error와 trainnng set의 error 차이로 간접적으로 측정하는 것만 가능

## 4. xgBoosting 기법이란?

- 앙상블에 대해 먼저 이해할 필요가 있음
- 앙상블은 **동일한** 학습 알고리즘을 사용해서, weak learner를 결합해 strong learner를 만들어 내는 방법으로, **서로 다른** 학습알고리즘을 사용하는 유사한 개념으로는 Stacking이 있음
- 대표적인 앙상블 기법으로는 **Bagging**과 **Boosting**이 있음
- Bagging은 **Bootstrap Aggregating**을 의미하며 복원 랜덤 샘플링을 통해 표본집단으로 동일한 모델을 학습시키고, 예측변수들을 집계하여 모델을 생성 (대표적인 모델이 Random Forest)
- 그렇게 하는 이유는 샘플에서 나타난 결과를 일종의 *중간값*으로 맞추기 때문에 overfitting을 피할 수 있으며,  CART 모델의 단점인 discrete 한 boundary를 유연하게 가져갈 수 있음 (Categorical data는 투표로, Continuous data는 평균으로)

![](https://swalloow.github.io/assets/images/agg_result.png)

- **Boosting**은 일반 적인 모델을 만드는데 목적이 있는 bagging과는 다르게, 맞추기 어려운 문제를 맞추는 데 초점을 둠
- 예를 들어, 수학문제 9번이 어려워 반복적으로 틀리는 경우라면, **Boosting**은 9번 문제에 가중치를 부여, 9번 문제를 잘 맞춘 모델을 최종 모델로 선정함
- Boosting도 동일하게 복원 랜덤 샘플링을 하지만, 순차적으로 틀린 문제에 가중치를 부여해가며 학습이 진행되고, 학습이 끝나면 결과에 따라 가중치가 재분배되는 만큼 정확도가 높게 나타남

## 5. 통계적 가설 검정이란?

- 기존의 알려진 `H0`에 반하는 입증하고자 하는 가설 `h1`을  유의확률 `p-value`로  평가하여 새로운 가설의 채택여부 검증
- 여기서 유의확률 `p-value`는 `h1`을 채택했을 때의 오류 즉 `유의수준`이며 통상적으로 실혐 결과에서 유의확률 `p-value`이 5% 이하일 경우`h1` 채택
- 다만 현재 빅데이터 시대에서 문제는 샘플 수가 늘어나며 유의확률 `p-value` 5% 이하에 들어가는 검정통계량이 늘어남 (다 유의하다고 나옴)
- https://ssacstat.com/default/cs/cs_05.php?com_board_basic=read_form&com_board_idx=421&topmenu=5&left=5&com_board_search_code=&com_board_search_value1=&com_board_search_value2=&com_board_page=7
- https://nittaku.tistory.com/448

## 6. Classification에서 Logistic Regression(Sigmoid Function)을 쓰는 이유는?

- 예외적인 데이터세트(아웃라이어)가 있는 경우, 선형 회귀는 모델을 잘 표현하기 어렵고,  정상적인 데이터를 잘못 분류하게 될 가능성이 다분함 (threshold)
- 또한, classification에서 0-1 범위 밖을 넘어나는 가설을 얻기 위함이기도 함
- https://38402160.tistory.com/38?category=617404 참조

## 7. AB 테스트 후 결과 검증 방법

- AB 테스트는 주로 빈도주의 관점에서 유의성 검정을 따름

- 보통 실험 결과는 **"테스트 결과 A와 B가 별 차이가 없다"**는 귀무 가설<sup>H_0: Null Hypothesis</sup>을 기각할만한 차이가 **"테스트 결과 A와 B 간에 있는지"**  p-value를 통해 대립가설<sup>$H_1$: Alternative Hypothesis</sup>을 검정
  $$
  H_0: d = p_A - p_B = 0\\
  H_1: d>0
  $$

- 따라서 기준 분포 pdf는 $d=0$에 해당하는 확률 분포를 따르며, 앞의 확률분포에서 critical value(5%, 1%...)보다 작은 경우 의미있는 테스트였다고 인식할 수 있음

  ![](https://boxnwhis.kr/img/posts/2016-04-15-dont_be_overwhelmed_by_pvalue/null_hypothesis_case1.png)

- 반대로, p-value가 critical value 보다 큰 경우(아래) 두 종류의 접근이 가능

  ![](https://boxnwhis.kr/img/posts/2016-04-15-dont_be_overwhelmed_by_pvalue/null_hypothesis_case2.png)

- 하나는 대립가설을 포기하고 귀무가설을 따르는 것이고, 다른 하나는 실험 기간을 연장하여 샘플링 수를 늘려 통계적으로 유의미한 결과가 나오기를 기대하는 것

- 이론적으로는 검정력과 유의 수준 및 탐지하고자 원하는 효과 크기도 사전에 감안하여 실험 규모를 결정해야 하지만, 실제 실무에서 행하기는 쉽지 않음

- https://boxnwhis.kr/2016/04/15/dont_be_overwhelmed_by_pvalue.html

## 8. AB테스트에서의 p-value 계산

- 모집단의 표준편차를 아는 경우, t-검정을 통해 p-value 계산 가능: (모집단의 표준편차를 아는 경우 z-검정)

  
  $$
  t^* = \frac{\bar{x}-\mu}{s/\sqrt{n}} ~~~~~(df = n-1)
  $$

- 예를 들면 아래와 같은 경우가 있을 수 있음

  > - 귀무가설은 당도가 0이라고, 대립가설은 당도가 0 이상이라고 가설을 내리고 있음
  >
  > - 10개의 샘플로 테스트를 해 본 결과, 표본평균이 1.02, 표본표준편차가 1.196의 결과를 반환
  >
  > - 이때 t-검정 수행 시 2.7의 t값을 반환
  >   $$
  >   t = \frac{1.02-0}{1.196/\sqrt{10}} = 2.70
  >   $$
  >
  > - t값 2.70은 t-분포표의 자유도 9`(10-1)`에서  1%~2% 사이에 위치해 있음(p-value)
  >
  > - 따라서 5% 유의수준에서 귀무가설은 기각되며, 당도는 0 이상으로 이해할 수 있음

- p-value의 대안으로 빈도론적 관점에서 벗어나 베니지안 통계학을 활용하는 방법이 있음

- 베이지안 통계학은 prior 확률과 이에 대한 분포를 이용하여 각각 귀무가설 대립가설에 대한 사후 확률을 추정합니다. 그리고 이 중에서 높은 확률을 가지는 가설을 채택

- 기존의 유의검정은 귀무가설을 검증만 하지만, 베이지안 통계학은 귀무가설과 대립가설을 비교 및 검정한다는 차이가 존재하며, 따라서 직접적인 검증이 가능

- 베이지안 통계학은 귀무가설이라는 일종의 ‘허수아비 가설’을 검증함으로써 귀무가설을 입증하려는 방식과 와 크게 상반됨

- https://niceguy1575.tistory.com/50

## 9. 베이지안 기법으로 가설 검정

- 전통적으로 A/B 테스트를 통해 결과를 통계적으로 분석할 때, 빈도주의적 관점에서 p-value를 통해 검증

- 이 경우 샘플에 따라 결과가 달라지는 경우가 생겼으나, 빅데이터 시대의 출현으로 인해 장기적인 비율의 편차 감소와 더불어 효과적인 방법으로 대두

- 단, 여전히 무언가 체계적이지 못하다는 이유로 데이터 분석을 통계적으로 분석할 때 전통적인 빈도주의 확률에 의존하는 것은 지양

- 베이지안의 경우 A/B 테스트 결과 **가정한 가설이 옳을 확률을 수학적으로 계산**해서 가설의 채택여부를 판단

- 수학적으로 계산하는 방법은 **조건부 확률**을 활용함 
  $$
  P(H|D) = \frac{P(D|H)P(H)}{P(D)}=\frac{P(H\bigcap D)}{P(D)} \\
  where ~H = Hypythesis, D = Data
  $$

- 제일 왼쪽의 $P(H|D)$는 사후 확률을 의미 (주어진 데이터 상에서 가설이 참일 확률)

- $P(H)$는 사전확률로, $D$를 관측하기 전까지는 $H$가 참으로 그 확률을 의미

- $P(D|H)$는 가능도(Likelihood)로 $D$로 인한 $H$가 참일 확률을 의미 ($H\bigcap D$를 참조)

- 마지막으로 $P(D)$는 경계확률을 의미 (**추가 리서치 필요**)

- 참조: bayesian 활용 A/B 테스트 사례 https://blog.exploratory.io/an-introduction-to-bayesian-a-b-testing-in-exploratory-cb5a7ad80963

## 10. Market Baskey Analysis의 의미

- Market Basket Analysis는 비지도학습의 한 종류로, Y 값에 대한 label이 없는 상태에서 데이터 간의 상관성을 바탕으로 숨겨진 패턴을 찾는 분석기법임

- 이 때 유의미한, 또는 상관성이 높은 집합을 찾는 것이 목적

- 일일히 육안으로 보고 평가하기 힘들기 때문에 평가 척도를 가지고 필터링을 진행

- 통상적으로 평가 척도는 지지도(Support), 신뢰도(Confidence), 향상도(Lift)를 보며, 각 척도에 임계값을 주어 임계값 이상의 조합만 유의미하게 평가

- **Support**는 전체에서 테스트 집합을 포함하는 거래 비중을 의미하며, 빈도를 측정하는 개념으로 이해 가능
  $$
  P(A\cap B)
  $$
  
- **Confidence**는 A와 B 집합의 관계에서 A(B)가 구매된 거래 중  두 제품의 동시 구매 비중을 의미하며, 의존도가 얼마나 높은지 판단할 수 있음
  $$
  \frac{P(A\cap B)}{P(A)}
  $$

- **Lift**는 A의 Confidence와 B의 단독 구매 비중을 비교하여, 특정 조합이 단독 구매 시보다 얼마나 효율이 높은지를 측정 (1 이상일 때)

  
  $$
  \frac{\frac{P(A\cap B)}{P(A)}}{P(B)}
  $$
  
- 통상적으로 Confidenct와 Lift가 높은 조합 위주로 숨겨진 패턴을 찾지만, 비즈니스 컨텍스트에서 효율성 이상 중요한 것은 효과이므로, 실제 얼마나 수익에 기여할 수 있는지 추가적인 타당성을 따져 볼 필요는 있음

## 11. 선형 회귀분석에서 log변환을 하는 이유

- 아래와 같은 이유로 로그를 취하는 경우가 있음:

  > 1. 기하급수적 증가와 같은 제곱형식의 수식(그래프)에 로그를 씌어주면 직선 형태로 종속변수와 비교가 가능하며, 이같은 이유로 비선형 관계를 선형 관계로 대체 가능 (회귀 분석의 전제는 x와 y가 선형 관계)
  > 2. 위에 더하여 로그 변환 시 상대적으로 작은 값에 몰려있는 데이터의 모양이 퍼지면서 좌우 대칭 형태로 분포의 모향이 변형됨 (정규분포 전제)
  > 3. 한 단위 대신 비율로 관계를 설명하는 것이 더 유용할 경유 로그를 취하여 변수를 변환

- 참조: https://igija.tistory.com/172

- 참조: https://blog.naver.com/agneskorea/222484479555

## 12. 머신러닝에서 선형이란

- 흔히 선형 모델의 범주를 직선으로 표현 가능한 회귀 모델에 국한하여 이해하는 경우도 많지만, 엄밀히 이야기하자면 학습단계에서 가중치가 선형 결합에 있는 경우에 선형모델이라 부를 수 있음 $$y = F(w_1x_1 + w_2x_2 + b)$$
- Sidmoid함수나 다항함수의 경우도 선형모델로 식변형하여 학습 가능하고 선형 회귀모델로 표현이 가능:
  $$y = \beta_0x^\beta1$$은 $$log(y) = log(\beta_0x^\beta1)$$으로 표현가능하고, 다시 $$log(y) = log\beta_0 + \beta_1log(x)$$로 표현 가능
- 비선형 모델은 식변형으로 변수들을 선형 결합화 시킬수 없는 모델로 $$y = \frac{\beta_1x}{\beta_2 +x}$$와 같거나, 아예 판별식을 다르게 가져가는 경우에 해당함
- 참조: http://blog.naver.com/PostView.nhn?blogId=kh9342&logNo=221780884161

last updated: Feb. 18 2021
