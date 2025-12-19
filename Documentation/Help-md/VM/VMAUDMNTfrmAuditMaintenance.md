About the Audit Maintenance Window




# About the Audit Maintenance Window

Use Audit Maintenance to track changes that have been
made to the database.

## Starting the Audit Maintenance Window

Select Admin, Audit
Maintenance.

## Tasks

This table shows the tasks that you can complete in the Audit Maintenance
window:

| Task | Description |
| [Configuring Audit Files](Configuring_Audit_Files.md) | Use this procedure to set up audits of database columns. |
| [Auditing Report Times](Auditing_Report_Times.md) | Use this procedure to set up audits of reports. |
| [Viewing Audit Results](Viewing_Audit_Results.md) | Use this procedure to view the results of audits. |
| [Filtering Audit Results](Filtering_Audit_Results.md) | Use this procedure to filter audit results. |
| [Printing the Audit History Report](Printing_the_Audit_History_Report.md) | Use this procedure to print audit results. |
| [Exporting Audit History Information to Excel or XML](Exporting_Audit_History_Information_to_Excel_or_XML.md) | Use this procedure to export the contents of the Audit Maintenance results table to Excel or XML. |
| [Printing the Report Times Report](Printing_the_Report_Times_Report.md) | If you track report duration, use this procedure to print the results of report audits. |

## Fields

Reporting
Options field

Specify how to export the audit report.

PDF
Format check box

If you select E-Mail in the Reporting Options field, select this
check box to attach a PDF version of the report instead of an RTF
file.

User

Lists the IDs of the users that you selected in the Users table.
The results are filtered to show records that were changed by the
selected users.

Table

Lists the tables that you selected in the Tables table. The results
are filtered to show records for the selected tables.

Column

Use this field to filter the results by column name. Specify a column
name, or click a column name in the results table.

Primary
Key

Use this field to filter the results by primary key value. Specify
a primary key value, or click a Primary key value in the results table.

Start

Use this field to filter the results by date. Results that are on
or after the selected date are displayed. Use this field in conjunction
with the End date field or the Horizon field.

End

Use this field to filter the results by date. Results that are on
or before the selected date are displayed. Use this field in conjunction
with the End date field or the Horizon field.

Horizon

If you do not specify a fixed (Start and End) date range, enter
the total number of days prior to the current system date for which
you want to view changes. If you specify a Start date, the Horizon
indicates the number of days following the Start date for which you
want to view the audit trail. If you enter an End date, the Horizon
indicates the total number of days prior to the End date for which
you want to show audit information.

Use Dates from
Table check box

To replace the Start and End fields with the date of the earliest
record and date of the latest record in the table, select this check
box and then click the Refresh button.

Insert check
box

Select this check box to view the new records that were created

Update check
box

Select this check box to view modifications to existing information.

Delete check
box

Select this check box to view the records that were deleted.

Report
Audit check box

If you are auditing report times, select this check box to show
report times in the results table.

Users table

This table lists the users who have performed the actions that you
are auditing.

Tables
table

The Tables list indicates the database Table names for which you
have defined audit tracking. This information is displayed:

Tables The database
Table name for which you defined tracking.

Audits The total
number of audit records that have occurred for the table. This value
is system-maintained.

Results
table

The audit records that match the selected Filters in the header
of the window. This information is displayed:

Change Date The
date and time when the change to the database table occurred.

Column The database
table column where the change occurred.

Data Type The
table column value is a String (text), Number, or Date.

Action The audit
change type that occurred. The values are Update, Insert, or Delete
action.

Primary Key The
primary key for the record on the database table for which the change
occurred.

Old Value The
value of the table column prior to the change that occurred. If the
row refers to a report and you have selected the Audit Report Times
and Report Audit check boxes, the start time of the report.

New Value The
modified value following the specified change on the table line. If
the row refers to a report and you have selected the Audit Report
Times and Report Audit check boxes, the system inserts the end time
of the report.

[![](btn_mini.gif)](User-defined_Help_Files_-_Audit_Maintenance.md) User-defined Help