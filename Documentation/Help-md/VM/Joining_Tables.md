Joining Tables




# Joining Tables

If you require additional tables, you can add them
to the end of the item list in the appropriate tab. Any user-defined
or custom tables should have primary keys defined so that the join
process can find the primary key automatically.

VISUAL sets up joins automatically for mandatory tables, but does
not permit access to the join for a mandatory table. You must define
the joins for any non-mandatory tables that you add.

To join tables:

1. First select the tab
   to which you want to add the tables. From the table selection
   drop down box, select the table you want to add, then click the
   Add button.

The Join Clause dialog box appears.

2. Click the Data
   button, select the key fields (and any others you require) of
   the table you just added, and click OK.
3. Click the table you
   want to join and click the Join button.
4. Select one of the primary
   key columns on the right table, then select the corresponding
   data element on the left column.

For example, if the Part table is on the
right, and its Primary Key, ID, is selected, you should find a column
(choose 1 if 1 is not taken, else choose 2, and so on), containing
the Part ID on the left, such as CUST\_ORDER\_LINE.PART\_ID.

5. Click the appropriate
   number button to number the column, then click the Set
   button.

The join clause must include all the fields
that make up the primary key.

6. Click Ok.

The table is now joined.

The user-defined table is an advanced feature
of VMDI. In most cases, you will not need this feature.

Take care when selecting the join keysan
incorrect join can cause data inconsistencies in your .VDI files.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help