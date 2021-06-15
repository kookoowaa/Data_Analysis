> - undersampling의 경우 모델을 빌딩하는데 유리하지만 성능이 떨어지는 편이며, oversampling은 overfitting의 위험이 있긴 하지만 더 적합하다고 알려져 있음
> - 우선 모델(분류)에 대한 고민을 선행해 볼 것
>   tree 기반 모델은 imbalanced dataset에 좋은 성능을 내는 것으로 알려져 있음
> -  **SMOTE(Synthetic Minority Over-sampling Technique)** 기법을 활용해서 부족한 클래스의 모조 샘플을 만들어내는 방식이 가장 인기있는 오버샘플링 기법
> - 오버샘플링은 training set에 국한시키고, test/validation set은 원본 데이터를 사용
> - 결과적으로 딥러닝을 활용한 분석이란 우리가 모르는 모집단을 추정해 나아가는 과정인 만큼, 샘플링을 통해 여러 차례 시뮬레이션 돌리더라도 모집단으로 추정되는 test_set에 좋은 성능을 나타내는 모델을 채택하는 것이 합리적

SMOTE

![](https://miro.medium.com/max/2760/0*DfTZFQO5nhdiYmiY.png)



SMOTE(synthetic minority oversampling technique)

데이터의 개수가 적은 클래스의 표본을 가져온 뒤 임의의 값을 추가하여 새로운 샘플을 만들어 데이터에 추가하는 오버샘플링 방식

 lightgbm 같은 경우는 “**scale_pos_weight**”과 “**is_unbalance**”의 파라미터 튜닝을 통해 어느 정도 성능을 높일 수 있으나 해당 데이터 셋으로 테스트 해본 결과 **SMOTE**를 통해 오버 샘플링한 모델의 성능이 가장 좋은 것을 확인할 수 있었다.

https://john-analyst.medium.com/smote%EB%A1%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B6%88%EA%B7%A0%ED%98%95-%ED%95%B4%EA%B2%B0%ED%95%98%EA%B8%B0-5ab674ef0b32
