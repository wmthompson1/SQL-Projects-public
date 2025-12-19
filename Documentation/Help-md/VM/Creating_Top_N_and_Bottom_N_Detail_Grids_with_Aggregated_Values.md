Creating Top N and Bottom N Detail Grids with Aggregated Values




# Creating Top N and Bottom N Detail Grids with Aggregated Values

Use the settings described in this procedure to create
a grid that identifies the top aggregated values or bottom aggregated
values in a column in your data source. For example, you could use
these settings to identify the customers with the lowest total amount
ordered.

1. Select File,
   Dashboard.
2. Select Edit,
   Edit Detail Grid.
3. Specify this information:

Configuration ID 
Specify a name for the analytic.

Description 
Specify a description of the analytic.

Data Source ID
Specify the data source to use as the basis of this analytic.

Title  Specify
the title of the grid. When users add the detail grid to their dashboards,
the title is displayed in the title bar of the detail grid.

Grid Type 
Specify Top N to create a grid that
contains the largest results. Specify Bottom N to
create a grid that contains the smallest results.

4. In the Value Column
   field, click the drop-down button and select the column to evaluate.
5. In the Value Aggregation
   field, specify Sum.
6. In the Top N or Bottom
   N field, specify the number of results to display in the metric.
   The label of this field changes depending on the value that you
   select in the Grid Type field.
7. Specify the default
   date filters:
8. To use periods,
   click the Period Type drop-down button and select the type of
   period to use. In the Periods field, specify the number of past
   periods to include in the date filter. In the Horizon Periods
   field, specify the number of future periods to include in the
   date filter. For example, to create a date filter that includes
   records from two weeks before today and one week after today,
   specify Weeks in the Period Type field, 2 in the Periods field,
   and 1 in the Horizon Periods field.
9. To specify
   a date range, click the Period Type drop-down button and select
   Date Range. Specify the first date in
   the range in the Begin Date field. Specify the last date in the
   range in the End Date field.

When users add the detail grid to their
dashboards, they can specify different date filters.

8. In the Columns table,
   select the column to use as the value category. This column determines
   how values in the value column are added. For example, to calculate
   the total amount ordered by customer, specify AMOUNT\_ORDERED in
   the Value Column field and select the Customer ID check box in
   the column table.

You can select additional columns. Any other
columns that you select become part of the definition of the value
category. For example, if you selected both Customer ID and Part ID
in the Columns table and specified AMOUNT\_ORDERED in the Value Column,
a metric that shows the total amount ordered for each customer ID/part
ID combination is displayed.

9. Click Save.
10. To review the appearance
    and performance of the detail grid, click the Data tab.
11. Select the Populate
    Detail check box. The detail grid is constructed based
    on the parameters that you specified. The number of rows included
    in the grid, the amount of time it took to construct the grid,
    and the number of rows per second are displayed.
12. When you are finished
    creating the detail grid, click the Status drop-down button and
    select Active.
13. Click Save.
    Users can now add the detail grid to their dashboards.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.md)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Building_Detail_Grids.md)
Building Detail Grids

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.md) User-defined Help