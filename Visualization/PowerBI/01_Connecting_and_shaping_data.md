## Types of data connectors

Power BI can connect various types of source data:

- **Flat files** like csv, text, xls...
- **Folders**
- **Databases** like SQL, Access, Oracle, BigQuery...
- **Online Services** like Sharepoint, GitHub, Gogle Analytics...
- and Others

Once connected, it will lead to Query Editor regardless of the types of data connectors



## THE QUERY EDITOR (a.k.a. Power Query)

Much of the preprocessing is done from the Query Editor.
You can use "M Code" from the **Formula Bar** of Query Editor to carry out ETL in a more detailed level.
**Query Pane** on the left side allows customization via GUI from a data table perspective.
**Applied Steps** on the right side lets you process data more on column perspective.

### 1. Text-specific tools

- There are tools from Query Editor to split or merge text columns
- There are also tools to time/clean and extract texts given options
- The tools are available to **Transform**, or to **Add Column**

### 2. Number-specific tools

- Mostly single-value-returning tools
- Used to perform explanatory analysis of loaded dataset in most cases (for Query editor)
- These calculation tools are more frequently used later on to make **calculation values**

### 3. Date-specific tools

- Pretty much straight forward where most of the tools let you extract date element
- There are tools to extract early
- **Suggest creating a calendar table as a index** to be relationed to all others

> Rolling Calendar with M CODE
>
> 1. Create a new, blank query
>
> 2. Set a baseline date as follows:
>
>    ```mcode
>    =#date({yyyy}, {mm}, {dd})
>    ```
>
> 3. Create list of dates using MCode:
>
>    ```mcode
>    = List.Dates({Source or 원본}, Number.From(DateTime.LocalNow())- Number.From({Source or 원본}), #duration(1,0,0,0))
>    ```
>
> 4. Convert List to Table and format date

### 4. Conditional columns

- From **Add Column**, there is a conditional column tool
- It is in form of nested if statement

### 5. Grouping

- **Group By** allows aggregation of data at a different level

- It consists of 1) column index to be grouped by, 2) aggregation method, and 3) column values to be grouped by

- For 1) column index, and 3) column values, there can be a multiple columns to make a combination

  NOTE1 - There are also tools for pivot and unpivot
  NOTE2 - You can merge queries(tables), but it is not necessarily recommended
  NOTE3 - Concatenate function is also available under name Append
                 (This is useful for the time series dataset sharing same structure: USER "Folder Option!")

### 6. Combine data

- Data table can be combined either vertically (append), or horizontally (merge)
- In order to combine data vertically, both table needs to contain same features (or columns)
  If not, it can be manually adjusted via query editor

___

## Out of the Query Editor

There are things to be done outside the Query Editor.

### 1.  Adding a data property to a geographical observations

- If there is an observation about the geographical data in a string format, geographical properties can be assigned to the dataset:

  > 1. Go to the main menu
  > 2. From the field (to the right), select observation 
  > 3. From the ribbon menu, Column tools > Properties > Data category to assign property

### 2.  Assigning data **Hierarchy for drill down**

- There are ways to assign hierarchy between observations, which you can drill down from visuals

  > 1. Select observation from the field on the right
  > 2. Right click to create hierarchy
  > 3. select other observations to add to the hierarchy

### 3. Import models built from Excel and Power Pivot

- **Get Data > Excel** will connect to data tables from the excel file
- **File > Import > Excel workbook contents** would import all the models and preprocessing done (either via MCode, VBA, or DAX) from the excel file
