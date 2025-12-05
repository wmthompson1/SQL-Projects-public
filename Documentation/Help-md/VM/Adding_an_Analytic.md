Adding an Analytic




# Adding an Analytic

To add an analytic:

1. Select File,
   Dashboard.
2. In the dashboard, select
   File, Open
   and select the dashboard to which you are adding the analytic.
3. Click Add
   Analytic.
4. Specify the type of
   analytic to add. To add an analytic that was delivered with VISUAL,
   click System. To add a custom metric, click Custom.
5. Click Ok.
6. In the Chart Type field,
   select the analytic to view.
7. In the Caption field,
   specify the caption. A default caption is inserted, but you can
   override the default. If you apply a particular filter to the
   analytic, you can change the caption to indicate the filter used.
8. Specify the settings
   and filters to apply to the analytic. The settings and filters
   that are available depend upon the analytic, but these fields
   are common:

Top N For analytics
that show a certain number of bars, such as Top N Customers by Revenue,
specify the number of bars to show.

Series Category
In a bar graph, the series category determines what the bars in
the graph represent. For example, if you select the Amount Purchased
From Supplier analytic, and you specify Product Code as the series
category, then each bar represents the total amount purchased by product
code. In a pie chart, the series category determines what each of
the wedges in the pie represent. For example, if you select the Tasks
analytic and you specify Type as the Series Category, then the pie
chart shows the percentage of tasks of each type.

Series Grouping
Series grouping applies to bar graphs only. The series grouping
determines what categories are used on the X-axis. For example, if
you select Week as the series grouping, then each bucket on the X-axis
represents one week. For date-based series groupings, the start date
of the grouping is used for the label. For example, if you specify
Quarter as the series grouping, and you show information for the four
quarters in 2015, then the start date of each quarter is used as the
label on the X-axis: 1/1/2015, 4/1/2015, 7/1/2015, and 10/1/2015.

Sites Select
the sites to include in the metric. The child sites of the accounting
entity specified for the dashboard are displayed, provided you are
allowed to access them in security settings.

9. Use the Period Type,
   Periods, Horizon Periods, Begin Date, and End Date fields to specify
   the date range for the data in the analytic. You can specify date
   ranges in these ways:

* No
  limitation by date. To view all available data, specify
  Date Range in the Period Type field. Leave the Begin Date and
  End Date fields blank.
* By
  a specific date range. To specify a date range, first specify
  Date Range in the Period Type field. Then, use the Begin Date
  and End Date fields to specify the date range. To view all information
  after a specific date, specify the date in the Begin Date field
  and leave the End Date field blank. To view all information before
  a specific date, specify the date in the End Date field and leave
  the Begin Date field blank. To view information for one specific
  date, specify the date in both the Begin Date and End Date fields.
* By
  a specific number of past periods, future periods, or both.
  To include data for a certain number of periods, specify the type
  of period to use in the Period Type field. You can select Days,
  Weeks, Months, Quarters, or Years.

Use the Periods field to indicate the number
of current and past periods to include. To include the current period
only, specify 1 in the Periods field. To include past periods, specify
the total number of periods to view including the current period.
For example, to include the current period and the previous two periods,
specify 3 in the Periods field.

Use the Horizon Periods field to indicate
the number of future periods to include. For example, to include the
next two periods after the current period, specify 2 in the Horizon
Periods field.

10. If filters are available
    for the analytic, fields are displayed below the End Date field.
    Specify the additional filters to use.
11. Click Ok.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Analytics.htm)
Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDBOARDWhat.htm)
What is the Dashboard?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help