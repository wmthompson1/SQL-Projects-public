Filtering Audit Results




# Filtering Audit Results

When you open the Audit Maintenance window, changes
made to tracked tables in the last 14 days are shown by default. Use
the filters to view a different set of results. You can filter by
date, user, table, column, and primary key. You can also filter by
action type or choose whether to view

information about reports.

1. Select Admin,
   Audit Maintenance.
2. Set filters:

User To view
results for a single user, click the user in the Users table. The
name of the user is shown in the User field in the Filter section.
The results displayed are limited to only the selected user. To clear
the User value and view results for all users, click the Reset button
to the right of the field.

Table To view
results for a single table, click the table in Tables table. The name
of the table is shown in the Table field in the Filter section. The
results displayed are limited to only the selected

table. To clear the Table value and view
results for all tables, click the Reset button to the right of the
field.

Column To view
results for a single Column, click the column in the Results table.
The name of the column is shown in the Column field in the Filter
section. To clear the Column value and view results for all columns,
click the Reset button to the right of the field.

Primary Key
To view results related to a particular primary key. click the primary
key in the Results table. The name of the primary key is shown in
the Primary Key field in the Filter section. To clear the primary
key value and view results for all primary keys, click the Reset button
to the right of the field.

Date/Time Range
Use the Start, End, and Horizon fields to filter the audit results
by date and time. You can specify a date range by specifying Start
and End dates, by using the Start date with the Horizon, by using
the End date with the Horizon, or by using the Horizon only.

When you select a date in the Start or End
fields, 12:00:00 AM is inserted as the time. You can change the time
as needed.

Start To view
information for a specific date range, such as the past week or last
two months, specify the first date in the range in this field. Click
the Calendar button and select a date. Change the start time if necessary.

To complete the date range, either specify
an end date and time or a horizon. If you specify a horizon, the horizon
value is added to the start date to determine the date range. For
example, if you specified a start date of January 10, 2012 and a horizon
of 14 days, changes made between January 10, 2012 and January 24,
2012, inclusive, are shown in the results table.

End Use the
End field to specify the last date in a specific date range. Click
the Calendar button and select a date. Change the end time if necessary.

If you specified a date in the Start field,
changes made between the start date and end date, inclusive, are shown
in the table. If you specified a horizon, the horizon value is subtracted
from the end date to determine the date range. For example, if you
specified an end date of January 15, 2012 and a horizon of 14 days,
changes made between January 1, 2012 and January 15, 2012, inclusive,
are shown in the results table.

Horizon If you
do not specify a date in the Start and End fields, the value you specify
in the Horizon field is subtracted from the current date to determine
the date range.

Use Dates from Table
To replace the Start and End fields with the date of the earliest
record and date of the latest record in the table, select this check
box and then click the Refresh button.

Insert To view
records added to tables, select this check box.

Update To view
changes made to existing records, select this check box.

Delete To view
records removed from the database, select this check box.

Report Audit
To view the reports that were generated, select this check box. If
you have also selected the Audit Report Times check box, the reports
run on the database, the time the reporting process began, and the
time the reporting process stopped are shown.