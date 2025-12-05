Importing Forecasts With the MLT Format




# Importing Forecasts With the MLT Format

To import a forecast using the MLT format:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use for importing or exporting forecasts. If you are licensed
   to use a single site, this field is unavailable. Perform this
   step in the Material Planning Window, before you access the Import/Export
   part forecast dialog box.
2. Open the Import/Export
   Forecast dialog box. Perform one of these steps:

* Select File, Import/Export Forecast.
* From the Master
  Production Schedule dialog box, click the Import/Export
  Forecast button.

3. In the Action section,
   click Import.
4. Click the Path
   button and select the file to import.
5. Specify this information:

Forecast ID
Specify a name for the forecast. You cannot import a forecast without
specifying a name. In the Standard mode, the forecast name is not
used.

Warehouse ID
If the forecast applies to a particular independently planned warehouse,
specify the warehouse ID. If the forecast applies to all universally
planned warehouses, specify Universal.

Import Destination
Select where to add the imported information. Click one of these
options:

Import to forecast table
Click this option to import the information into the Forecast portion
of the table in the Master Production Schedule dialog box. The information
is imported into the DEMAND\_FORECAST table in your database.

Import to master schedule
table Click this option to import the information into the
Schedule portion the table in the Master Production Schedule dialog
box. The information is imported into the MASTER\_SCHEDULE table in
your database.

Import to both
Click this option to import the forecast into both the forecast table
and master schedule table.

Purge Prior Data
To remove all existing data from the tables you selected, select
this check box. To retain existing information, clear this check box.
If you clear this check box, existing forecast information will be
overwritten if the imported forecast uses the same dates as the existing
forecast. For example, if the Master Production Schedule contains
data for October 15 for a particular part, and the data you import
also contains data for October 15, then the data you import overwrites
the existing data.

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