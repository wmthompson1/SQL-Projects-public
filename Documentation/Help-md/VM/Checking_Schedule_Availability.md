Checking Schedule Availability




# Checking Schedule Availability

If you are using the [Global
Scheduler](VMGLBSCHWhat.md), you may want to use the Check Availability option to
see how an order placed for this quote would affect your shop schedule.

1. Select the line item
   to check from the Estimating Window line item table.
2. Select Check
   Availability from the File menu.

The Check Availability dialog box appears.

3. Select the Schedule
   ID of the schedule you wish to check against.

If you are licensed to use multiple sites,
the schedule IDs for the currently selected site are listed in the
drop-down list. If you are licensed to use a single site, all of your
schedule IDs are listed in the drop-down list.

To see how this job would fit into the current
schedule, choose the production schedule. You may want to check against
Infinite, or another schedule that is defined as an infinite capacity
schedule. This allows you to see how the order would affect resource
loading, which may require a higher or lower resource capacity to
meet the desired schedule.

The Treat Release Date
as Hard check box is selected by default if you specified in
[Site
Maintenance](Specifying_Information_on_the_Scheduling_Tab_site.md) that VISUAL must enforce hard release dates for all
work orders in all schedules.

4. If quoting a standard
   part, select an engineering master from the Work Order/Master
   to Schedule drop-down box.

You should usually leave this set to the
default.

5. There are two basic
   ways to check availability:

1. If you have a desired
   release date and want date, check if they are possible to meet
   based on the current schedule. Set the Release Date to the expected
   date of the order, and the Want Date to the desired date. If you
   provided a Quoted Lead-Time on the quote, the Want Date should
   fall within the date range defined by the two dates.

For example,
if you set Quoted LT to 14 days, and expect an order on 3/13/96, set
Release Date to 3/13/96 and Want Date to 3/27/96.

If you would
like the work order to begin as soon after the release date as possible,
regardless of the want date, check the Force Forward Schedule box.
(Other than having the work start as early as possible, this option
doesn't have significance here, because the important goal is to meet
the Want Date, not finish prior to it.)

2. If you have a projected
   release date, you may want to determine a reasonable lead-time
   to promise. Set the Release Date to the expected date of the order,
   and check the Force Forward Schedule check box.

Assuming your current schedule is accurate,
this estimates a meetable promise date. You can use this date to determine
a lead-time to quote.

6. Adjust the Desired Quantity,
   if necessary.

Desired Quantity defaults to the largest
quoted quantity.

7. If you want the schedule
   check to include a check of material availability, click the Check
   Material Availability check box.

This examines material lead times and purchase
orders that have already been placed in determining when work can
start based on available materials.

8. If you want the schedule
   check to include a check of service ability, click the Check Services
   Availability check box.
9. Press the Schedule
   button to start the check.

The following information appears in the
Output section of the Check Availability dialog box:

Scheduled Start Date
- This is the date on which the first operation of the work order
would be scheduled to start.

Scheduled Finish Date
- This is the scheduled completion date for the work order. If you're
checking against a specified want date, compare whether this date
is on or before it. If not, the check shows that the date can't be
met with the schedule as it stands. You may wish to run the check
against an infinite schedule to see where the overloaded resources
are.

If you're checking to determine a lead-time,
you can subtract this date from the Release Date to get a lead-time.

Determinant Path Days
Delay - This is the total time between the start and finish
dates of the determinant path that is not occupied by actual scheduled
production. This provides a measure of how much better you could do
if no other work orders were scheduled to "interfere" with
this one. Visually, this is the sum of the horizontal "gaps"
between successive operations of the determinant path in the Scheduling
Window that are not caused by weekends or other non-production time.

Total Days Delay
- Similar to Determinant Path Days Delay, this is the days delay for
all operations in the work order, not just the determinant path.

Rate per Day
Information is displayed in this field if the part is a rate-based
part. This field shows the quantity that the work order produces each
day. See [What Are Rate-based
Parts?](What_Are_Rate-based_Parts_.md).

First Delivery Date
Information is displayed in this field if the part is a rate-based
part. The first day that the part is scheduled to be produced based
on the schedule input settings. Note that the quantity produced on
the first delivery date could be less than the daily rate. If the
total quantity produced in the work order is not a multiple of the
daily rate, then a quantity that is less than the daily quantity is
produced on the first day. For example, if the daily rate of a part
is 8 and the total quantity of the work order is 20, then 4 parts
are produced on the first day.

10. Click the Close
    button.

A dialog box appears, asking if you want
to remove the results of this check from the schedule.

You may wish to leave them in following
circumstances:

1. Probability of an order
   is high. This leaves room in the schedule for the resulting work
   order.
2. You wish to examine the
   results of the check in more detail by using the Scheduling Window.
   For example, if the check shows that dates can't be met, you may
   wish to examine the Standard and Infinite schedules to more fully
   assess the situation.

If checking against a Quote Master, the
operation is identified by a Q, followed by the Quote ID, a slash
(/), the quote master number, and the operation sequence number in
parentheses. For example, Operation 20 of Quote Master 3 for the quotation
with Quote ID 1015 will be labeled Q1015/3(20).

If checking against a Part or Engineering
Master, the operation is identified by an M, followed by the Part
ID and the operation sequence number in parentheses. See the Scheduling
Window for more information.

If you answer No to remove results, you
can remove them later by using the Purge Availability Checks option
in the Global Scheduler.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.md) User-defined Help