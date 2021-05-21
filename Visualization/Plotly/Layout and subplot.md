# Subplots with api

- 한 화면에 여러개의 시각화 객체를 포함하고 싶다면 `plotly.subplot.make_subplots()`를 사용하면 됨

  ```python
  from plotly.subplot import make_subplots
  import plotly.graph_objects as go
  
  fig = make_subplots(rows=3, cols=3)
  
  fig.add_trace(
      go.Scatter(x=[...], y=[...]),
      row=1, col=1
  )
  
  fig.add_trace(
      go.Scatter(x=[...], y=[...]),
      row=2, col=1
  )
  ```

- 다만 subplot을 사용하게 되면 하나의 figure 한에 여러개의 객체가 포함되게 되어 상대적으로 시각화 정보가 작게 제공되게 됨

# Subplots in html

- 만약 html로 시각화를 배포하게 된다면, 3개의 독립적인 객체를 순서대로 추가하는 게 나을 수도 있음

- plotly의 api를 활용한다면 `fig.write_html()`을 사용하는 것이 일반적이지만, 이럴 경우 하나의 html에 하나의 객체만 포함하게 됨

- html에 여러개의 객체를 담아 리포트를 만든다면 `fig.to_html()`을 활용하여 html 파일을 직접 작성하는 방식이 효과적일 수 있음:

  ```python
  with open('p_graph.html', 'a') as f:
      f.write(fig1.to_html(full_html=False, include_plotlyjs='cdn'))
      f.write(fig2.to_html(full_html=False, include_plotlyjs='cdn'))
      f.write(fig3.to_html(full_html=False, include_plotlyjs='cdn'))
  ```

- `fig.to_html()`은 객체의 html을 반환하며, `full_html=False`를 설정하면 `<div></div>` 안의 내용만 전달하게 됨



