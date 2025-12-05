Measurement Basis




# Measurement Basis

To specify the value that is measured in the analytic,
use the Value Column and Value Aggregation fields. You can measure
data in these ways:

Count  You can count the number
of times particular IDs appear in a column in your data source. To
specify the column to analyze, use the Category Column field. For
example, to count activities by activity type, specify Count in the
Value Aggregation field and Activity\_Type\_ID in the Category Column
field. You can add a series to the category that you specify. When
you add a series, the category column is broken down into smaller
data points. For example, if you specified STATUS in the Series column,
your analytic would have a category for each activity type. Within
each activity type, separate data points would be shown for each activity
status.

The Category Column and Series Column values that you specify are
default values. When users add the analytic to their dashboards, they
can select a different Category Column and Series Column.

Total Value of a Database Column 
You can add values in a database column that has Number as a data
type. To specify the column to analyze, specify None or Sum in the
Value Aggregation field, and then specify the column to analyze in
the Value Column field. For example, if you specified TOTAL\_SHIPPED\_QUANTITY
in the Value Column field, then the analytic would show the total
of all values on the TOTAL\_SHIPPED\_QUANTITY column.

Use the Category Column to break down the total into categories.
For example, if you specified CUSTOMER\_ID in the Category Column field,
an analytic that showed the total shipped quantity for each customer
is displayed. Use the Series Column to break down each category total.
For example, if you specified PART\_ID in the Series Column field,
then the total shipped quantity for each part purchased by each customer
is displayed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.htm)
Building Analytics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help