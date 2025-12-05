Editing Labor Ticket Information




# Editing Labor Ticket Information

Because labor tickets represent a report of actual
status, rather than a static data object, you can modify only a limited
amount of data in a completed labor ticket. If you need to change
a field that is not modifiable, you can delete the labor ticket and
re-enter it. VISUAL only allows this for labor tickets that havent
been posted to the general ledger. You cannot make any modifications
or deletions to posted labor tickets.

1. In the Labor Ticket
   Entry window, click the Transaction ID
   browse button and select the Labor Ticket that you want to edit.

To quickly retrieve an in-process ticket,
specify the Employee ID and click Retrieve In Process.
There can only be one in process ticket for each employee. If one
exists, it is called up immediately.

2. Edit any of these fields:

Transaction Date
- You can enter a new transaction date, if necessary.

Employee ID & Department
- You cant change the Employee ID but you can change the Department.
This allows reassignment of the ticket to a different employee and/or
department.

For Indirect Transactions

Indirect ID & G/L
Account ID - This allows you to change the G/L expense account
to be debited for the cost of the indirect transaction.

For Direct Transactions

Clock In, Clock Out,
Elapsed Time, Break Hours - This allows modification of the
labor hours associated with the ticket. It also allows completion
of an in process ticket by completing the clock out or elapsed time
fields.

Quantity Completed, Quantity
Deviated - Reported completion to the work order is adjusted
appropriately. If quantity completed for a completed operation drops
back below quantity required, the operation will automatically be
re-released from the closed status.

Hourly Rate, Multiplier,
Unit Rate - Depending on the transaction type, you can change
certain information. The information that cannot be changed is grayed
out. Once the labor tickets have been posted to the General Ledger,
you cannot make any changes.

3. Click the Save
   toolbar button to save the changes. If you edit an overlapping
   labor ticket, you are prompted to recalculate labor ticket proration.
   Overlapping labor tickets can be created in VISUAL Time &
   Attendance and through Barcode Labor Ticket Entry.

## Recalculating Labor Ticket Proration

If you have edited a labor ticket that overlaps with another labor
ticket, use the Recalc Proration function to recalculate the proration
values for the overlapping labor tickets.

To recalculate the labor tickets for an employee on a specific day:

1. From the Labor Ticket
   Entry window, select Edit, Recalc
   Proration.
2. Select the Site ID from
   the Site ID drop-down list.
3. Select the employee
   whose labor tickets are to be reviewed from the Employee ID drop-down
   list.
4. Select the date of the
   labor tickets to be reviewed in the Date field.
5. If you change your employee
   or date selections, click Refresh to
   display labor tickets for your updated selections.
6. The Labor Tickets table
   displays these columns:

Transaction ID
The ID of the labor ticket.

Trans Type - The
type of labor ticket. These codes are used:

R - Work Order
Run

S - Work Order
Setup

I - Indirect

Trans Date - The
date that work began on the labor ticket.

Prorated - If the
labor ticket has been prorated, this check box is selected.

Clock-in The time
that the employee has clocked in.

Clock-out - The
time that the employee has clocked out.

Elapsed Hours
The prorated hours calculated on overlapping labor tickets when the
environment is set to Prorate Hours.

Unprorated Elapsed Hours
The non-prorated number of hours calculated for the labor ticket.
This is calculated by subtracting the Clock-in time from the Clock-out
time.

Hours Break - The
duration of the break or meal.

Multiplier 2 If
you prorate by costs, the multiplier used to calculate the costs.

Multiplier 1 - If
the employee shift has a primary multiplier, it displays here.

Base - The ID of
the work order associated with the labor ticket. If this labor ticket
is associated with a project, then the Base ID is the ID of the project
master associated with the labor ticket.

Lot - The ID associated
with the work order of the job.

Split The identifier
of the work order.

Sub - The leg of
the work order, where zero indicates the main leg.

Seq# - The work
order operation on which labor was reported.

Indirect ID - The
Indirect ID specified for indirect labor transactions.

7. Click Recalculate
   to adjust the prorated values. If you prorate by hours, then the
   Hours column is updated. If you prorate by costs, then the Hours
   and Multiplier 2 values are updated.
8. If you want to export
   the Labor Ticket table information to Microsoft Excel, click Send to Excel. Specify the Export File Name
   and then click Save.
9. Click Close
   to close the Recalc Proration dialog.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.htm) User-defined Help