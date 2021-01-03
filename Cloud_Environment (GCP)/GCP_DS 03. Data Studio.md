# Data Studio

**Data Studio**는 구글에서 제공하는 BI툴로 Tableau나 Power BI와 유사한 프로그램임

여타 BI툴 대비 Data Studio가 가진 가장 큰 장점은 Google Cloud와의 연결 용이성이라고 볼 수 있음

당연히 BigQuery나 Cloud SQL과의 연결이 가능할 뿐 아니라, 파일을 업로드 하여 리포트를 만드는 것도 가능함

[Data Studio 가기](https://datastudio.google.com/u/0/navigation/reporting)



### 1. 데이터 연결하기

1.  **데이터에 연결**(Connect to data) 탭을 통해 여러 데이터 소스와 연결 가능
2. Google Connectors에는 각종 데이터 소스와 연결할 수 있도록 구글에서 제작한 connector가 존재

![bq_select.png](https://cdn.qwiklabs.com/39Vbx4yeiSCwKTWnt5qA2bG99Chp%2FWErqithsKc%2FFMA%3D)

3. 하단으로 이동하면 Partner Connector도 존재하며, 각종 3rd party에서 Data Studio와 연결을 지원하는 프로토콜도 존재함
4. Google Connector를 사용하면, 구글 측으로부터 권한 승인을 요청받으며, 승인 후 편하게 데이터와의 연결 기능을 제공

### 2. Feature 추가하기

1. 연결된 데이터 세트로부터 필요한 feature를 추출하는 방법 또한 GUI를 통해 손쉽게 해결 가능
2. 가장 우측 탭을 보면 데이터 세트의 feature들이 나열되어 있음을 확인할 수 있음
3. `ratio` feature를 예를 들면, 단순이 해당 feture를 우측으로부터 끌고와서 **Dimension** 탭에 추가할 수 있음
4. `ratio` 옆의 숫자 아이콘을 클릭하면 데이터 타입 또한 수정 가능

![add_ratio_edit.png](https://cdn.qwiklabs.com/zXu1x6M710mF6jfejnn2JRgapcP0Gk61hUx05Uk9bZ4%3D)

###  3. 데이터 테이블 만들기

1. Default로 제공되는 시각화 외에 메뉴에서 **Insert** > **Table**을 클릭해서 데이터 테이블도 만들수 있음
2. 이후로는 시각화 메뉴와 동일한 방법으로 feature를 추가 가능

![list1.png](https://cdn.qwiklabs.com/tCaE0P77TtbssYfg1FD9pY%2BmrKO5qrUKNFU3T9Flr2A%3D)

### 4. 필터 적용하기

1. In the reporting tools tray, click the Filter [ ![528063fec112f455.png](https://cdn.qwiklabs.com/jyGvhcxndKDFmO54IN8oiL2guwOS22CHDrnp%2FLDozxo%3D)] icon.
2. Above your data table, **click and drag** to create a filter.
3. In the data panel that opens, specify **name** as the Dimension and **total_ordered** as the Metric.
4. In the upper-right, select the **View** button to preview your report. You should be presented with the following:

![list2.png](https://cdn.qwiklabs.com/4BSOwFoYYhCYkdCfahKVAipsSvF4TvCy86lXNTCXvAs%3D)