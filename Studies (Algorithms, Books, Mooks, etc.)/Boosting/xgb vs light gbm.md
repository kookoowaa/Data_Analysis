# LightGBM & XGBoost

> - LightGBM은 XGBoost에 비해 일반적으로 성능이(정확도가) 다소 떨어진다는 단점을 갖고 있지만, 반대로 메모리 사용량 및 대용량 학습속도 측면에서 강점을 갖고 있음
> - 

## 1. 구조적 차이

- XGBoost가 pre-sorted와 histogram 기반의 알고리즘을 사용하는데 반해 LightGBM은 One-side sampling을 통해 최적의 분류 기준을 찾아감
- XGBoost는 모든 데이터 포인트를 split 하는데 활용 (discrete bins에)하지만, LightGBM은 기울기에 따라 downsapling 하여 학습에 활용

ref. https://towardsdatascience.com/lightgbm-vs-xgboost-which-algorithm-win-the-race-1ff7dd4917d

