# DAX

> 1. Build normalized tables from the start
> 2. Organize lookup tables
> 3. Avoid two-way filtering
> 4. Hide fields that are foreign keys (not to be used in filter context)



## Calculated Columns

- It is most common use of DAX to create calculated columns, referencing to columns or table, NOT A1-style value
- It is useful to filtering data, rather than creating numerical calculation (aggregation)
- Values in calculated columns are calculated based on information from each row of a table (Row Context)

## Measures (Explicit)

- Explicit Measure values are **not visible** within tables as it does not create new data; they live on visuals (measure)
- They are **constantly evaluated** based on filter context
- Implicit  measure on the other hand is plain measure from table where you can click through to assign measurement to like sum, average, etc.
- It is strongly **advised to use Explicit measure** even for a simple measure

It is advised to relocate calculated columns or measures according to the right scope (or select right table in the first place)



