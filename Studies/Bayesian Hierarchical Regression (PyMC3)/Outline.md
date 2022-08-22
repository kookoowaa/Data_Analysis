# 파이썬을 활용한 베이지안 계층적 분석


- 참조1. https://mons1220.tistory.com/214
```python
import matplotlib.pyplot as plt  
import numpy as np  
  
  
""" 데이터 사이즈 """  
g_n = 20        # 그룹 개수  
g_size = 30     # 한 그룹에 속한 데이터 개수  
  
""" 파라미터 """  
mu_1 = 2  
sigma_1 = 1  
theta1_g = mu_1 + np.random.normal(loc=0, scale=sigma_1, size=g_n)  
mu_2 = 5  
sigma_2 = 2  
theta2_g = mu_2 + np.random.normal(loc=0, scale=sigma_2, size=g_n)  
sigma = 0.5  
  
""" 데이터 생성 """  
for i in range(g_n):  
    x_g = np.linspace(start=0, stop=10, num=g_size)  
    y_g = theta1_g[i] * x_g\  
          + theta2_g[i]\  
          + np.random.normal(loc=0, scale=sigma, size=g_size)  
    g_idx = np.array([i] * g_size)  
    if i == 0:  
        x = x_g.copy()  
        y = y_g.copy()  
        g = g_idx.copy()  
    else:  
        x = np.append(x, x_g)  
        y = np.append(y, y_g)  
        g = np.append(g, g_idx)  
  
""" 플롯 """  
fig = plt.figure()  
plt.scatter(x, y, c=g, cmap='jet')  
plt.xlabel('x')  
plt.ylabel('x')  
plt.show()
```

```python
""" Pooled 회귀모델 """

import pymc3 as pm  
import arviz as az  
  
  
""" model 생성 """  
with pm.Model() as pooled:  
  
    # Prior probability (proposal distribution)  
    a = pm.Normal('theta1', mu=0, sd=10)  
    b = pm.Normal('theta2', mu=0, sd=10)  
    eps = pm.HalfCauchy('sigma', 1)  
  
    # Model  
    y_est = a * x + b  
  
    # Likelihood distribution  
    likelihood = pm.Normal('y', mu=y_est, sd=eps, observed=y)  
  
""" MCMC 샘플링 """  
with pooled:  
    pooled_trace = pm.sample(3000, progressbar=True, chains=2, cores=1)  
  
""" 사후분포 plot """
pm.traceplot(pooled_trace)
```

```python
""" UnPooled 회귀모델
differnt Theta per group 
"""

""" model 생성 """  
with pm.Model() as unpooled:  
  
    # Prior probability (proposal distribution)  
    a = pm.Normal('theta1_g', mu=0, sd=100, shape=g_n)  
    b = pm.Normal('theta2_g', mu=0, sd=100, shape=g_n)  
    eps = pm.HalfCauchy('eps', 5)  
  
    # Model  
    y_est = a[g] * x + b[g]  
  
    # Likelihood distribution  
    likelihood = pm.Normal('y', mu=y_est, sd=eps, observed=y)  
  
""" MCMC 샘플링 """  
with unpooled:  
    unpooled_trace = pm.sample(3000, progressbar=True, chains=2, cores=1)  
  
""" 사후분포 plot """  
pm.traceplot(unpooled_trace)

```