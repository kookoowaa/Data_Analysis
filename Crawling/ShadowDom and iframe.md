# Shadow DOM과 iframe

## 개요

- 웹페이지의 html 코드를 살펴보면, 종종 아래와 같이 shadow DOM객체나 iframe 객체가 있는 경우가 있음 

- 이런 경우 selenium에서 element를 찾기 어려울 수 있음 (i.e. `id="serchInput"`)
  
  ```html
  <settings-ui>
  
    #shadow-root
  
    <cr-toolbar>
  
      #shadow-root
  
      <cr-toolbar-search-field>
  
        #shadow-root
  
        <div id="searchInput">
  ```



### Shadow DOM

- 위의 사례와 같은 경우, html코드의 shadow DOM 상단 태그를 찾아 들어가야 함

- 객체를 찾아가는 함수는 다음과 같이 선언:
  
  ```python
  def expand_shadow_element(element):
       hadow_root = driver.execute_script('return arguments[0].shadowRoot', element)
       return shadow_root
  ```

- 위 함수를 활용해서 element(`searchInput`)를 찾아가는 방법은 다음과 같음:
  
  ```python
  root1 = driver.find_element_by_tag_name('settings-ui')
  shadow_root1 = expand_shadow_element(root1)
  
  root2 = shadow_root1.find_element_by_tag_name('cr-toolbar')
  shadow_root2 = expand_shadow_element(root2)
  
  root3 = shadow_root2.find_element_by_css_selector('cr-toolbar-search-field')
  shadow_root3 = expand_shadow_element(root3)
  
  inputArea = shadow_root3.find_element_by_css_selector("#searchInput")
  ```

- 이를 위해 상위 태그를 파악하는 것이 선행되어야 함



### iframe

- iframe의 경우 조금 더 간단하게 selenium의 API를 활용 가능

- `driver.switch_to.frame("{프레임 이름}")` 으로 프레임을 아예 바꾼 후 `find_element`를 사용하면 평소처럼 크롤링 진행 가능

- `driver.switch_to.default_content`으로 상위 프레임으로 전환 가능



출처

[[Selenium] shadow DOM 크롤링 하는법](https://zereight.tistory.com/649)
