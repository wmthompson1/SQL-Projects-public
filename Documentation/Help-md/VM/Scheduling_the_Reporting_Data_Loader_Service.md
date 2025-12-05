Scheduling the Reporting Data Loader Service




# Scheduling the Reporting Data Loader Service

Only the SYSADM user can perform this procedure.

To update the reporting tables based on the schedule you specify,
you must also install the Reporting Data Loader Service. See [Installing
the Visual Reporting Data Loader Service](VRDTASVCfrmMain.htm).

To schedule the service:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Visual Reporting Data....
3. In the Update Type section,
   click Service.
4. Use the Service Schedule
   section to specify when the service is active. Specify this information:

Start Date Specify
the date that the service should start checking for updates. Leave
this field blank or specify todays date if you do not want to delay
the start of the service.

End Date Specify
the last date that the service should check for updates. Leave this
field blank if you do not want to set up an expiration date for the
service.

Enabled To use
the service, select this check box. To stop using the service, clear
this check box.

5. In the Run Type section,
   specify whether the service continually checks for updates on
   the days you specify or checks for updates only at specified times.
   Click one of these options:

Immediate To
indicate that the service should continually check for updates on
the days you specify, click this option. When you click this option,
the polling interval specified when the service was installed is used
to determine how frequently the service checks for updates. For example,
if 600 was specified as the polling interval, then the service checks
for updates every 600 seconds (10 minutes).

Weekly To indicate
that the service should check for updates only on the days and times
you specify, click this option. When you click this option, the Run
At fields become active.

6. In the Days of Week
   section, specify the days of the week to run the service.
7. The Run At section is
   available only if you clicked Weekly in the Run Type section.
   Use the Run At section to specify the times of day that the service
   should check for updates. The times you specify apply to all days
   that you run the service. You can run the service up to 6 times
   a day.

Depending on the polling interval that was
specified when the service was installed, the Reporting Data Loader
might not be run exactly at the time you specify. At the times that
you specified, the Reporting Data Loader is flagged as needing to
be run. The Reporting Data Loader is started when the Reporting Data
Loader Service polls the database and finds that the Reporting Data
Loader needs to be run. When you specify a time, the Reporting Data
Loader could be run at any time between the time that you specify
and the time that you specify plus the polling interval. For example,
if you specify 7:00:00 as the start time and the polling interval
is 600 seconds, then the Reporting Data Loader is started sometime
between 7:00:00 and 7:10:00.

8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VRDTASVCWhat.htm)
What is the Visual Reporting Data Loader Service?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDBOARDWhat.htm)
What is the Dashboard?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.htm) User-defined Help