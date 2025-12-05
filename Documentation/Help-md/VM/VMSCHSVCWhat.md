What is the Scheduling Service?




# What is the Scheduling Service?

You can use the Scheduling Service to run the Concurrent
Scheduler automatically on the days and times you specify. If you
have multiple sites and would like to run the service for all sites,
then you must install the service once for each site.

To specify when to run the service, use the Set as Scheduled dialog
in the Concurrent Scheduler. You can use the service to run the concurrent
scheduler up to six times a day. You also specify the standard settings
to use to run the schedule, such as the sort order and how to schedule
started work orders.

You can set up a run schedule for one schedule ID per site. If you
attempt to set a run schedule for a second schedule ID in a site,
a message is displayed that states that you are changing the schedule
that is run with the Scheduling Service.

Any user that has access to the Set as Scheduled dialog in the Concurrent
Scheduler window can edit the run schedule for a schedule ID. The
system administrator can control which users have access to the Set
as Scheduled dialog.

After the service is installed and the service schedule is set up,
the database is examined based on the polling interval you specify
to see if a schedule needs to be run. When the service finds a schedule
that needs to be run, the service opens the Concurrent Scheduler and
runs the schedule based on the settings you specify in the Set as
Scheduled dialog.

If you set up the Scheduling Service, you can still run the Concurrent
Scheduler manually.

Use the Scheduling Service executable (VMSCHSVC.exe) to perform
these procedures:

* [Installing
  the Scheduling Service](VMSCHSVCfrmMain.htm)
* [Removing
  the Scheduling Service](Removing_the_Scheduling_Service.htm)

Use the Concurrent Scheduler window to perform these procedures:

* [Scheduling
  the Scheduler Service](Scheduling_the_Scheduler_Service.htm)
* [Deactivating
  the Service](Deactivating_the_Service.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help