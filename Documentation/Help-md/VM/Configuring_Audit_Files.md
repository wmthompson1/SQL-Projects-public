Configuring Audit Files




# Configuring Audit Files

Before you can track information throughout VISUAL, you must tell
the system you want to track it. To do so, use the Audit Configuration
window.

To specify the information to track:

1. Select Admin,
   Audit Maintenance.
2. From the Audit Maintenance
   window, select File, Configure
   Auditing.

To build the list of tables that can be
audited, all database tables are read. This process may take a few
minutes.

The
left side of the Audit Configuration window includes a list of all
tables within your VISUAL applications. The right side of the window
displays all table columns for which you have configured tracking.
If you have not yet configured audit tracking, the table appears blank.

For any database table that has unsaved
configuration(s) within the Audit Configuration window, the tables
icon on the left pane appears in red.

3. To add a table to the
   Audit Configuration table, click the table name in the left pane.

The table name and column names are shown
in the Audit Configuration table. If a column is a primary key, the
Primary Key check box is selected. The type of data and length of
the column is shown in the Data Type field.

4. To track a column, select
   the Tracked check box. To track all
   columns, click the Select All Columns button.
5. Specify the actions
   to track. When you select the Tracked check box, the Insert, Update,
   and Delete check boxes are selected by default. Select or clear
   these check boxes:

Insert Select
this check box to track when users add data in this column. Clear
the Insert check box if you do not want to track when users add data
in this column.

Update Select
this check box to track when users edit data in this column. Clear
the Update check box if you do not want to track user edits.

Delete Select
this check box to track when users delete data in this column. Clear
the Delete check box if you do not want to track user deletions.

6. To save the configuration
   for the current table, click the Save [table\_name]
   button. The name of the table is shown in the tool tip for the
   Save button. To save the configuration for all tables, click the
   Save All Tables button. Your configurations
   are written to the HISTORY\_DEFINITION table.
7. To complete the configuration,
   write the database triggers. To write the triggers for the current
   table only, click the Write Triggers for [table\_name]
   button. The name of the table is shown in the tool tip for the
   Write Triggers button. To write the triggers for all tables, click
   the Write All Triggers button.

[![](btn_mini.gif)](User-defined_Help_Files_-_Audit_Maintenance.md) User-defined Help