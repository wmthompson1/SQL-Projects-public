Adding New Labor Tickets




# Adding Labor Tickets

You can enter these types of transactions in Labor Ticket Entry:

* Setup.
  Use this type to record the time that is spent setting up a resource
  for the run.
* Run.
  Use this type to record the time that is spent manufacturing items.
* Indirect.
  Use this type to record time that is not related to manufacturing
  activities. For example, you can use an indirect labor ticket
  to record vacation time or administrative overhead time.

Depending on the type of transaction that you select, fields in
Labor Ticket Entry become active.

1. Select Eng/Mfg,
   Labor Ticket Entry.
2. If
   you are licensed to use multiple sites, click the Site ID arrow
   and select the site in which you are adding a labor ticket. If
   you are licensed to use a single site, this field is unavailable.
3. In the header, specify
   this information:

Transaction ID
Leave this field blank. The ID is generated when you save the ticket.

Transaction
Date Specify the date that the labor took place.

Employee ID
Click the browse button and specify the ID of the employee who completed
the labor. f you are licensed to use multiple sites, only the employees
assigned to the site ID you specified in step 2 are displayed. If
you are licensed to use a single site, all employee IDs are displayed.

Department
ID The employees default department ID is inserted, You
can specify a different department ID.

Transaction
Type Select Setup, Run, or Indirect.

Indirect
Code This field is used for Indirect labor tickets. You can
leave this field blank. When you select an Indirect ID the associated
code is inserted in this field. The indirect code is used to classify
the indirect ID.

4. For Setup and Run labor
   tickets, specify information about the work order operation:

Base ID Click the browse button and select the
base ID of the work order. When you select a base ID, values are inserted
in the Lot ID, Split ID, and Sub ID fields.

Oper
Seq No Click the browse button and select the operation that
you are setting up.\

Resource
ID After you select an operation, the resource used for the
operation is inserted in the Resource ID field. You can specify a
different resource ID. For example, if a last-minute scheduling change
caused the operation to be set up on a different resource than the
resource specified on the operation card, you can specify the correct
resource.

Earning
Code The employees default earning code is inserted in the
field. You can specify a different earning code.

5. For Indirect labor tickets,
   Specify information about how to account for the cost of the labor
   ticket:

Indirect
ID Select the indirect ID to which you are reporting labor.

G/L
 Account ID The account associated with the indirect
ID that you selected is inserted. You can specify a different G/L
account ID.

Earning Code
The employees default earning code is inserted in the field. You
can specify a different earning code.

6. Specify the duration
   of the labor ticket. Perform one of these tasks:
7. Specify
   Clock-in and Clock-out Time Specifying Clock In and Clock
   Out times automatically computes elapsed labor hours.

Times appear in the Clock In and Clock Out
fields in formats specified in the International section of the Microsoft
Windows Control Panel. Control panel allows specification of 12- or
24-hour formats, along with the separator character, which is usually
for time specification. Additionally, you can suppress leading zeros
for hours (i.e. 8:00 vs. 08:00).

The United States default for time specification
has the format hh:mm:ss xM, where hh is the hours, mm the minutes,
ss seconds, and xM either AM or PM. For examples, 12:17:22 PM and
8:00:00 AM. The default suppresses leading zeros for hours.

In general, when specifying a time, you can
specify just the left-most significant data, and the remainder defaults
to zero. Additionally, you can specify a time in 24 hour format. Your
entry is automatically converted to a fully specified time in the
format selected in the Control Panel.

This table shows how the times that you specify
are converted:

|  |  |
| --- | --- |
| **Specified Value** | **Converted Value** |
| 8 | 8:00:00 AM |
| 8 PM | 8:00:00 PM |
| 12:17 | 12:17:00 PM (defaults to PM) |
| 17:55 | 5:55:00 PM |
| 17:55 AM | Error (do not specify AM or PM with 24 hour times) |

Additionally, you can specify times in a quick
4-digit format of hhmm. In this case, the mm portion is interpreted
in one of two ways, depending on the setting of Use Decimal Time Format
in Administrator Setup. If this is set, then the last two digits are
interpreted as a percentage of an hour. Otherwise, they are interpreted
as minutes. For example, 0825 is converted to 8:25:00 AM if Use Decimal
Time Format is not set, and 8:15:00 AM (15 minutes = 25/100 of an
hour) if it is.

* Specify
  Clock-in and Elapsed Time If you specify a Clock-in time,
  and then an Elapsed Time, the Clock-out time is calculated based
  on the difference. Note that the Clock-out time is adjusted each
  time you change the Elapsed Time.

When you specify clock-in and clock-out times,
you cannot specify overlapping times for the same employee.

* Specify Elapsed
  Time Technically, only Elapsed Time is required to complete
  a labor ticket. If tickets are specified this way, actual start
  and stop times will not be available for historical purposes.

It is possible to create an In Process labor
ticket by entering a clock in and clock out time that are the same,
and leaving Elapsed Time blank (NOT zero). A ticket of this type represents
a clocked in employee, who will later clock out to complete the operation.
Clocking out is done by recalling the ticket and modifying the clock
out time and any other fields that need completion, such as quantity
complete and description. You cannot create overlapping labor tickets
in Labor Ticket Entry. If you use Labor Ticket Entry to enter labor
tickets, each employee can only have one in process ticket.

7. In the Break Hours
   field, specify the amount of time spent on break. The amount that
   you specify is subtracted from the elapsed time.
8. Optionally,
   in the Description field, specify a description of the labor ticket.
9. For
   Setup labor tickets, select the Setup Complete
   check box if the setup of the resource is complete. This check
   box is automatically selected the first time that you specify
   a Run labor ticket against the operation. This feature is useful
   if the operation has no associated setup time.
10. For Run labor tickets,
    specify information about the quantity completed::

Qty
Required The total quantity required for the operation is
displayed. This field is read-only.

Qty
Remaining/Percent Remaining The total remaining to be completed
on the operation. If the operation is set up to report completion
based on quantities, then Qty Remaining is used as the label for this
field. If the operation is set up to report completion based on percentage,
then Percent Remaining is used as the label.

If quantity or percentage of completion
is calculated automatically and a maximum completion percentage has
been specified, then this value is not updated after the maximum completion
percentage has been reached. For example, if the operation has a maximum
completion percentage of 80%, then this field is no longer updated
after 80% of the estimated labor hours have been completed. Additional
hours can be reported, but the percent of quantity remaining value
is not changed.

See [Setting
Preferences in Site Maintenance and the Manufacturing Window](Setting_Preferences_in_Site_Maintenance_and_the_Manufacturing_Window.md).

Qty
Complete/Percent Completed If the operation is set up to
report completion based on quantities, the Qty Complete is used as
the label for this field. Specify the quantity that was completed
on the labor ticket. If the operation is set up to report completion
based on percentage, then Percent Completed is used as the label for
this field. Specify the percentage that was completed during the ticket.
For example, if 20% has already completed, and you completed an additional
10%, specify 10%.

If automatic calculation of quantities is
activated, then a value is calculated for you. You can specify a different
value than the calculated value.

If a Max Percent Completed value has also
been specified for the operation, then the automatic calculation stops
when the total labor reported on the operation matches the threshold.
You can continue to report labor on the operation, but additional
quantities are not automatically calculated after the threshold is
reached. You can manually specify a value even if you are automatically
calculating values.

Qty
Deviated Specify the number of unusable pieces produced during
the elapsed time in the Qty Deviated field. These are pieces that
are scrapped or rejected by quality control. This field provides a
historical analysis of completion data. This quantity does not contribute
to the total quantity completed for the operation, but is recorded
as part of the total incoming quantity for the operation.

When you specify a deviated quantity, the
Deviated Reason ID field is activated. Click the browse button and
select a reason from the list.

Run
Complete If the operation is complete, select the Run Complete
check box.

If a Max Percent Completed threshold has
not been set up for the operation, then this check box is selected
automatically when the operation is complete. If VISUAL is set up
to calculate quantity complete by hours, then the Run Complete check
box is selected when the total number of hours specified for the operation
equals or exceeds the estimated run time for the operation. If VISUAL
is not set up to calculate quantity complete by hours, the Run Complete
check box is selected when the quantity remaining is zero and you
click the Save button.

If a Max Percent Completed threshold has
been set up for the operation, you must manually select the Run Complete
check box when the operation is completed.

11. Specify any cost override
    information for the labor ticket.

Direct labor costs can accumulate in two
different ways; you must set this option in Accounting Entity Maintenance
during the implementation process. It applies to all transactions:

* Based on hours
  worked. An hourly rate is multiplied by the elapsed time to get
  a labor cost for the labor ticket.

If you are using actual costing, the employees
pay rate is used (for yearly salaries, the salary is divided by 40
hours x 52 weeks to get an hourly rate). This method is also used
for all indirect transactions.

If you are using standard costing, the hourly
cost in the shop resource standard is used (setup or run, as appropriate).
In both cases, the reported elapsed time is used to compute the labor
cost.

Additionally, you can also specify a cost
per unit. This is always defined in the shop resource master; there
are separate costs per unit for setup and run.

Both of these values are used in assigning
the cost. As a simple example, if an operation costs $5 per hour,
and $1 per piece, then a reported elapsed time of 1 hour for 5 pieces
produces a direct labor cost of $10 using the following formula:

(1 hour x 5 + 5 pieces x 1)

* Based on Quantity
  Produced. This option only applies if you are using standard costing.
  In this case, labor cost is computed solely based on quantity
  completed. Quantity completed (good and deviated) is used to calculate
  an effective hourly rate, and uses this hourly rate, along with
  the original quantity completed, to calculate the cost.

Overrides are only possible if you are using
actual costing.

In that case, a value placed in the Hourly
Rate cost field overrides the employees standard rate. A blank Hourly
Rate field indicates that the default is used. It does not appear
in the field.

* Additionally,
  the hourly rate is multiplied by either Multiplier 1 or Multiplier
  2 field before using it.

Multiplier 1 indicates overtime and is always
greater than or equal to 1. Multiplier 2 indicates proration and is
always less than or equal to 1. This is useful for entering labor
tickets known to be eligible for overtime. You can enter the appropriate
multiplier here without overriding the actual hourly rate.

12. Click Save.
    If you created a Run labor ticket, then these actions occur:

* The completion
  meters in the Manufacturing Window are updated.
* If a maximum
  percent complete threshold has not been specified for the operation,
  then these calculations are used to determine the percentage of
  completion:

6. If you
   report labor based on quantity, then Quantity Completed is divided
   by the to the total work order or leg quantity and multiplied
   by 100 to determine the completion percentage.
7. If you
   report labor based on percentage, then the total percentage reported
   as complete is used to update the completion meter.

* If a maximum
  percent complete threshold has been specified for the operation,
  then the percentage of completion calculation stops when the threshold
  has been reached. To update the completion meter after the automatic
  calculation threshold has been reached, you must manually update
  the quantity or percentage complete on the labor ticket.
* Completed
  operations are closed. If you select the Run Complete check box
  or if the total completed equals or exceeds the quantity required,
  then the operation is automatically closed. If lower-level operations
  use shop resources that are designated as automatic reporting,
  then the lower-level operations are also closed.
* Auto Issuing
  of Material Requirements are triggered. If any material requirements
  feeding into the operation are for Auto Issue parts, then the
  material is automatically issued to the work order operation from
  the Auto Issue warehouse location in proportion to the quantity
  completed.

For example, if the Work Order or Leg quantity
is 10, quantity completed is 5, and Quantity Per for an Auto Issue
part is 3 feet, then 15 feet is issued to the operation 15 = (5 x
3). Auto issuing is done for the specified operation, as well as for
any Automatic Reporting operations. This allows material back flushing
for materials that are not explicitly issued to work orders, but are
pulled as needed.

## Completing Labor on Operations with Max Percent Complete Thresholds

If a maximum percent complete threshold has been specified for an
operation, then perform one of these tasks in Labor Ticket Entry to
indicate that labor is complete and the operation is closed:

6. Manually select the Run
   Complete check box on the labor ticket. If you select the Run
   Complete check box but do not update quantity/percent complete
   to 100% of the quantity, then the operation completion meter does
   not reach 100%. The operation is still closed.
7. Update Quantity/Percent
   Completed on the labor ticket to equal the total quantity required
   for the operation. When the total quantity remaining equals zero,
   the Run Complete check box is automatically selected when you
   save the labor ticket. The operation completion meter will equal
   100%, and the operation is closed.
8. Use the Manufacturing Window
   to change the status of the operation to Closed. The operation
   completion meter will not equal 100%.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.md) User-defined Help