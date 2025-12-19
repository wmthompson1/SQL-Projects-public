Scheduling the Reporting Service




# Scheduling the Reporting Service

After you install the Reporting Service, specify when
the Reporting Service should be prompted to print travellers and picklists.
Also specify the information to print.

Schedules are save by user. Each user can have as many print schedules
as they need. When you set up a schedule, you must select only one
site in the Site ID field. To print travellers for multiple sites
using the service, you must set up a separate schedule for each site.

To schedule the Reporting Service:

1. Select Eng/Mfg,
   Work Order Travellers.
2. In the Site ID field,
   specify the site for which to print travellers or picklists. You
   must select one site only. If you select multiple sites, the Set
   as Scheduled menu option is not active.
3. In the Work Order Traveller
   window, specify the settings to use for the print job. For information
   about the settings, see [Printing
   Travellers and Picklists](VMTRVRPTfrmPrintTravellers.md).
4. Select File,
   Save as Scheduled.
5. Specify when the service
   is active. Specify this information:

Start Date Specify
the date that the service should start checking for updates. Leave
this field blank or specify todays date if you do not want to delay
the start of the service.

End Date Specify
the last date that the service should check for updates. Leave this
field blank if you do not want to set up an expiration date for the
service.

Enabled To use
the service with the selected schedule, select this check box. To
stop using the service, clear this check box.

5. In the Run Type section,
   weekly is selected. You cannot change this selection. This selection
   indicates that the service should check for print jobs only on
   the days and times you specify.
6. In the Days of Week
   section, specify the days of the week to run the service.
7. Use the Run At section
   to specify the time of day that the service should check for updates.
   The time you specify apply to all days that you run the service.

The service may not run exactly at the time
you specify. The service is prompted to check for print jobs at the
time you specify, but the polling interval specified for the service
may pass before the travellers or picklists are printed.

8. In the Printing section,
   specify this information:

Printer Specify
the printer to use with this scheduled print job. To add a printer
to the list, use  VRPTSVC.exe. See [Installing
the Reporting Service](VRPTSVCfrmMain.md).

Copies Specify
the number of copies to print.

9. Click Save.

If you have multiple sites, repeat this procedure for each site
for which you want to print travellers and picklists with the Reporting
Service.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VRPTSVCWhat.md)
What is the Reporting Service?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Traveller.md) User-defined Help