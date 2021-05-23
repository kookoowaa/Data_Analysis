## Tables

- 시각화의 기본은 그래프이지만, 때로는 테이블로 구체적인 데이터를 보여주는 것이 더 효과적일 수도 있음

- Plotly는 동적 그래프 외에 테이블을 제공하기도 함

- 테이블은 크게 `header`와 `cells` 객체에 값을 넣는 방식으로 구현하게 됨

  ```python
  fig = go.Figure()
  
  fig.add_trace(
      go.Table(
          header=dict(values=[]),
          cells=dict(value = [[],[],[]])
      )
  )
  ```

- `header=dict(values=[])` 안에는 1차원 배열 값을 입력하면 순서대로 열 header 값을 반환하게 됨

- `cells=dict(value = [[],[],[]])`값을 입력함에 있어 주의가 요구되는데, plotly table의 `cells` 값은 열 순서대로 입력이 이루어지게 됨
  DataFrame의 경우 행 순서대로 반환하므로, transpose를 해주어야 원하는 대로 테이블을 구성할 수 있음

  ```python
  cells=dict(value = df.T)
  ```

  

