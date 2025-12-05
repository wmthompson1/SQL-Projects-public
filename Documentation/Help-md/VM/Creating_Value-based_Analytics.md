Creating Value-based Analytics




# Creating Value-based Analytics

Use value-based analytics to analyze a value in your database.

You can measure these values:

* Count.
  You can count the number of times each ID is used in a database
  column. To specify the column to analyze, use the Category Column
  field. For example, if you select CATEGORY\_ID in the Category
  Column field, then an analytic that shows how many times each
  category occurs in your data source is displayed.
* Value
  Column. You can select a data source column that has the
  Number data type. To specify the column to analyze, use the Value
  Column field. You can use the Category Column field to view subtotals
  by another column in your data source. For example, you can select
  AMOUNT\_ORDERED in the Value Column field and CUSTOMER\_ID in the
  Category Column field to create a chart that shows the total amount
  ordered for each customer ID in your database.

To add a sub-category to the analytic, use the Series Column field.
For example, you can specify PART\_ID in the Series Column field to
view the total amount ordered of each part by each customer. You can
add sub-categories to count and value column analytics.

To add a value-based analytic:

1. Select File,
   Dashboard.
2. Select Edit,
   Edit Analytic.
3. Specify this information:

Configuration ID 
Specify a name for the analytic.

Description 
Specify a description of the analytic.

Data Source ID
Specify the data source to use as the basis of this analytic.

Analytic Type 
Specify Value Based.

4. Specify the type of
   chart. For value-based analytics, you can use any chart type.
   Although you can select Line as the chart type, using a Line chart
   for a value-based analytic does not result in a meaningful chart.
   Generally, you should use Line charts with period based charts.
5. Specify the data to
   measure:

* To count the
  instances of IDs in a database column, specify this information:

Value Aggregation 
Specify Count.

Category Column 
For line, bar, and column charts, specify the data source column to
use. The analytic shows the number of times each ID is used in the
column. For example, if you select SALES\_REP in this field, then the
analytic shows the total number of times each sales rep ID appears
in your data set. If you selected a bar-type chart or a column-type
chart, one bar or column for each ID in the column that you selected
is displayed.

This field is unavailable for pie charts and
doughnut charts.

Series Column 
For line, bar, and column charts, you can optionally specify a sub-category.
For example, if you selected CUSTOMER\_ID in this field and SALES\_REP
in the Category Column field, the analytic shows the number of records
in your data set contain both a particular sales rep ID and a particular
customer ID. Depending on the chart type you select, your chart would
contain a bucket for each sales rep ID. In each sales rep ID bucket,
a bar or column is displayed for each customer ID.

For pie charts and doughnut charts, use this
field to specify data source column for the chart. For example, if
you select SALES\_REP in this field, then each unique instance of a
sales rep in your data set is represented by a wedge. The size of
the wedge indicates the number of times the sales rep ID occurs in
your data set.

* To use a value
  column, specify this information:

Value Aggregation 
The recommended value is Sum. If you specify None, the performance
of the metric will be slower than if you specify Sum.

Value Column 
Specify the column to use to provide values to the chart. Only columns
that have a data type of Number are displayed in the list. All values
in the column that you select are added. For example, if you select
AMOUNT\_ORDERED in the Value Column field, the total of all values
in the AMOUNT\_ORDERED column is displayed. Depending on the type of
chart you select, a single bar, column, solid pie, or solid doughnut
is displayed.

Category Column 
For line, bar, and column charts, use this field to break the grand
total of the value column into subtotals. For example, if you select
AMOUNT\_ORDERED in the Value Column field and CUSTOMER\_ID in the Category
Column field, a chart that shows the total amount that each customer
ordered is displayed. If you selected a bar-type chart or a column-type
chart, one bar or column for each ID in the category column is displayed.

Series Column  For
line, bar, and column charts, use this field to break the category
subtotals into smaller subtotals. For example, if you select AMOUNT\_ORDERED
in the Value Column field, CUSTOMER\_ID in the Category Column field,
and PART\_ID in the Series Column field, a chart that shows one bucket
for each customer ID is created. In each customer ID bucket, a bar
or column for each part ID is created. Each bar shows the total amount
that each customer ordered of each part.

If you selected a pie chart or a doughnut chart,
then use the Series Column field to break the grand total of the value
column into subtotals. One wedge for each unique ID in the series
column is displayed.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.htm)
Building Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help