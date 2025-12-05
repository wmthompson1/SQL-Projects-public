Exporting Forecasts to Excel




# Exporting Forecasts to Excel

To export a forecast:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
2. Select File,
   Master Production Schedule.
3. Click the Excel
   Export/Import forecast button.
4. Click the Export
   tab.
5. Specify the information
   to export to an Excel file. Specify this information:

From Part ID/To Part
ID To select a single part or range of parts, use the From
Part ID and To Part ID fields. Click the browse buttons and select
the parts with which to begin and end the export. To export information
for a single part, specify the same part ID in both the From Part
ID and to Part ID fields. To export all parts, leave both fields blank.

Product Code
To export information for parts with a particular product code, specify
the product code in this field.

Starting and Ending Dates
Click the Start Date and End Date calendar buttons and select the
dates to use for the forecast export. Usage over the time period you
specify is included in the report.

Use active calendar
If you are not licensed to use the Advanced mode of the Material
Planning window, then this check box is unavailable. You must specify
your own planning size. If you are licensed to use the Advanced mode
of the Material Planning window and you have set up a planning calendar,
select this check box to use the currently active calendar to determine
the size of the planning periods. See [Creating
a Planning Calendar](Creating_a_Planning_Calendar.htm).

Planning size
If you did not select the Use active calendar check box, specify
the size of each planning period for the date range you specified.
Specify a value from 1 to 31. If you selected the Use active calendar
check box, then the planning size specified on the current planning
calendar is inserted.

The value in this field is used to calculate
the Required/Want date column. It also determines how many rows are
inserted into the table. A row is added to the table for each whole
planning period within the date range you specified in the Start Date
and End Date fields. A row is added only if a whole planning period
can be inserted. For example, if you specified January 1 as the start
date and February 15 as the end date, and your planning size is 15,
then three lines would be added to the table. The first line would
have a Required/Want date of January 15. The second line would have
a Required/Want date of January 30. The third line would have a Required/Want
date of February 14. A fourth line would not be added because only
one day remains in the time range you specified.

If you specified your own value in the planning
size field, or your planning calendar does not use monthly periods,
then the value in this field is added to the start date to determine
the first planning period. For example, if you specified January 1
as the start date, and your planning size is 15, then the first planning
period ends on January 15. The second planning period ends on January
30.

If you did select the Use active calendar
check box and your planning calendar uses monthly periods, then monthly
planning periods are used. If your start date is the 28th day of the
month or later, then the following month is considered to be the first
planning period. For example, if you specified January 29 as the start
date, then the first planning period would be February 1 through February
28th. If your start date is the 27th day of the month or earlier,
then the start date of the planning period is the 27th, and the end
date of the period is the 26th of the following month. For example,
if you specified January 15 as your start date, then the first planning
period begins on January 15 and ends on February 14.

Calendar # - If
you selected the Use active calendar check box, the ID of the current
planning calendar is inserted.

Export Specify
the types of transactions to use to calculate the forecasted quantity.
Select these options:

* Shipments
* Issues
* Adjustments
  out

Adjustment by
Specify the types of transactions to use to adjust the quantity.
Select these options:

* Shipments
  Rtns
* Issue Rtns
* Adjustments
  in

6. Click the Begin
   button. The information you selected is inserted into the table.
7. To edit the information
   in the table, clear the Transpose check
   box. Then, edit the Required/Want Date and Quantity as necessary.
8. Use the Transposed check
   box to select the layout for the Excel file. If you select the
   Transposed check box, then one row is exported for each part and
   one column is exported for each planning period. For example,
   if you are exporting planning information for 12 planning periods
   for a single part, then the Excel spreadsheet would contain one
   row for the part. The spreadsheet would also contain one column
   for the part ID, one column for the part description, and 12 columns
   for the planning periods. If you clear the Transposed check box,
   then one row is exported for each part/planning period combination.
   For example, if you are exporting planning information for 12
   planning periods for a single part, then the Excel spreadsheet
   would contain 12 rows: one row for each part/planning period combination.
   The spreadsheet would also include columns for Part ID, Description,
   Required/Want Date and Quantity.
9. To export all rows in
   the table, click the Send to Excel button.
   To export specific rows, select the rows and then click the Send to Excel button. After you click Send
   to Excel, an Excel file is opened, populated with the information
   that you selected.

To exit the dialog, click the Close
button.