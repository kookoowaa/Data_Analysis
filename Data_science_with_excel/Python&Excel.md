# Python & excel

## Sample dataset

```python
import pandas as pd
sales = pd.read_excel('https://github.com/datagy/mediumdata/raw/master/pythonexcel.xlsx', sheet_name = 'sales')
states = pd.read_excel('https://github.com/datagy/mediumdata/raw/master/pythonexcel.xlsx', sheet_name = 'states')

```

## IF function with python

```
=IF([@Sales]>500, "Yes", "No")
```

```python
sales['MoreThan500'] = ['Yes' if x > 500 else 'No' for x in sales['Sales']]
```

## VLOOKUP in pandas

```
=VLOOKUP([@City], states, 2, false)
```

```python
sales = pd.merge(sales, states, how='left', on='City')
```

## SUMIFs in pandas

```
=SUMIF(sales[Product], "Bananas", sales[Sales])
```

```python
sales.loc[sales["Product"] == "Bananas", "Sales"].sum()
```

## Pivot Tables in pandas

```python
sales.pivot_table(index = 'City', columns = 'Product', values = 'Sales', aggfunc = 'sum')
### or ###
pd.crosstab(index=sales['City'], columns=sales['Product'], values = sales['Sales'], aggfunc='sum')
```

## Color Maps formatting in pandas

```python
sales.style.background_gradient(subset=['Sales'], cmap = 'YlGnBu')
```

## Data Bars in python

```python
sales.style.bar(subset=['Sales'], color = '#50C878')
```





Ref.

https://towardsdatascience.com/learn-how-to-easily-do-3-more-advanced-excel-tasks-in-python-36449e425c9d

https://towardsdatascience.com/learn-how-to-easily-do-3-advanced-excel-tasks-in-python-925a6b7dd081
