## Rolling Calendar with M CODE

1. Create a new, blank query

2. Set a baseline date as follows:

   ```mcode
   =#date({yyyy}, {mm}, {dd})
   ```

3. Create list of dates using MCode:

   ```Mcode
   = List.Dates({Source or 원본}, Number.From(DateTime.LocalNow())- Number.From({Source or 원본}), #duration(1,0,0,0))
   ```

4. Convert List to Table and format date

## Rolling Calendar with DAX

```dax
Table = CALENDAR(date(2020,09,01),TODAY())
```





