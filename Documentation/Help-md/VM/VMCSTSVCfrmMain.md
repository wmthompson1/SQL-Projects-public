About the Costing Service Window




# About the Costing Service Window

You can use the Costing Service to run costing automatically
on the days and times you specify. If you have multiple sites and
would like to run the service for all sites, then you must install
the service once for each site.

To specify when to run the service, use the Costing Service Schedule
dialog in the Costing Utilities window. You can specify one schedule
for running inventory costs options and a separate schedule for preparing
manufacturing journals. You can use the service to run costing up
to six times a day.

You can set up one costing schedule for each site. Users that have
access to the Costing Service Schedule dialog in the Costing Utilities
window can edit the schedule for their allowable sites. The system
administrator can control which users have access to the Costing Service
dialog.

After the service is installed and the service schedule is set up,
the database is examined based on the polling interval you specify
to see if costing needs to be run. When the service finds that costing
needs to be run, the service runs costing based on the settings you
specify in the Set as Scheduled dialog.

If you prepare manufacturing journals with the Costing Service,
you must post the journals manually using the Post Manufacturing Journals
window. The Costing Service does not post manufacturing journals.

If you set up the Costing Service, you can still [run
costing utilities manually](VMAPLUTLfrmApplUtilities.md).

## Tasks

This table shows the tasks that you can complete in the Costing
Utilities window:

| Task | Description |
| [Installing the Costing Service](Installing_the_Costing_Service.md) | Use this task to install the service. |
| [Scheduling the Costing Service](Scheduling_the_Costing_Service.md) | Use this task to schedule when the service is run. |
| [Deactivating the Costing Service Schedule for a Site](Deactivating_the_Costing_Service_Schedule_for_a_Site.md) | Use this task to deactivate the service for a site. |
| [Deleting the Costing Service Schedule for a Site](Deleting_the_Costing_Service_Schedule_for_a_Site.md) | Use this task to delete the service schedule. |
| [Removing the Costing Service](Removing_the_Costing_Service.md) | Use this task to remove the costing service. |

## Fields

Site ID Specify
the ID of the site where you want to run costing with the service.

Log File Directory
Specify where to store the log file for the service.

Polling Interval
Specify how frequently the service should check to see if costing
should be run for the site. Specify the interval in seconds. The maximum
value is 900 seconds. If you specify a value greater than 900, your
value is replaced with 900.

Log Level Specify the level of information
to write to the log file. Click one of these options:

None
To write the time the service started, click this option. This option
is recommended for normal production environments.

Error
To write the time the service started and any error messages, click
this option.

Info
To write to the time the service started, error messages, and additional
information about the service, click this option. The use of this
option is recommended only if you are troubleshooting issues with
the service. When you use this option, the size of the log file grows
quickly.

The log file's name is VMCSTSVC\_[Your Site Name].log. The size of
the log file is limited to 1 MB. When the log file approaches 1 MB,
the log is renamed to VMCSTSVC\_[Your Site Name]\_[Current date time].log,
and a new VMCSTSVC\_[Your Site Name].log is created.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help