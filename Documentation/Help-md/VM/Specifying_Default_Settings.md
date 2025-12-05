Specifying Default Settings




# Specifying Default Settings

When you create an analytic, you can specify a default date filter.
If you created a top N analytic, you can also specify the default
number of results to display in the analytic.

To use a date filter, your data source must contain at least one
date column that has a Filter Type of Range. If your data source does
not meet these criteria, then the analytic cannot be filtered by date.
When users add the analytic to their dashboards, they can change the
default settings.

To specify the default settings:

1. Select File,
   Dashboard.
2. Select Edit,
   Edit Analytic.
3. In the Configuration
   ID field, select the analytic.
4. Specify the date filters:

* To use periods,
  click the Period Type drop-down button and select the type of
  period to use. In the Periods field, specify the number of past
  periods to include in the date filter. In the Horizon Periods
  field, specify the number of future periods to include in the
  date filter. For example, to create a date filter that includes
  records from two weeks before today and one week after today,
  specify Weeks in the Period Type field, 2 in the Periods field,
  and 1 in the Horizon Periods field.
* To specify
  a date range, click the Period Type drop-down button and select
  Date Range. Specify the first date in the range in the Begin Date
  field. Specify the last date in the range in the End Date field.

5. If your analytic is
   a Top N analytic, specify the default number of results to display
   in the Top N field.
6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.htm)
Building Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help