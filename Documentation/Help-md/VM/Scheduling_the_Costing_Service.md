Scheduling the Costing Service




# Scheduling the Costing Service

After you [install the Costing Service](VMCSTSVCfrmMain.htm),
specify when the Costing Service should be prompted to run costing
for a site.

You can set up different schedules for transaction costing and journal
preparation. For example, you can schedule the Costing Service to
run transaction costing daily and prepare manufacturing journals weekly.

To schedule the Costing Service:

1. Select Eng/Mfg,
   Costing Utilities.
2. In the site ID field,
   select the site where you will run costing utilities with the
   service. Make sure you select a site for which you have installed
   the Costing Service.
3. Select File,
   Costing Service Schedule. The ID of
   the site you selected is displayed in the title bar of the dialog.
4. Specify when the service
   is active. Specify this information:

Start Date Specify
the date that the service should start checking to see if costing
needs to be run. Leave this field blank or specify todays date if
you do not want to delay the start of the service.

End Date Specify
the last date that the service should check to see if costing needs
to be run. Leave this field blank if you do not want to set up an
expiration date for the service.

Enabled To use
the service with the selected site, select this check box. To stop
using the service, clear this check box.

5. In the Run Type section,
   weekly is selected. You cannot change this selection. This selection
   indicates that the service should check for updates only on the
   days and times you specify.
6. In the Transaction Costing
   section, specify the settings to use when the service runs transaction
   costing. Specify this information:

Receipt Transaction Costing
To update your work order receipt costs with the most up-to-date
receipt transaction data, select this check box. Actual cost transactions
are updated for Closed orders and partial receipts are updated based
upon WIP costing method.

Standard Costs are used to determine Finished
Goods Variances.

Inventory Transaction
Costing To update your inventory costs with your most up-to-date
receipt transaction data, select this check box. If you use the Standard
costing method, this option is not displayed.

Assume that operations and materials are
closed if work order is closed To automatically close any operations
and materials on a closed work order during the costing run, select
this check box. To retain the current status of any operation and
material cards on a closed work order, clear this check box.

7. Specify when to run
   transactions costing. Specify this information:

Days of Week
In the Days of Week section under the Transaction Costing section,
specify on which days to run transaction costing with the service.

Run At Specify
the times of day that the service should check to see if transaction
costing should be run. The times you specify apply to all days that
you run the service for transaction costing. You can run the service
up to 6 times a day. If you select a day in the Days of Week section
but leave all Run At fields blank, then the service is run at 12:00
AM on the days you selected.

8. In the Journal Preparation
   section, use the check boxes to specify which journals to prepare
   when the service runs costing. Then, specify when to prepare the
   journals. Specify this information:

Days of Week
In the Days of Week section under the Journal Preparation section,
specify on which days to prepare journals using the service.

Run At Specify
the times of day that the service should check to see if journals
need to be prepared. The times you specify apply to all days that
you run the service for journal preparation. You can run the service
up to 6 times a day. If you select a day in the Days of Week section
but leave all Run At fields blank, then the service is run at 12:00
AM on the days you selected.

Depending on the polling interval that was
specified when the service was installed, costing might not be run
exactly at the time you specify. At the times that you specified,
costing is flagged as needing to be run. Costing is started when the
costing service polls the database and finds that costing needs to
be run. When you specify a time, costing could be run at any time
between the time that you specify and the time that you specify plus
the polling interval. For example, if you specify 7:00:00 as the start
time and the polling interval is 600 seconds, then costing is started
sometime between 7:00:00 and 7:10:00.

9. To recalculate standard
   costs, select the Enabled check box
   in the Recalc Std Costs Options section. This check box is available
   when you select the Enabled check box
   under the Start Date and End Date fields. If the parent entity
   of the site uses Standard costing, you cannot use the options
   in the Recalc Std Costs Options section. Specify this information:

Fabricated/Purchased/All
Click Fabricated to recalculate the standard
costs of fabricated parts only. Click Purchased
to recalculate the standard costs of purchased parts only. Click All to recalculate the standard costs of all parts.

Threshold Plus/Minus%
Specify the threshold that triggers a standard cost update. Parts
with cost differences that fall within the threshold that you specify
are updated. For example, if you specify 10 in this field and the
cost of a part is 100, then the standard cost is updated if the new
cost is between 90 and 110. If the new cost falls outside of the threshold,
the part is not updated. Specify 0 if you do not want to use a threshold.

Recent Selection Option
Use this section to specify the work order receipts and purchase
order receipts to use to calculate standard costs.

Within days from current
date To use a date range, click this option, and then specify
the number of days. Receipts that were created in the time range are
included in the calculation. For example, specify 30 to examine receipts
that were made in the last 30 days.

All receipts Click
this option to include all receipts in the costing calculations.

Use the latest receipt if
no receipts occurred during the date range If you clicked
the WIthin days from current date option,
select this check box to use the most recent receipt if there are
no receipts for a part during the date range.

Days of Week
In the Days of Week section under the Transaction Costing section,
specify on which days to update costs. You can select any day on which
transaction costing is run. If transaction costing is not run on a
day, then you cannot select that day to update costs. Costs are updated
after the time that you specify in the Time 1 field.

Log Details to CSV file
Select this check box to save information about the recalculated
costs to a CSV file. The CSV file includes the old costs, the new
cost calculations, and whether the costs have been updated.

9. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCSTSVCWhat.htm)
Running Costing with the Costing Service

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help