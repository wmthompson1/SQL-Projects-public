Scheduling the MRP Service




# Scheduling the MRP Service

After you install the MRP Service, specify when the
MRP Service should be prompted to run MRP for a site.

You can set up separate schedules for processing all top level parts
and for processing parts changed since the last MRP run. To edit the
schedule for a site, a user must have permission to access the site
and the Material Requirements Planning Service Schedule dialog.

To schedule the MRP Service:

1. Select Inventory,
   Material Planning Window.
2. In the site ID field,
   select the site where you will run MRP with the service. Make
   sure you select a site for which you have installed the MRP Service.
3. Select File,
   Material Requirements Planning Service Schedule.
   The ID of the site you selected is displayed in the title bar
   of the dialog.
4. Specify the settings
   to use when MRP is run. The settings you can specify are the same
   settings you can select if you run MRP manually. See [Running
   Material Requirements Planning Manually](Using_Material_Requirements_Planning.htm).
5. Specify when the service
   is active. Specify this information:

Start Date Specify
the date that the service should start checking to see if MRP needs
to be run. Leave this field blank or specify todays date if you do
not want to delay the start of the service.

End Date Specify
the last date that the service should check to see if MRP needs to
be run. Leave this field blank if you do not want to set up an expiration
date for the service.

Enabled To use
the service with the selected site, select this check box. To stop
using the service, clear this check box.

Delay for Scheduling
To prevent MRP from running while the concurrent scheduler is running,
select this check box. To allow MRP to be run when the concurrent
scheduler is running, clear this check box.

6. In the Process All Top
   Level Parts (Regeneration) section, specify when to prompt the
   service to run MRP for all parts. Specify this information:

Days of Week
Specify on which days to run MRP using the service.

Run At Specify
the times of day that the service should check to see if a full regeneration
of MRP needs to be run. The times you specify apply to all days that
you run the service for journal preparation. You can run the service
up to 6 times a day. If you select a day in the Days of Week section
but leave all Run At fields blank, then the service is run at 12:00
AM on the days you selected.

7. In the Process Parts
   Changed Since Last Run (Net Change), specify when to prompt the
   service to run MRP for parts that have been changed since the
   last MRP run. Specify this information:

Days of Week
Specify on which days to run MRP using the service.

Run At Specify
the times of day that the service should check to see if MRP needs
to be run for net changes. The times you specify apply to all days
that you run the service for journal preparation. You can run the
service up to 6 times a day. If you select a day in the Days of Week
section but leave all Run At fields blank, then the service is run
at 12:00 AM on the days you selected.

8. Click Save.

Depending on the polling interval that was specified when the service
was installed, MRP might not be run exactly at the time you specify.
At the times that you specified, MRP is flagged as needing to be run.
MRP is started when the MRP service polls the database and finds that
MRP needs to be run. When you specify a time, MRP could be run at
any time between the time that you specify and the time that you specify
plus the polling interval. For example, if you specify 7:00:00 as
the start time and the polling interval is 600 seconds, then MRP is
started sometime between 7:00:00 and 7:10:00.