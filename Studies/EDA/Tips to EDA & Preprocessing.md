# tips to EDA & Preprocessing



## Train/test split
```python
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)
```


## holiday library
```python
import holidays

bucket = holidays.KR()
df.apply(lambda x: 'holiday' if x.date in bucket else 0, axis=1)
```

