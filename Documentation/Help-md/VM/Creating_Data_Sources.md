Creating Data Sources




# Creating Data Sources

To build a data source, follow these steps:

1. Select the base table
   and the reference tables. All data sources must have one base
   table. The base table is the primary source of data for your metric.
   For example, if you are creating a metric based on customer sales,
   you would likely use the CUST\_ORDER\_LINE table as the base table.
   To extend the information that is available to your metric, you
   can select additional reference tables. See [Selecting
   Tables for the Data Source](Selecting_Tables_for_the_Data_Source.htm#XREF_35064_Selecting_Tables).
2. If you selected multiple
   tables, specify how to join the tables. When you join tables,
   you specify a piece of information that is common to both tables.
   For example, if you wanted to include the customers ID in your
   metric, you could join the CUSTOMER\_ORDER table to the CUST\_ORDER\_LINE
   table. If you wanted to include the customers name, you could
   then join the CUSTOMER table to the CUSTOMER\_ORDER table. See
   [Joining
   Tables](Joining_Tables.htm).
3. Select the columns to
   include in your data source. When you create an analytic or detail
   grid, you can base the analytic or grid on the columns that you
   select for the data source. See [Selecting
   Columns for the Data Source](Selecting_Columns_for_the_Data_Source.htm#XREF_98513_Selecting_Columns).
4. Optionally, specify
   a SQL statement to use in place of a column ID. You can use a
   SQL statement to combine values from more than one column together
   or to specify a hierarchy of columns to use when a null value
   is found. See [Adding
   Column SQL Statements](Adding_Column_SQL_Statements.htm#XREF_49255_Adding_Column_SQL).
5. Optionally, add drill-to
   functionality to columns. See [Drill
   To Columns](Drill_To_Columns.htm).
6. Optionally, specify
   the filters that users can apply when they add an analytic or
   detail grid. See [Specifying Filters](Specifying_Filters.htm).
7. Optionally, add color
   to columns. See [Adding Color](Adding_Color.htm).
8. Optionally, specify
   a data filter that is always applied to the query. See [Filtering
   the Data Source](Filtering_the_Data_Source.htm).
9. Review the SQL statement.
   When you add tables, columns, custom SQL statements, and filters,
   a SQL statement is built and displayed on the Query tab. See [Viewing the Query](Viewing_the_Query.htm).
10. Test the SQL statement.
    After you finish constructing the data source, test the performance
    of the statement on the Data tab. See [Testing
    the Query](Testing_the_Query.htm).
11. Change the status of
    the data source to Active. See [Activating
    the Data Source](Activating_the_Data_Source.htm).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.htm)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help