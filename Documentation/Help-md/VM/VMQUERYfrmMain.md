Creating a Query




# Creating a Query

If you know the SQL Query you want to use,
you can manually type it into the Query Input field.

If you are unsure of the syntax or format to use for your SQL Query,
you can use the Query Tools built-in functionality to help you write
the query.

To use built-in functionality to write a query:

1. Select Admin,
   Query Tool.
2. In the Database Tables
   and Columns field, find the table that contains the column that
   you want to add to your query. To find the table, use the Table
   Search field. Enter all or a portion of the table name, then click
   the Search button. The list of tables is filtered based on your
   search criteria.
3. Add a column from the
   database table to your query. To add the column, perform one of
   these steps:
4. Double-click
   the column name
5. Drag and drop
   the column name to the Query field

To select multiple columns, hold down the
CTRL key and click the column names. Then, drag and drop the columns
to the Query field.

After you add columns to the Query field,
these actions occur:

* The column
  that you selected is added to the Query field. The SELECT SQL
  command is written automatically.
* The table
  that you selected is added to the Join Tables field.
* The list of
  tables in the Database Tables and Columns field is updated to
  show only those tables that can be joined to the first table you
  selected. A table can be joined if it shares a piece of data in
  common with the first table that you selected. For example, you
  can join the CUSTOMER\_ORDER table to the CUSTOMER table because
  they share the customer ID as a piece of data.

The data that the two tables share in common
is displayed after the table name.

Some tables are displayed in blue text,
and other tables are displayed in red text. If a table name is displayed
in blue text, then the table in the Join Tables field contains a foreign
key reference to the table. If a table name is displayed in red, then
the table displayed in red contains a foreign key reference to the
table in the Join Tables field.

4. Optionally, add a column
   from a second table to your query.

1. Specify how to join the second table
   to the first table:

To use an inner join, clear the Left Outer
Join check box.

To use a left outer join, select the Left Outer
Join check box.

If you do not want the join statement to be
written for you automatically, select the No Auto Joining check box.

2. Add columns from the second table to
   the query.

5. Optionally, specify
   column aliases. If you specify column aliases, the aliases are
   used as the column headers in the query results table. To specify
   a column alias, specify the alias to use in double quotation marks
   after the column. For example, if your query included CUSTOMER.ID,
   and you wanted to use Customer Identification as the column name,
   you would specify Customer Identification after CUSTOMER.ID.
6. To add other SQL commands
   to your query, use the SQL Command list. Select a command from
   the list to add it to your query. See [SQL
   Commands](SQL_Commands.htm).
7. To construct the statement
   as a single line, select the singe line sql
   statement check box.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Admin_Guide.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMQUERYWhat.htm)
What is the Query Tool?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Displaying_Query_Results_Outside_of_the_Query_Tool.htm) Displaying Query Results Outside of
the Query Tool

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](BrowsefrmBrowse.htm)
Advanced searches using wildcards and operators