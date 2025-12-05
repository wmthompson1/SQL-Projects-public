Saving Export Information as the Forecast or the Master Production Schedule




# Saving Export Information as the Forecast or the Master Production Schedule

After you build the export information, you can save the information
as a forecast, as the master production schedule, or both. To save
the information:

1. Build the [export
   information](Exporting_Forecasts_to_Excel_adv.htm).
2. Click the Import
   tab.
3. Specify this information:

Forecast ID
Specify an ID for this forecast. If you specify an ID that is already
in use, the information you specify in the table overwrites the existing
information.

Warehouse ID
To import the information as a forecast for a particular independently
planned warehouse, specify the warehouse ID. To import the information
to your universally planned warehouses, specify Universal.

Import To Specify
where to import the information. Click one of these options:

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
If you clear this check box, existing forecast information will be
overwritten if the imported information uses the same dates as the
existing information. For example, if the Master Production Schedule
contains data for October 15 for a particular part, and the data you
import into the master schedule table also contains data for October
15, then the data you import overwrites the existing data.

4. To edit the forecast,
   clear the Transposed check box. Then,
   edit the Required/Want Date and Quantity fields. You can edit
   this information on either the Export or the Import tab.
5. Click the Save
   button. The information is imported into the locations you specified.

When you view imported information in either the Master Production
Schedule or Planning Forecast dialog box, your current planning calendar
is used for the planning periods. The quantities you import are combined
if necessary and placed in the planning calendar periods.