# Tensorflow input 데이터



```python
def my_input_fn(features, targets, batch_size=1, shuffle=True, num_epochs=None):
    """Trains a linear regression model of one feature.
  
    Args:
      features: pandas DataFrame of features
      targets: pandas DataFrame of targets
      batch_size: Size of batches to be passed to the model
      shuffle: True or False. Whether to shuffle the data.
      num_epochs: Number of epochs for which data should be repeated. None = repeat indefinitely
    Returns:
      Tuple of (features, labels) for next data batch
    """
  
    # Convert pandas data into a dict of np arrays.
    features = {key:np.array(value) for key,value in dict(features).items()}                                           
 
    # Construct a dataset, and configure batching/repeating.
    ds = Dataset.from_tensor_slices((features,targets)) # warning: 2GB limit
    ds = ds.batch(batch_size).repeat(num_epochs)
    
    # Shuffle the data, if specified.
    if shuffle:
      ds = ds.shuffle(buffer_size=10000)
    
    # Return the next batch of data.
    features, labels = ds.make_one_shot_iterator().get_next()
    return features, labels
```

- tensorflow 모델의 `input_fn`으로 위의 사용자 함수 사용
- 위의 `my_input_fn`의 기능은 다음과 같음:

> 1. pandas 데이터프레임을 numpy 배열의 dict로 변환
> 2. dict로부터 데이터 세트 객체를 생성
> 3. `batch_size`와 `num_epochs`으로 데이터 세트 객체 반복 수준을 설정

- 결국 tensorflow 모델을 어떤 데이터로 어떻게 학습할 것인지를 `my_input_fn`의 파라미터로 결정

- `my_input_fn`의 결과 값은:

  > `feature`와 (`{'column명': <tf.Tensor 'IteratorGetNext_3:0' shape=(?,) dtype=float64>}`),
  >
  > `label`을 (`<tf.Tensor 'IteratorGetNext_3:1' shape=(?,) dtype=float64>`) 반환

- `my_input_fn`을 활용한 tensorflow 선형 회귀의 예제를 보면 아래와 같음:

  ```python
  _ = linear_regressor.train(
      input_fn = lambda:my_input_fn(my_feature, targets),
      steps=100
  )
  ```