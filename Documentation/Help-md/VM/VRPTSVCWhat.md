What is the Reporting Service?




# What is the Reporting Service?

You can use the Reporting Service to print work order
travellers and picklists on the days and time you specify.

After you install the service, use the Set as Scheduled dialog in
the Work Order Traveller window to specify when to print work order
travellers and picklists. Any user who has permission to use the Set
as Scheduled dialog can schedule work order traveller print jobs.
You can use the service to print travellers and picklists once per
day.

Print job schedules are saved by user. Each user can have one print
job per allowable site. The system administrator can control a users
access to the Set as Scheduled dialog in Security Maintenance.

When you set up information in the Set as Schedule dialog, you set
it up at the site level. If you use the service, your print job can
only include travellers and picklists for a single site. When you
use the service, you cannot combine multiple sites in a single print
job.

After the service is installed and the service schedule is set up,
the database is examined based on the polling interval you specify
to see if a travellers and picklists need to be printed. When a print
job is found, the service opens the Work Order Traveller window and
prints the travellers and picklists based on the settings you specify
in the Set as Scheduled dialog.

You can install the service once per database.

If you set up the Reporting Service, you can still print travellers
and picklists manually.

Use the Reporting Service executable (VRPTSVC.exe) to perform these
procedures:

* [Installing
  the Reporting Service](VRPTSVCfrmMain.htm)
* [Removing
  the Reporting Service](Removing_the_Reporting_Service.htm)

Use the Work Order Traveller window to perform these procedures:

* [Scheduling
  the Service](Scheduling_the_Service.htm)
* [Deactivating
  the Reporting Service Schedule](Deactivating_the_Reporting_Service.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Traveller.htm) User-defined Help