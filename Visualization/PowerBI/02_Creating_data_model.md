# Data Modeling

> 1. Build normalized tables from the start
> 2. Organize lookup tables
> 3. Avoid two-way filtering
> 4. Hide fields that are foreign keys (not to be used in filter context)



## Data Normalization

- Each table should serve district and specific purpose

- In order to do so:

  > 1. Eliminate redundant data
  > 2. Minimize errors and anomalies
  > 3. Simplify queries

  **And build relationship** between tables!

## Data table vs. Lookup table

- Data table contains observations, whereas Lookup table contains descriptive information(expanding dimension)
- Lookup table normally consists of Primary Keys and its descriptive attributes;
  Data table normally consists of Foreign Keys and its observations.
- 1:N "one-to-many" relationship is valid in most case building relationship between such tables.
- Chain of lookup table relationship if often called snowflake schemas, whereas star schemas usually have individual lookup tables relationed to a data table

## Build relationship

- Connecting two tables using index column is common procedure to build relationship, from which Power BI, done by drag and drop
- Data to Lookup table, it is normally 1:N relationship;
  Lookup to Lookup table, it can be either 1:1 or 1:N relationship (But in case of **1:1 relationship it is more efficient to merge**)

## Data model with multiple data table (common)

- Relationship between two data tables is possible but indirectly
- Normally connecting two data table causes N:N relationship problem, even if two data tables share same characteristics
- However, indirect relationship is possible, connecting them via shared lookups
- For example, sales data and return data cannot be summarized by themselves, but connecting date lookup, summarizing by dates parameters become viable
- In this case, the **filter flow should come from the Lookup table (!must)**
  *Two-way filter will allow filtering from data table, but why not just use Lookup table?*
  *It can be practical to hide columns (foreign keys!) from report view to prevent confusion*



