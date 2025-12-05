Dispatch Report




# Dispatch Report

The Dispatch Report prints firmed and released operations
scheduled for each shop resource. The list for each resource is printed
on a separate set of pages to allow independent distribution.

For each operation, the following information is shown: Scheduled
Start, Scheduled Finish, Base ID-Sub-ID/Lot ID (Operation Sequence
Number), Part ID/Description, Setup Time, Run Time, End Quantity,
Currently Completed Quantity, and a scheduling message.

If the schedule finish date for the operations work order is greater
than its want date, the operation is marked Early. If the scheduled
finish date is after the want date, it is marked Late. However, if
the want date is previous to the current date, then the operation
is marked Late! (with exclamation point) to indicate that the want
date has already been passed, rather than just being scheduled to
be late. If the work order has not been scheduled into the production
schedule, the operation is marked N/S (Not Scheduled).

1. From the Print Production
   Schedule Reports window, click the Dispatch
   Report button.

The Print Dispatch Report dialog box appears.

|  |  |
| --- | --- |
| POSTIT.gif | Scheduling information applies to the entire work order, not the individual operation. |

2. Enter the range of shop
   resources to print.

The Dispatch Report is always sequenced
by Resource ID and Operation Start Date. You can choose the range
of resources to print.

3. Select the appropriate
   resource types.

You can select any combination of type of
resource to print: Work Center, Individual/Team, Contractor, and Group
by checking the boxes for the appropriate types.

4. Select and set the appropriate
   work order schedule filter.

You can choose to print only operations
for work orders whose Scheduled Finish Date is earlier or later than
the Want Date by a specified number of days. This is especially useful
for focusing on late orders.

To use these options, check either box and
enter the number of days late and/or early. If you select both, VISUAL
considers all orders earlier and later than the days you specify.

5. Select the status of
   the operations you want to print.

You can print the dispatch report for Firmed
operations, Released operations, or both, by checking the appropriate
boxes in the Status section.

6. Select the output for
   the report.

Select Print to
output the report to a printer.

Select View to
output the report to your screen for viewing.

Select File to
output your report as a text file. You can then edit the report using
a text editing application.

7. Click the Ok
   button.

If you selected Print
as the output, a standard Windows dialog box appears.

8. Make the appropriate
   selections then click Ok.

VISUAL prints the report.

## QRP File

VMSCHRP1.QRP

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Production
Schedule Reports User Defined Information