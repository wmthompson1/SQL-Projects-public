Specifying Conditional Colors for Cells




# Specifying Conditional Colors for Cells

To set up conditional colors, you must first create hidden column
SQL statements that contain the conditions that must be met. Then,
you associate the hidden column with a visible column in your data
source.

1. Select File,
   Dashboard.
2. Select Edit,
   Edit Data Source.
3. In the Data Source ID
   field, select the data source.
4. Create column SQL Statements
   that contain the conditions. If you want to specify a color for
   both the cell background and the cell text, you must create two
   column SQL statements.

1. Click Insert.
2. Specify this information:

Column Name 
Specify a name to use for the column. The name that you specify
is replaced with the SQL statement when the query is constructed.

Visible 
Clear the visible check box.

Data Type Specify
String

3. In the Column SQL field, specify the
   SQL statement to use in place of the column name. Specify
   the condition that must be met and the RGB value of the color
   to use. For example, if your data source contains the vr.ORDER\_QTY
   column, you could write this statement to show orders with
   a quantity greater than 100 in a different color:

(case when vr.ORDER\_QTY > 100 then 255,0,0
else end)

4. Click Save.

5. Select the row that
   contains the column where you want to apply the conditional color.
   For example, if you created the SQL statement in step 4C, you
   would select the row that contains the vr.ORDER\_QTY column.
6. Click Edit
   Colors.
7. In the Background section,
   click Column, and then select the column
   that contains the SQL statement that you wrote for the background
   column color.
8. In the Text section,
   click Column, and then select the column
   that contains the SQL statement that you wrote for the text color.
9. Click Ok.

Next steps:

* To add a filter that is
  always applied to the data source, see [Filtering
  the Data Source](Filtering_the_Data_Source.htm).
* If you are finished building
  the data source, see [Viewing the
  Query](Viewing_the_Query.htm).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.htm)
Creating Data Sources

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help