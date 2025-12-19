Reporting Database Tables




# What are Reporting Database Tables?

The Dashboard uses the reporting database tables to generate analytics
and detail grids. Before you can view these metrics, you must load
data into the reporting database tables.

To load data into the tables:

1. Load existing data into
   the tables. You can [manually
   load](Manually_Loading_Existing_Data_into_the_Reporting_Database_Tables.md) existing data or use the [reporting
   service](Using_the_Reporting_Data_Loader_Service_to_Load_Existing_Data.md) to load existing data. You can limit the existing
   data you load by date.
2. Decide how to update
   the tables when new information is added. You can [manually
   update the data](Updating_the_Reporting_Database_Tables_Manually.md), [update
   the data automatically](Using_Live_Updates_to_Update_the_Reporting_Database_Tables.md) any time you change the VISUAL database,
   or [use a service to update the data](VRDTASVCWhat.md).

If you load your data manually, you can
control when the update occurs. Loading the data manually offers you
the most control over the data you load. You can choose to load only
certain types of data, and you can use a date range to restrict the
amount.

If you perform live updates of your data,
then the reporting tables are always up to date with the latest information.
Depending on the size of your database and the number of users, updating
the data automatically may result in performance issues.

If you use a service to update the data,
you specify when the reporting tables should be updated. You can specify
a certain time of day to update the reporting tables, or you can specify
how frequently to check for updates. When you use the service, each
time a transaction is created, updated or deleted, a record is written
to the SOA\_DOC\_SYNC table. When the service is run, the service checks
this table to locate the information to update.

See these topics:

* [Manually
  Loading Existing Data into the Reporting Database Tables](Manually_Loading_Existing_Data_into_the_Reporting_Database_Tables.md)
* [Using
  the Reporting Data Loader Service to Load Existing Data](Using_the_Reporting_Data_Loader_Service_to_Load_Existing_Data.md)
* [Updating
  the Reporting Database Tables](Updating_the_Reporting_Database_Tables.md)
* [What
  is the Visual Reporting Data Loader Service?](VRDTASVCWhat.md)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDBOARDWhat.md)
What is the Dashboard?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.md) User-defined Help