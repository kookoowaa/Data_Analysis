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

자세한 정보는 [링크](http://www.jair.org/papers/paper953.html)를 확인하자.

### 5. 다른 Algorithms을 사용해보자.

언제나 그렇듯, 자신이 가장 좋아하는 알고리즘을 모든 문제에 사용하지 않는 것을 추천한다.

**의사 결정 나무(Decision Tree)** 는 비대칭 문제에서 성능이 좋은 경우가 많다.

C4.5, C5.0, CART and Random Forest 등 다양하게 사용해보는 것을 추천.

### 6. 모델에 제한을 준다.

**Penalized classification(패널티가 있는 분류)** 는 함수를 설정하여 부족한 클래스를 분류하는 것에 오류가 일어나게 만드는 것을 의미한다. 제한사항으로 설정한 함수(패널티 함수)는 부족한 클래스를 분류하는 것에 좀 더 집중을 할 수 있게 한다.

> penalized-SVM, penalized-LDA 등 penalized 된 버젼들이 존재한다.
> 그뿐만아니라, 패널라이즈드 모델들을 위해 Framework도 존재하는데, 예를들어 Weka의 [CostSensitiveClassifier](http://weka.sourceforge.net/doc.dev/weka/classifiers/meta/CostSensitiveClassifier.html#CostSensitiveClassifier--)가 있다.

패널티 매트릭스를 만드는 것은 매우 복잡하여, 특정 알고리즘을 써야 하거나 Re-샘플링이 불가능한 경우에 사용하는 것이 좋다.

### https://databuzz-team.github.io/2018/10/21/Handle-Imbalanced-Data/



