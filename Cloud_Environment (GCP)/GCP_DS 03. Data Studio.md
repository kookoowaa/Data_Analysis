# Data Studio

**Data Studio**는 구글에서 제공하는 BI툴로 Tableau나 Power BI와 유사한 프로그램임

여타 BI툴 대비 Data Studio가 가진 가장 큰 장점은 Google Cloud와의 연결 용이성이라고 볼 수 있음

당연히 BigQuery나 Cloud SQL과의 연결이 가능할 뿐 아니라, 파일을 업로드 하여 리포트를 만드는 것도 가능함



### 1. Data Studio 열기

### 2. 리포트 생성하기





## Launch Data Studio and create a blank report

1. Open [Google Data Studio](https://datastudio.google.com/) in a new browser tab or window.

The Data Studio home page opens. ![home.png](https://cdn.qwiklabs.com/qP82wdi92V6JjfaUZofROGFGzcywDAI4Qh%2FPspXDxnw%3D)

1. From the homepage, click the **Blank Report** template: ![3e9763840c2a2303.png](https://cdn.qwiklabs.com/BjnZeGoXvpFJl7NCov2M4%2FPWEIe33a87Lkn8ffjg85U%3D)
2. Click **GET STARTED** and click through the prompts.

- Check the checkbox to acknowledge you have read and agree to the Google Data Studio Additional Terms, then click **ACCEPT**.
- On the Sign up for emails to get the most out of Google Data Studio dialog, select "No" to all options, then click **DONE**.

1. Click the **Blank Report** template again.

A new, untitled report opens.

1. You'll be on the **Connect to data** tab.
2. In the Google Connectors section, select **BigQuery**.

![bq_select.png](https://cdn.qwiklabs.com/39Vbx4yeiSCwKTWnt5qA2bG99Chp%2FWErqithsKc%2FFMA%3D)

1. For Authorization, click **Authorize**. This allows Data Studio access to your Google Cloud project.
2. Define your project:

- Click on **Shared Projects** > **your Project ID**, which is found in the **Connection Details** panel (begins with *qwiklabs*-).
- For **Shared project name** type "data-to-insights".
- For **Dataset** select **ecommerce**.
- For **Table** select **sales_report**.

![report-setup.png](https://cdn.qwiklabs.com/Ea3P5Qd0wBtCbTAdsu9fcKxqQdEN5IQYL2e2uDVHxts%3D)

1. Click **Add** in the bottom right corner and then click **Add to Report**.
2. A preview of the available fields you can add to the report opens.
3. Under Available Fileds, click on **ratio**, and drag it into the Dimention section.
4. Click in the number icon to edit.

![add_ratio_edit.png](https://cdn.qwiklabs.com/zXu1x6M710mF6jfejnn2JRgapcP0Gk61hUx05Uk9bZ4%3D)

1. Scroll down to the Type area, and use the dropdown menu to select **Numeric** > **Percent**.

You should now see the ratio column added with values as a percentage.





## Create a report

Now add some visuals and interactive filters for your report users.

### Add a Report Title and Page Title

1. In the top-left, click "Untitled Report" and rename it "Ecommerce Product Operations Report".
2. In the reporting tools menu bar, click on the text icon (looks like a boxed in A).
3. Click onto a blank area in your report. In the text area, type "Product Inventory Watchlist".
4. Highlight the text in the text area and in the Text Properties panel, increase the font size to 32px. You may need to adjust your text box so it fits correctly.

### Create a data table

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

### Create an interactive filter

1. In the reporting tools tray, click the Filter [ ![528063fec112f455.png](https://cdn.qwiklabs.com/jyGvhcxndKDFmO54IN8oiL2guwOS22CHDrnp%2FLDozxo%3D)] icon.
2. Above your data table, **click and drag** to create a filter.
3. In the data panel that opens, specify **name** as the Dimension and **total_ordered** as the Metric.
4. In the upper-right, select the **View** button to preview your report. You should be presented with the following:

![list2.png](https://cdn.qwiklabs.com/4BSOwFoYYhCYkdCfahKVAipsSvF4TvCy86lXNTCXvAs%3D)