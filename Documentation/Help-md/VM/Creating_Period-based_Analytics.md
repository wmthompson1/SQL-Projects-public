Creating Period-based Analytics




# Creating Period-based Analytics

Use period-based analytics to analyze how values in your data source
changed over time.

To create a period-based analytic, your data source must contain
columns that can be used as time periods. You can use the columns
in the VR\_CAL\_DATE table, or you can use other columns that show a
date, such as an INVOICE\_DATE column.

The VR\_CAL\_DATE table contains columns that translate dates into
days, weeks, months, quarters, and years. You can join the VR\_CAL\_DATE
table to your data source. When you create the analytic, you can map
the columns in the VR\_CAL\_DATE table to the periods shown on the Period
tab.

To use a date column from other tables in your data source, you
must apply a SQL statement to the column to extract the period information.
For example, if you want to use the INVOICE\_DATE column as the source
for the period month bucket, you would write a SQL statement that
extracts the month and year from the INVOICE\_DATE.

When you create the analytic, the column that you select for the
Category Column must match one of the columns that you specified on
the Period tab.

You can measure these values:

Count. You can count
the number of times each time period occurs in your data source. For
example, if you specified CAL\_YEAR in the Category Column field, then
an analytic that shows how many times each year occurs in your data
source is displayed.

Value Column. You
can select a data source column that has the Number data type. To
specify the column to analyze, use the Value Column field. For example,
if you select AMOUNT\_ORDERED in the Value Column field and CAL\_YEAR
in the Category Column field, an analytic that shows the total amount
ordered for each year in your data source is displayed.

To add a sub-category to the analytic, use the Series Column field.
For example, you can specify PART\_ID in the Series Column field to
view the total amount ordered of each part in each year. You can add
sub-categories to count and value column analytics.

To create a period-based analytic:

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
Specify Period Based.

4. Specify the type of
   chart. For period-based analytics, you can use bar charts, column
   charts, or line charts. You cannot use pie or doughnut charts.
5. Click the Period
   tab.
6. In the Period Calendar
   Type field, select Reporting if you are using the VR\_CAL\_DATE
   table as the source of the period buckets. Select Derived if you
   are using other pieces of data in your data source as the source
   of the period buckets.
7. In the Period Column
   fields, specify the column that corresponds to the period type.
   For example, if you are using the VR\_CAL\_DATE table, you would
   select CAL\_MONTH in the Period Month Column.
8. Specify the data to
   measure:

To count the instances of periods in a database
column, specify this information:

* Value
  Aggregation  Specify Count.
* Category
  Column  Click the down arrow and select the period
  to count. You can select any of the columns that you defined on
  the Period tab. For example, if you selected CAL\_MONTH in this
  field, the analytic would show the number of times each Month/Year
  combination occurs in your data source.
* Series
  Column  Optionally, specify a sub-category. For example,
  if you selected CUSTOMER\_ID in this field, the analytic shows
  the number of records in your data set contain both a particular
  Month/Year combination and a particular customer ID. Depending
  on the chart type you select, your chart would contain a bucket
  for each month. In each month bucket, a bar or column is displayed
  for each customer ID.

To use a value column, specify this information:

* Value
  Aggregation  The recommended value is Sum. If you
  specify None, the performance of the metric will be slower than
  if you specify Sum.
* Value
  Column  Specify the column to use to provide values
  to the chart. Only columns that have a data type of Number are
  displayed in the list. All values in the column that you select
  are added. For example, if you select AMOUNT\_ORDERED in the Value
  Column field, the total of all values in the AMOUNT\_ORDERED column
  is displayed.
* Category
  Column  Use this field to break the grand total of
  the value column into subtotals by period. For example, if you
  select AMOUNT\_ORDERED in the Value Column field and CAL\_WEEK in
  the Category Column field, a chart that shows the total amount
  that each customer ordered each week is displayed.
* Series
  Column  Use this field to break the category subtotals
  into smaller subtotals. For example, if you select AMOUNT\_ORDERED
  in the Value Column field, CAL\_WEEK in the Category Column field,
  and PART\_ID in the Series Column field, a chart that shows one
  bucket for each week is created. In each bucket, a bar or column
  for each part ID is created. Each bar shows the total amount that
  each customer ordered of each part.

9. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.md)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.md)
Building Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.md) User-defined Help