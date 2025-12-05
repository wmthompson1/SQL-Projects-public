Using the Reporting Data Loader Service to Load Existing Data




# Using the Reporting Data Loader Service to Load Existing Data

You can use the service to load existing data into the reporting
tables. Use this feature to load existing data during a down-time
for your company, such as over the weekend or later in the evening.

Only the SYSADM user can perform this procedure. The service must
also be installed. See Installing the Visual Reporting Data Loader
Service.

To use the service to load existing data:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Visual Reporting Data.
3. In the Update Type section
   click Service.
4. In the Start Date and
   End Date fields, specify the date range for the information to
   load. Leave both fields blank to load all existing data. To load
   all data after a certain date, specify a date in the Start Date
   field only.
5. In the table, select
   the data types to load. All data types except for VISUAL menu
   are used in the Dashboard metrics. You can use SHIFT+click
   and CTRL+click to select multiple rows.
6. Click Load.
   If you selected Calendar Dates, the service immediately updates
   the reporting tables with calendar date information. For all other
   data types, the service updates the reporting tables when it is
   next scheduled to be run.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Reporting_Database_Tables.htm)
Reporting Database Tables

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Manually_Loading_Existing_Data_into_the_Reporting_Database_Tables.htm) Manually Loading Existing Data into
the Reporting Database Tables

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDBOARDWhat.htm)
What is the Dashboard?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help