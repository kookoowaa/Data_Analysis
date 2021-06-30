# Visualizing

> 1. Do not use calculated column w



## Filtering options

- There are four types of filter: Report level, Page level, visual level, and drill-through
- Slicer visualization is another fancy way of filtering, and it filters data post report/page level filters
  (and from **View > Sync slicer**, connecting slicers with filters is viable)
- Drill-through filter allow users to jump to different report pages like **link/bookmark**, that connects to different pages with filtered contents
  (This can be selected on the same scope on other pages)
  It is more like page-level filter applying from other pages.

## Cards

- For KPIs, insert measure into **indicator** to track record of business index
- Adding datetime in **trend axis** would add area graph beneath the card
- Adding goal figure in the **target goals** would automatically return green/red evaluation of KPIs

## What-If parameter for simulation

- Click on **Ribbon menu > Modeling > New parameter(what if)** will create an empty slicer and measure connected to it
- Using the measure variable, calculated measure can be formulated using DAX
- As the new calculated measure is connected to the slicer, the visuals with the measure are simultaneously changing allowing user to simulate different scenarios

