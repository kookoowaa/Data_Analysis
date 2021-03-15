## VBA Chart

## 1. Create embedded Chart

```vb
'ChartObjects.Add()

Sub CreateEmbeddedChartUsingChartObject()

Dim embeddedchart As ChartObject

Set embeddedchart = Sheets("Sheet1").ChartObjects.Add(Left:=180, Width:=300, Top:=7, Height:=200)
embeddedchart.Chart.SetSourceData Source:=Sheets("Sheet1").Range("A1:B4")

End Sub
```

```vb
'Shapes.AddChart

Sub CreateEmbeddedChartUsingShapesAddChart()

Dim embeddedchart As Shape

Set embeddedchart = Sheets("Sheet1").Shapes.AddChart
embeddedchart.Chart.SetSourceData Source:=Sheets("Sheet1").Range("A1:B4")

End Sub
```

## 2. Chart type

```vb
'ChartObject.Chart.ChartType

Sub SpecifyAChartType()

Dim chrt As ChartObject

Set chrt = Sheets("Sheet1").ChartObjects.Add(Left:=180, Width:=270, Top:=7, Height:=210)
chrt.Chart.SetSourceData Source:=Sheets("Sheet1").Range("A1:B5")
chrt.Chart.ChartType = xlPie

End Sub
```

## 3. Params in CharObject

```vb
'Title
'ChartObject.SetElement (msoElementChartTitle{...})
'ChartObject.ChartTitle.Text

Sub AddingAndSettingAChartTitle()

ActiveChart.SetElement (msoElementChartTitleAboveChart)
ActiveChart.ChartTitle.Text = "The Sales of the Product"
    
End Sub
```

```vb
'Background color
'ChartObject.ChartArea     (color)

Sub AddingABackgroundColorToTheChartArea()

ActiveChart.ChartArea.Format.Fill.ForeColor.RGB = RGB(253, 242, 227)

End Sub


'ChartObject.PlotArea      (color)
Sub AddingABackgroundColorToThePlotArea()

ActiveChart.PlotArea.Format.Fill.ForeColor.RGB = RGB(208, 254, 202)
    
End Sub
```

```vb
'Legend
'ActiveChart.SetElement (msoElementLegend{...})

Sub AddingALegend()

ActiveChart.SetElement (msoElementLegendLeft)

End Sub
```

```vb
'Label
'ctiveChart.SetElement msoElementDataLabel{...}


Sub AddingADataLabels()

ActiveChart.SetElement msoElementDataLabelInsideEnd

End Sub
```

```vb
'axis format
'ActiveChart.Axes(xlValue).TickLabels.NumberFormat

Sub ChangingTheNumberFormat()

ActiveChart.Axes(xlValue).TickLabels.NumberFormat = "$#,##0.00"

End Sub
```

```vb
'font
'ChartObject.ChartArea.Format.TextFrame2.TextRange.Font...

Sub ChangingTheFontFormatting()

With ActiveChart
.ChartArea.Format.TextFrame2.TextRange.Font.Name = "Times New Roman"
.ChartArea.Format.TextFrame2.TextRange.Font.Bold = True
.ChartArea.Format.TextFrame2.TextRange.Font.Size = 14

End With
```

## 4. ChartObject Collection

- There are a collection of ChartObjects on Worksheet `ChartObjects(n)`

```vb
'Navigate through each Charts on a sheet

Sub ReferringToAllTheChartsOnASheet()

Dim cht As ChartObject

For Each cht In ActiveSheet.ChartObjects
cht.Height = 144.85
cht.Width = 246.61

cht.Chart.Axes(xlValue).MajorGridlines.Delete
cht.Chart.PlotArea.Format.Fill.ForeColor.RGB = RGB(242, 242, 242)
cht.Chart.ChartArea.Format.Fill.ForeColor.RGB = RGB(234, 234, 234)
cht.Chart.PlotArea.Format.Line.ForeColor.RGB = RGB(18, 97, 172)

Next cht

End Sub
```

## 5. SeriesCollection in Chart

- For each Chart/CharObject there are SeriesCollections, each representing a group of variable in Chart

```vb
Worksheets("sheet1").ChartObjects(1).Chart. _ 
 SeriesCollection(1).Interior.Color = RGB(255, 0, 0)
```



https://www.automateexcel.com/vba/charts-graphs/