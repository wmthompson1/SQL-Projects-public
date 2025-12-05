Importing Forecasts with the MLT Format




# Importing Forecasts with the MLT Format

To import a forecast using the MLT format:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site to use for importing or exporting forecasts.
   If you are licensed to use a single site, this field is unavailable.
   Perform this step in the Material Planning Window, before you
   access the Import/Export part forecast dialog box.
2. Open the Import/Export
   Forecast dialog box. Perform one of these steps:
3. Select File, Import/Export Forecast.
4. From the Master
   Production Schedule dialog box, click the Import/Export
   Forecast button.
5. From the Planning
   Forecast dialog box, click the Import/Export
   Forecast button.

3. In the Action section,
   click Import.
4. Click the Path
   button and select the file to import.
5. Specify this information:

Forecast ID
Specify a name for the forecast. You cannot import a forecast without
specifying a name. If you specify an existing ID, the existing information
is overwritten with the imported information.

Warehouse ID
If the forecast applies to a particular independently planned warehouse,
specify the warehouse ID. If the forecast applies to all universally
planned warehouses, specify Universal.

Import Destination
Select where to add the imported information. Click one of these
options:

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
For example, if you are importing data into the Master Production
Schedule dialog box that includes information for October 15, and
the Master Production Schedule dialog box already contains information
for October 15, then the data you import overwrites the existing data.

6. Click the appropriate
   period option:

Beginning of Period
If you are importing a forecast in the middle of a period, click
this option to roll back to the beginning of the period. For example,
for monthly imports, if you are importing a file on the 5th of the
month, click this option to use the 1st of the month as the beginning
of the period.

End of Period
If you are importing a forecast in the middle of a period, click
this option to use the end of the period when importing dates. For
example, for monthly imports, if you are importing a file on the 15th
of the month, click this option to use the 31st of the previous month
as the end of the period.

7. Click the Begin
   button.

VISUAL imports the forecast information to the appropriate tables.