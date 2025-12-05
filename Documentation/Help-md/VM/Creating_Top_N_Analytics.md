Creating Top N Analytics




# Creating Top N Analytics

Use Top N analytics to analyze the top results in your data source.
For example, you can use this analytic type to find customers with
the highest amount ordered values or users with the most activities
assigned to them.

When users add the analytic to their dashboards, they decide the
number of results to display in the analytic.

You can measure these values:

* Count.
  You can count the number of times each ID is used in a database
  column. To specify the column to analyze, use the Category Column
  field. For example, if you select CATEGORY\_ID in the Category
  Column field, then an analytic that shows how many times each
  category occurs in your data source is displayed. If users specified
  5 as the Top N value, then the five most common categories in
  the data source are displayed.
* Individual
  values. You can identify the top individual values in a
  database column. To examine individual values, specify None in
  the Value Aggregation field. To specify the column to analyze,
  use the Value Column field. For example, if you select AMOUNT\_ORDERED
  in the Value Column, an analytic that shows the highest values
  in the AMOUNT\_ORDERED column is displayed. If you selected CUSTOMER\_ID
  in the Category Column field, the analytic would show the customers
  that placed the highest value order lines.
* Aggregate
  values. You can identify the top sums in a database
  column. To examine sums, specify Sum in the Value Aggregation
  field. To specify the information to analyze, use the Value Column
  and Category Column field. For example, if you select AMOUNT\_ORDERED
  in the Value Column field and CUSTOMER\_ID in the Category Column
  field, the top customers by total amount ordered for all orders
  are displayed.

You cannot add a Series Column to a top N analytic.

To create a top N analytic:

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
Specify Top N.

4. Specify the type of
   chart. For Top N analytics, you can use bar and column charts.
   Although you can select Line as the chart type, using a Line chart
   for a top N analytic does not result in a meaningful chart. Generally,
   you should use Line charts with period based charts.

You cannot use a pie or doughnut chart.

5. Specify the data to
   measure:
6. To count the
   instances of IDs in a database column, specify this information:

Value Aggregation 
Specify Count.

Category Column 
Click the down arrow and select the data to count. The analytic shows
the number of times each ID is used in the column. For example, if
you select SALES\_REP in this field, then the analytic shows the total
number of times each sales rep ID appears in your data set. If you
selected a bar-type chart or a column-type chart, one bar or column
for each ID in the column that you selected is displayed.

* To measure
  the top individual values in a column, specify this information:

Value Aggregation 
Specify None.

Value Column 
Specify the column to use to provide values to the chart. Only columns
that have a data type of Number are displayed in the list. For example,
if you select AMOUNT\_ORDERED in the Value Column field, the analytic
identifies the top individual values in the amount ordered.

Category Column 
Use this field to break the grand total of the value column into subtotals.
For example, if you select AMOUNT\_ORDERED in the Value Column field
and ORDER\_ID in the Category Column field, a chart that shows the
orders associated with the largest individual AMOUNT\_ORDERED values
is displayed.

* To measure
  the aggregated values in a column, specify this information:

Value Aggregation 
Specify Sum.

Value Column 
Specify the column to use to provide values to the chart. Only columns
that have a data type of Number are displayed in the list.

Category Column
Use this field to specify how the column that you selected in the
Value Column field is added. For example, if you select CUSTOMER\_ID
in the Category Column field and AMOUNT\_ORDERED in the Value Column
field, the total amount ordered for each customer in your data source
is calculated.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.htm)
Building Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help