What is the Dashboard?




# What is the Dashboard?

Use the Dashboard to display a wide variety of key performance metrics.
You can create your own metrics or use predefined system metrics.

Over 40 system metrics are included with VISUAL. These metrics show
information about sales, purchasing, and production. You can customize
system metrics to show information for the parts, customers, vendors,
and so on, that are most important to you.

Two types of metrics are used: analytics and detail grids. Analytics
are displayed as a pie chart, vertical bar graph, horizontal bar graph,
or line graph. They provide you with a snapshot view of data, and
you can compare information in different time periods, for different
customers, for different vendors, and so on. Detail grids list information
you can use to analyze information about your business. You can access
detail grids from an analytic, and you can also display detail grids
independently. You can sort the information in the grid by any of
the columns and drill to a related document.

If the system metrics do not meet your needs, [you
can create your own metrics](Custom_Metrics.htm). When you create your own metrics,
you first create a [data source](About_Data_Sources.htm).
A data source is a SQL statement that extracts the information that
you want to include in your metrics. After you build the data source,
you create the [analytic](About_Analytics.htm) or [detail
grid](About_Detail_Grids.htm). You can share your custom metric with others.

Analytics and detail grids read information from VISUAL [reporting
database tables](Reporting_Database_Tables.htm). Before you can build analytics and grids, you
must first load information into the database tables. After you load
your existing data into the tables, you can decide how to update the
tables when new changes are made to your database. You can manually
load new information into these tables periodically, you can load
new information into the tables as new transactions and other information
are saved in the database, or you can use the VISUAL Reporting Data
Loader Service to update the tables.

You can set up Dashboards at the accounting entity level only. When
you set up the Dashboard, you select the entity to view.

On most analytics and detail grids, you can apply filters. Generally,
you can filter the information by date and by site. Depending on the
analytic or detail grid, you can apply other filters. For example,
you can filter the Open Accounts Receivable analytic by a particular
customer, a particular sales rep, or both.

Information about your Dashboard is stored in the database, so you
can access your Dashboards from any work station.

To access the dashboard, select File,
Dashboard. You must be running the main
VISUAL executable (VM.exe) to access the Dashboard.

See these topics:

* [Reporting
  Database Tables](Reporting_Database_Tables.htm)
* [Setting
  Up A Dashboard](Setting_Up_A_Dashboard.htm)
* [Analytics](Analytics.htm)
* [Detail
  Grids](Detail_Grids.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help