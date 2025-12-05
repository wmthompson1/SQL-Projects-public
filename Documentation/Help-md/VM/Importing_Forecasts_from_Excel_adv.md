Importing Forecasts from Excel




# Importing Forecasts from Excel

Use the Export/Import Forecasts dialog box to import part forecasts
from Excel.

To successfully import information from an Excel file, you must
first determine the layout of your Excel file. If your Excel file
contains one row for each part ID, then your Excel file is in the
Transposed layout. You must select the Transposed check box before
importing the file. If your Excel file contains one row for each part
ID/planning period combination, then your Excel file is in the Standard
layout. You must clear the Transposed check box before importing the
file.

If your Excel file uses the Transposed layout, then the file must
meet this criteria before it can be imported:

* The file must contain the
  correct headings in the correct order. The first heading must
  be Part ID. The second heading must be Part Description. The remaining
  headings must be planning period dates. In Excel, the planning
  period headings must use the Date number format category and the
  \*3/14/2001 number type. To see the correct format, you can export
  a forecast using the Transposed layout to Excel first.
* The file must use correct
  Part IDs. The part ID in the spreadsheet must match the part ID
  in your database. If the part ID in the spreadsheet does not match
  a part ID in your database, the information is not imported.
* The file must contain no
  duplicate dates for the same part ID. This causes an error when
  saving to the database.

In an Excel spreadsheet created in the Transposed layout, you can
edit the forecast quantity and the Required/Want Date column headers.
You can also edit the Part Description in the spreadsheet, but the
edited description will not be imported into your database.

If your Excel file uses the Standard layout, then the file must
meet this criteria before it can be imported:

* The file must contain the
  correct headings in the correct order and format. Use these headings
  in this order: Part ID, Description, Required/Want Date (m/dd/yyyy
  format), and Quantity. To see the correct format, you can export
  a forecast to Excel first.
* The file must use correct
  Part IDs. The part ID in the spreadsheet must match the part ID
  in your database. If the part ID in the spreadsheet does not match
  a part ID in your database, the information is not imported.
* The file must contain no
  duplicate dates for the same part ID. This causes an error when
  saving to the database.

In an Excel spreadsheet created in the Standard layout, you can
edit the Required/Want Date and Quantity. You can also edit the Description
in the spreadsheet, but the edited description will not be imported
into your database.

To import a forecast:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site to use for importing or exporting forecasts.
   If you are licensed to use a single site, this field is unavailable.
2. Select File,
   Planning Forecast or File,
   Master Production Schedule.
3. Click the Excel
   Export/Import forecast button.
4. Select the Import
   tab.
5. Specify the information
   to import. Specify this information:

Forecast ID
Specify an ID for this forecast. If you specify an ID that is already
in use, the information you specify in the table overwrites the existing
information.

Warehouse ID
If the forecast applies to a particular independently planned warehouse,
specify the warehouse ID. If the forecast applies to all universally
planned warehouses, specify Universal.

Import To Select
where to add the imported information. Click one of these options:

Import to forecast table
Click this option to import the information as a forecast into the
Planning Forecast dialog box and the Master Production Schedule dialog
box. If you specified a new forecast ID, the ID is inserted as a line
in both dialog boxes. The information is imported into the PLANNING\_FORECAST
table in your database.

Import to master schedule
table Click this option to import the information into the
master production schedule. When you select this option, the Current
MPS line in the Master Production Schedule table is overwritten with
the imported information. The information is imported into the MASTER\_SCHEDULE
table in your database.

Import to both
Click this option to import the information as a forecast and as the
master production schedule.

Purge Prior Data
To remove all existing data from the tables you selected, select
this check box. To retain existing information, clear this check box.
If you clear this check box, existing information will be overwritten
if the imported information uses the same dates as the existing information.
For example, if the Master Production Schedule contains data for October
15 for a particular part, and the data you import also contains data
for October 15, then the data you import overwrites the existing data.

6. Specify the layout of
   your Excel file. If your Excel file uses one row for each part
   ID and one column for each planning period, then the file uses
   the Transposed layout. Select the Transposed
   check box before importing the file. If your Excel file uses one
   row for each part ID/planning period combination, then the file
   uses the standard layout. Clear the Transposed
   check box before importing the file.
7. Click the Import
   from Excel button.
8. Select the Excel file
   containing the forecast, and then click Open.
   The information is inserted in the forecast table in the dialog
   box.
9. To edit the forecast,
   clear the Transposed check box. Then,
   modify the Required/Want Date and Quantity line in the forecast
   table.
10. Click the Save
    button to save the information to your database. The information
    is inserted into the tables you specified in the dialog box header.
11. Click the Close
    button.

When you view imported information in either the Master Production
Schedule or Planning Forecast dialog box, your current planning calendar
is used for the planning periods. The quantities you import are combined
if necessary and placed in the planning calendar periods.