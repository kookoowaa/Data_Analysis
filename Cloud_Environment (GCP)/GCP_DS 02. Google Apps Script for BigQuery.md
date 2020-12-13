# Google Apps Script for BigQuery

**Google Apps Script**는 구글 앱을 이용하여 어플리케이션을 만드는 도구로, JavaScript 기반으로 이루어져 있음

Google Apps Script와 Google REST API를 활용하면, BigQuery와 여타 구글 서비스와 연동이 가능 (i.e. Google Sheets, Slides)

Google Apps Script를 활용하여 로그를 Google Sheets에 남기고, Slide를 남길 수도 있음

> ### Full Code
>
> ```javascript
> /**
>  * Copyright 2018 Google LLC
>  *
>  * Licensed under the Apache License, Version 2.0 (the "License");
>  * you may not use this file except in compliance with the License.
>  * You may obtain a copy of the License at apache.org/licenses/LICENSE-2.0.
>  *
>  * Unless required by applicable law or agreed to in writing, software
>  * distributed under the License is distributed on an "AS IS" BASIS,
>  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
>  * See the License for the specific language governing permissions and
>  * limitations under the License.
>  */
> 
> // Filename for data results
> var QUERY_NAME = "Most common words in all of Shakespeare's works";
> // Replace this value with your Google Cloud API project ID
> var PROJECT_ID = "qwiklabs-gcp-03-d32889784b1d"
> if (!PROJECT_ID) throw Error('Project ID is required in setup');
> 
> /**
>  * Runs a BigQuery query, adds data and a chart in a Sheet,
>  * and adds the data and chart to a new slide presentation.
>  */
> function createBigQueryPresentation() {
>   var spreadsheet = runQuery();
>   Logger.log('Results spreadsheet created: %s', spreadsheet.getUrl());
>   var chart = createColumnChart(spreadsheet);
>   var deck = createSlidePresentation(spreadsheet, chart);
>   Logger.log('Results slide deck created: %s', deck.getUrl());
> }
> 
> 
> 
> /**
>  * Runs a BigQuery query; puts results into Sheet. You must enable
>  * the BigQuery advanced service before you can run this code.
>  * @see http://developers.google.com/apps-script/advanced/bigquery#run_query
>  * @see http://github.com/gsuitedevs/apps-script-samples/blob/master/advanced/bigquery.gs
>  *
>  * @returns {Spreadsheet} Returns a spreadsheet with BigQuery results
>  * @see http://developers.google.com/apps-script/reference/spreadsheet/spreadsheet
>  */
> function runQuery() {
>   // Replace sample with your own BigQuery query.
>   var request = {
>     query:
>         'SELECT ' +
>             'LOWER(word) AS word, ' +
>             'SUM(word_count) AS count ' +
>         'FROM [bigquery-public-data:samples.shakespeare] ' +
>         'GROUP BY word ' +
>         'ORDER BY count ' +
>         'DESC LIMIT 10'
>   };
>   var queryResults = BigQuery.Jobs.query(request, PROJECT_ID);
>   var jobId = queryResults.jobReference.jobId;
> 
>   // Wait for BQ job completion (with exponential backoff).
>   var sleepTimeMs = 500;
>   while (!queryResults.jobComplete) {
>     Utilities.sleep(sleepTimeMs);
>     sleepTimeMs *= 2;
>     queryResults = BigQuery.Jobs.getQueryResults(PROJECT_ID, jobId);
>   }
> 
>   // Get all results from BigQuery.
>   var rows = queryResults.rows;
>   while (queryResults.pageToken) {
>     queryResults = BigQuery.Jobs.getQueryResults(PROJECT_ID, jobId, {
>       pageToken: queryResults.pageToken
>     });
>     rows = rows.concat(queryResults.rows);
>   }
> 
>   // Return null if no data returned.
>   if (!rows) {
>     return Logger.log('No rows returned.');
>   }
> 
>   // Create the new results spreadsheet.
>   var spreadsheet = SpreadsheetApp.create(QUERY_NAME);
>   var sheet = spreadsheet.getActiveSheet();
> 
>   // Add headers to Sheet.
>   var headers = queryResults.schema.fields.map(function(field) {
>     return field.name.toUpperCase();
>   });
>   sheet.appendRow(headers);
> 
>   // Append the results.
>   var data = new Array(rows.length);
>   for (var i = 0; i < rows.length; i++) {
>     var cols = rows[i].f;
>     data[i] = new Array(cols.length);
>     for (var j = 0; j < cols.length; j++) {
>       data[i][j] = cols[j].v;
>     }
>   }
> 
>   // Start storing data in row 2, col 1
>   var START_ROW = 2;      // skip header row
>   var START_COL = 1;
>   sheet.getRange(START_ROW, START_COL, rows.length, headers.length).setValues(data);
> 
>   // Return the spreadsheet object for later use.
>   return spreadsheet;
> }
> 
> 
> 
> /**
>  * Uses spreadsheet data to create columnar chart.
>  * @param {Spreadsheet} Spreadsheet containing results data
>  * @returns {EmbeddedChart} visualizing the results
>  * @see http://developers.google.com/apps-script/reference/spreadsheet/embedded-chart
>  */
> function createColumnChart(spreadsheet) {
>   // Retrieve the populated (first and only) Sheet.
>   var sheet = spreadsheet.getSheets()[0];
>   // Data range in Sheet is from cell A2 to B11
>   var START_CELL = 'A2';  // skip header row
>   var END_CELL = 'B11';
>   // Place chart on Sheet starting on cell E5.
>   var START_ROW = 5;      // row 5
>   var START_COL = 5;      // col E
>   var OFFSET = 0;
> 
>   // Create & place chart on the Sheet using above params.
>   var chart = sheet.newChart()
>      .setChartType(Charts.ChartType.COLUMN)
>      .addRange(sheet.getRange(START_CELL + ':' + END_CELL))
>      .setPosition(START_ROW, START_COL, OFFSET, OFFSET)
>      .build();
>   sheet.insertChart(chart);
>   
>    // Return chart object for later use
>   return chart;
> }
> 
> 
> 
> /**
>  * Create presentation with spreadsheet data & chart
>  * @param {Spreadsheet} Spreadsheet with results data
>  * @param {EmbeddedChart} Sheets chart to embed on slide
>  * @returns {Presentation} Slide deck with results
>  */
> function createSlidePresentation(spreadsheet, chart) {
>   // Create the new presentation.
>   var deck = SlidesApp.create(QUERY_NAME);
> 
>   // Populate the title slide.
>   var [title, subtitle] = deck.getSlides()[0].getPageElements();
>   title.asShape().getText().setText(QUERY_NAME);
>   subtitle.asShape().getText().setText('via GCP and G Suite APIs:\n' +
>     'Google Apps Script, BigQuery, Sheets, Slides');
>   
>   
>     // Data range to copy is from cell A1 to B11
>   var START_CELL = 'A1';  // include header row
>   var END_CELL = 'B11';
>   // Add the table slide and insert an empty table on it of
>   // the dimensions of the data range; fails if Sheet empty.
>   var tableSlide = deck.appendSlide(SlidesApp.PredefinedLayout.BLANK);
>   var sheetValues = spreadsheet.getSheets()[0].getRange(
>       START_CELL + ':' + END_CELL).getValues();
>   var table = tableSlide.insertTable(sheetValues.length, sheetValues[0].length);
> 
>   // Populate the table with spreadsheet data.
>   for (var i = 0; i < sheetValues.length; i++) {
>     for (var j = 0; j < sheetValues[0].length; j++) {
>       table.getCell(i, j).getText().setText(String(sheetValues[i][j]));
>     }
>   }
> 
>     // Add a chart slide and insert the chart on it.
>   var chartSlide = deck.appendSlide(SlidesApp.PredefinedLayout.BLANK);
>   chartSlide.insertSheetsChart(chart);
> 
>   // Return the presentation object for later use.
>   return deck;
> }
> ```

> ### 구조
>
> - `createBigQueryPresentation()` 내에 Google Cloud의 `PROJECT_ID`를 변수로 지정
> - `createBigQueryPresentation()`에서 `runQuery()`를 호출하여 결과물을 SpreadSheet에 저장
> - `createBigQueryPresentation()`에서 SpeadSheet를 인수로 받아 `createColumnChart()`를 호출, Chart 생성
> - `createBigQueryPresentation()`에서 SpeadSheet와 Chart를 인수로 받아 `createSlidePresentation()`을 호출, Google Slide를 생성

> ### `runQuery()` 함수

> ### `createColumnChart()` 함수

> ### `createSlidePresentation()` 함수