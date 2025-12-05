Checking Schedule Availability in Customer Order Entry




# Checking Schedule Availability in Customer Order Entry

Customer Order Entry allows you to assess the impact
of the work order for an ordered item on your current shop schedule.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which the order was created. If you
   are licensed to use a single site, this field is unavailable.
2. Click the Order
   ID button and select the order.
3. Select the line item
   to check from the Customer Order Entry window line item table.
4. Click the Sched
   Avail button or select Check Schedule
   Availability from the File menu.

The Check Availability dialog box appears.

3. Select the Schedule
   ID of the schedule you want to check against.
4. To see how this job
   would fit into the current schedule, choose the production schedule.

You may also want to check against another
schedule that is defined as an infinite capacity schedule. This allows
you to see how the order will affect resource loadings, which may
require a higher or lower head count if you are to meet the desired
schedule.

If the line item is for a standard part
and the Job ID is specified on the line, you are test-scheduling the
actual work order.

If you do not specify a job, you can check
using the generic engineering master for the part.

There are two basic ways to check availability:

5. If you have a desired
   release date and want date, you may want to check whether they
   are possible to meet based on the current schedule. Set the Release
   Date to the Order Date, and the Want Date to the desired ship
   date.
6. If you would like the
   work order to start as soon as possible after the release date,
   irrespective of the want date, check the Force Forward Schedule
   box. Other than having the work start as early as possible, this
   option doesnt have significance in this case, because the important
   goal is to meet the Want Date.
7. If you have a projected
   release date, you may wish to determine a reasonable lead time
   to promise. Set the Release Date to the expected date of the order,
   and check the Force Forward Schedule box. Assuming your current
   schedule is accurate, this estimates a desired finish date. You
   can use this date to determine a finish date to promise.
8. Adjust the Desired Quantity,
   if necessary.
9. Desired Quantity defaults
   to the line item quantity.
10. If you want the schedule
    check to include a check of material availability, click the Check
    Material Availability check box.

This examines material lead times and purchase
orders that have already been placed in determining when work can
start based on available materials.

11. Click the Schedule
    button to start the check.

The following information appears in the
Output section of the Check Availability dialog box:

Scheduled Start Date
- This is the date on which the first operation of the work order
would start. You may wish to focus on the difference between this
date and the release date to get a feel for the days delay before
work would be started.

Scheduled Finish Date
- This is the date on which the work order is scheduled to finish.
If youre checking against a specified Want Date, compare whether
this date is on or before it. If not, the check shows that the date
cant be met with the schedule as it stands. You may want to run the
check against an Infinite schedule to see where the overloaded resources
are. If youre checking to determine a lead time, you can subtract
this date from the Release Date to get a lead time.

Determinant Path Days
Delay - This is the total time between the start and finish
dates of the determinant path that is not occupied by actual scheduled
production. This provides a measure of how much better you could do
if no other work orders were scheduled to interfere with this one.
Visually, this is the sum of the horizontal "gaps" between
successive operations of the determinant path in the Scheduling Window
that are not caused by weekends or other non-production time.

Total Days Delay
- Similar to Determinant Path Days Delay, this is the days delay for
all operations in the work order, not just the determinant path.

Rate per Day
Information is displayed in this field if the part is a rate-based
part. This field shows the quantity that the work order produces each
day. See [What Are Rate-based
Parts?](What_Are_Rate-based_Parts_.htm).

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

13. Click Close.
14. A dialog box appears,
    asking if you want to remove the results of this check from the
    schedule.

You may want to leave them in following circumstances:

The order will be released. This "leaves room"
in the schedule for the resulting work order.

You wish to examine the results of the check in more detail by using
the Scheduling Window. For example, if the check shows that dates
cant be met, you may wish to examine the production and infinite
schedules to more fully assess the situation.

If you answer No to remove results, you
can remove them later by using the Purge Availability Checks option
in the Global Scheduler.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help