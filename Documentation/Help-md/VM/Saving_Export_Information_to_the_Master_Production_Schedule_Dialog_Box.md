Saving Export Information to the Master Production Schedule Dialog Box




# Saving Export Information to the Master Production Schedule Dialog Box

After you build the export information, you can insert the information
to the Master Production Schedule dialog box. To insert the information:

1. Build the [export
   information](Exporting_Forecasts_to_Excel_std.htm).
2. Click the Import
   tab.
3. Specify this information:

Warehouse ID
To import the information as a forecast for a particular independently
planned warehouse, specify the warehouse ID. To import the information
to your universally planned warehouses, specify Universal.

Import To Specify
where to import the information. Click one of these options:

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

4. To edit the forecast,
   clear the Transposed check box. Then,
   edit the Required/Want Date and Quantity fields. You can edit
   this information on either the Export or the Import tab.
5. Click the Save
   button. The information is imported into the Master Production
   Schedule dialog box.