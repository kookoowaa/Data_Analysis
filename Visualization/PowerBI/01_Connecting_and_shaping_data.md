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

> Text-specific tools
>
> - There are tools from Query Editor to split or merge text columns
> - There are also tools to time/clean and extract texts given options
> - The tools are available to **Transform**, or to **Add Column**

> Number-specific tools
>
> - Mostly single-value-returning tools
> - Used to perform explanatory analysis of loaded dataset in most cases (for Query editor)
> - These calculation tools are more frequently used later on to make **calculation values**

> Date-specific tools
>
> - Pretty much straight forward where most of the tools let you extract date element
> - There are tools to extract early
> - **Suggest creating a calendar table as a index** to be relationed to all others
>
> > Rolling Calendar with M CODE
> >
> > 1. Create a new, blank query
> >
> > 2. Set a baseline date as follows:
> >
> >    ```mcode
> >    =#date({yyyy}, {mm}, {dd})
> >    ```
> >
> > 3. Create list of dates using MCode:
> >
> >    ```Mcode
> >    = List.Dates({Source or 원본}, Number.From(DateTime.LocalNow())- Number.From({Source or 원본}), #duration(1,0,0,0))
> >    ```
> >
> > 4. Convert List to Table and format date



