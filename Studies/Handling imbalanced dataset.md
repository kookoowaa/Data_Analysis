> - 우선 모델(분류)에 대한 고민을 선행해 볼 것
>   tree 기반 모델은 imbalanced dataset에 좋은 성능을 내는 것으로 알려져 있음
> - SMOTE 기법을 활용해서 오버 샘플링 하는 것이 가장 무난
> - 오버샘플링은 training set에 국한시키고, test/validation set은 원본 데이터를 사용
> - 결과적으로 우리가 모르는 모집단을 정확하게 반영하는 과정이다보니, 샘플링을 통해 모집단으로 추정되는 test set으로 시뮬레이션 돌리는 과정임



## Advantage and disadvantages of Under-sampling

### **Advantages**

- It can help improve run time and storage problems by reducing the number of training data samples when the training data set is huge.

### **Disadvantages**

- It can discard potentially useful information which could be important for building rule classifiers.
- The sample chosen by random under-sampling may be a biased sample. And it will not be an accurate representation of the population. Thereby, resulting in inaccurate results with the actual test data set.

## Advantages and Disadvantage of over-sampling

### **Advantages**

- Unlike under-sampling, this method leads to no information loss.
- Outperforms under sampling

### **Disadvantages**

- It increases the likelihood of overfitting since it replicates the minority class events.

https://www.analyticsvidhya.com/blog/2020/07/10-techniques-to-deal-with-class-imbalance-in-machine-learning/



### 4. 가짜 데이터 샘플을 만들자.

Over sampling의 기법은 가짜 데이터를 더 생성하는 것이니 위의 방법을 좀 더 발전시킨 전략이라고 보면 되겠다.

**Naive Bayes** 알고리즘을 사용할 경우에는 생성도 가능하니 이를 이용하거나, 가장 인기있는 방법인 **SMOTE(Synthetic Minority Over-sampling Technique)** 를 사용하는 것을 추천한다.

SMOTE는 부족한 클래스의 모조 샘플을 만들어내는 것이다. 이 알고리즘은 2개 이상의 비슷한 객체들을 선택하여 거리를 재고 사이사이 새로운 데이터를 생성해나간다.


### 5. 다른 Algorithms을 사용해보자.

언제나 그렇듯, 자신이 가장 좋아하는 알고리즘을 모든 문제에 사용하지 않는 것을 추천한다.

**의사 결정 나무(Decision Tree)** 는 비대칭 문제에서 성능이 좋은 경우가 많다.

C4.5, C5.0, CART and Random Forest 등 다양하게 사용해보는 것을 추천.

### 6. 모델에 제한을 준다.

**Penalized classification(패널티가 있는 분류)** 는 함수를 설정하여 부족한 클래스를 분류하는 것에 오류가 일어나게 만드는 것을 의미한다. 제한사항으로 설정한 함수(패널티 함수)는 부족한 클래스를 분류하는 것에 좀 더 집중을 할 수 있게 한다.

> penalized-SVM, penalized-LDA 등 penalized 된 버젼들이 존재한다.
> 그뿐만아니라, 패널라이즈드 모델들을 위해 Framework도 존재하는데, 예를들어 Weka의 [CostSensitiveClassifier](http://weka.sourceforge.net/doc.dev/weka/classifiers/meta/CostSensitiveClassifier.html#CostSensitiveClassifier--)가 있다.

패널티 매트릭스를 만드는 것은 매우 복잡하여, 특정 알고리즘을 써야 하거나 Re-샘플링이 불가능한 경우에 사용하는 것이 좋다.





SMOTE(synthetic minority oversampling technique)

데이터의 개수가 적은 클래스의 표본을 가져온 뒤 임의의 값을 추가하여 새로운 샘플을 만들어 데이터에 추가하는 오버샘플링 방식

 lightgbm 같은 경우는 “**scale_pos_weight**”과 “**is_unbalance**”의 파라미터 튜닝을 통해 어느 정도 성능을 높일 수 있으나 해당 데이터 셋으로 테스트 해본 결과 **SMOTE**를 통해 오버 샘플링한 모델의 성능이 가장 좋은 것을 확인할 수 있었다.

https://john-analyst.medium.com/smote%EB%A1%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B6%88%EA%B7%A0%ED%98%95-%ED%95%B4%EA%B2%B0%ED%95%98%EA%B8%B0-5ab674ef0b32

