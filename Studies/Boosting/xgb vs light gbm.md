# LightGBM & XGBoost

> - LightGBM은 XGBoost에 비해 일반적으로 성능이(정확도가) 다소 떨어진다는 단점을 갖고 있지만, 반대로 메모리 사용량 및 대용량 학습속도 측면에서 강점을 갖고 있음
> - 

## 1. 구조적 차이

- XGBoost가 pre-sorted와 histogram 기반의 알고리즘을 사용하는데 반해 LightGBM은 GOSS<sup>Gradient-based One-Side Sampling</sup>을 통해 최적의 분류 기준을 찾아감

- XGBoost는 모든 데이터 포인트를 split 하는데 활용 (discrete bins에)하지만, LightGBM의 GOSS는 기울기에 따라 downsapling 하여 학습에 활용

- 잠시 GOSS에 대해 추가 설명 하자면;

  > - 기울기가 작을수록 학습이 잘 되고 있음을 반증하고 있다고 가정
  > - 기울기가 큰 그룹에 포커스를 맞추어 학습을 진행
  > - 결과적으로 GOSS는 기울기가 큰 그룹에 집중하고 기울기가 작은 그룹은 랜덤 샘플링해가면서 학습을 진행

## 2. Light GBM의 parameters

> - `num_leaves`: 가지 갯수
> - `min_child_samples`: 가지 별로 최소 한의 샘플 데이터 갯수 (클수록 overfitting 방지)
> - `max_depth`: 트리의 크기

### 불균형 데이터 튜닝

한쪽에(positive class) `weight`을 주어서 불균형을 맞추는 방식을 채용

> - `scale_pos_weight`: negative/positive 샘플 갯수에 따라 가변

### 오버피팅 방지

> - `max_bin`: 
> - `min_child_weight`: 
> - `bagging_fraction` and `bagging_freq`: 
> - `feature_fraction`: 
> - `lambda_l1` and `lambda_l2`: 

### 정확도 향상

> - `max_bin`: 
> - `learning_rate`: 
> - `num_leaves`: 

## 3. XGBoost의 parameters

> - c

### sub1



ref. https://towardsdatascience.com/lightgbm-vs-xgboost-which-algorithm-win-the-race-1ff7dd4917d

