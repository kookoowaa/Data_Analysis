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

1. Click **Add** in the bottom right corner and then click **Add to Report**.
2. A preview of the available fields you can add to the report opens.
3. Under Available Fileds, click on **ratio**, and drag it into the Dimention section.
4. Click in the number icon to edit.

![add_ratio_edit.png](https://cdn.qwiklabs.com/zXu1x6M710mF6jfejnn2JRgapcP0Gk61hUx05Uk9bZ4%3D)

1. Scroll down to the Type area, and use the dropdown menu to select **Numeric** > **Percent**.

###  3. 데이터 테이블 만들기

1. From the menu bar, select **Insert** > **Table**. Click onto the report to drop your table. Feel free to adjust the size of this table and the width of the columns.
2. In the new Data and Style panel that opens, specify the following in the **Data** tab:

- If **productSKU** is not present in the **Dimension** section, click **productSKU** from the **Available Fields** section and drag it to the **Add dimension** field.
- In the **Metric** section, if present, remove **Record Count** as a Metric by clicking **x**.
- Add **stockLevel** to the Metric area.

![record_count.png](https://cdn.qwiklabs.com/izl%2BZH3GB9MjUBBt%2BwXdUqxqhTvipixZgyLcU%2B4OyVI%3D)

- Drag **ratio** to add it as a new Metric
- Drag **restockingLeadTime** to add it as a new Metric
- In the Sort filed, click on **Record Count** and choose **ratio** from the dropdown menu for the new Sort field.
- Specify **Descending**.

1. At the top of the panel, click the **Style** tab.
2. Under **Table Header**, check **Wrap Text**.
3. Manually adjust the widths of the table columns by hovering over the vertical border and click and dragging.
4. Confirm your report looks visually similar to the report below:

![list1.png](https://cdn.qwiklabs.com/tCaE0P77TtbssYfg1FD9pY%2BmrKO5qrUKNFU3T9Flr2A%3D)

### 4. 필터 적용하기

1. In the reporting tools tray, click the Filter [ ![528063fec112f455.png](https://cdn.qwiklabs.com/jyGvhcxndKDFmO54IN8oiL2guwOS22CHDrnp%2FLDozxo%3D)] icon.
2. Above your data table, **click and drag** to create a filter.
3. In the data panel that opens, specify **name** as the Dimension and **total_ordered** as the Metric.
4. In the upper-right, select the **View** button to preview your report. You should be presented with the following:

![list2.png](https://cdn.qwiklabs.com/4BSOwFoYYhCYkdCfahKVAipsSvF4TvCy86lXNTCXvAs%3D)