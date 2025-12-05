What is the DBR Scheduling Service




# What is the DBR Scheduling Service?

You can use the DBR Scheduling Service to run the DBR Scheduler
automatically on the days and times you specify. If you have multiple
sites and would like to run the service for all sites, then you must
install the service once for each site.

To specify when to run the service, use the Set as Scheduled dialog
in the DBR Scheduler. You can use the service to run the DBR scheduler
up to six times a day. You also specify the standard settings to use
to run the schedule, such as whether to preserve the previous schedule
and whether to delay work orders when material requirements are not
available.

You can set up one run schedule for each schedule ID in the DBR
Scheduler window. Any user that has access to the Set as Scheduled
dialog in the DBR Scheduler window can edit the run schedule for a
schedule ID. The system administrator can control which users have
access to the Set as Scheduled dialog.

After the service is installed and the service schedule is set up,
the database is examined based on the polling interval you specify
to see if a schedule needs to be run. When the service finds a schedule
that needs to be run, the service opens the DBR Scheduler and runs
the schedule based on the settings you specify in the Set as Scheduled
dialog.

If you set up the DBR Scheduling Service, you can still run the
DBR Scheduler manually.

Use the DBR Scheduling Service executable (VMDBRSVC.exe) to perform
these procedures:

* [Installing
  the DBR Scheduling Service](VMDBRSVCfrmMain.htm)
* [Removing
  the DBR Scheduling Service](Removing_the_DBR_Scheduler_Service.htm)

Use the DBR Scheduler window to perform these procedures:

* [Scheduling
  the DBR Scheduling Service](Scheduling_the_DBR_Scheduler_Service.htm)
* [Deactivating
  the DBR Scheduling Service](Deactivating_the_DBR_Scheduler_Service.htm)