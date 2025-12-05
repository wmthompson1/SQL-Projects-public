Checking Schedule Availability




# Checking Schedule Availability

The Check Availability command in the Quick Quote dialog box allows
you to test schedule the work to be performed in the quote against
one of the current schedules to see how it would fit.

To use this feature:

1. Click the Check
   Availability button.

If this work order has a hard release date,
the Treat Release Date as Hard check box is selected.

2. Select the Schedule
   ID of the schedule you want to check against.

To see how this work order would fit into
the current schedule, choose the production schedule from the Schedule
ID drop down menu. This is the default finite schedule used in Infor
VISUAL.

You may also want to check against INFINITE,
or another "what-if" schedule that is defined as an infinite
or other capacity schedule. This allows you to see how the work order
affects resource loadings. This may require higher or lower head count
if you are to meet a schedule.

3. Select the appropriate
   work order or the engineering master for the scheduling check
   from the Work Order/Master to Schedule drop down box.

If you are scheduling the work order for
a standard part, you have the choice of using the work order or the
engineering master for the scheduling check.

4. If necessary, change
   the Release Date and Want Date.

The system inserts the Release Date and
Want Date from the work order header. You can change these fields
if you want to examine the impact of different dates.

These do not permanently change the work
order Release and Want Dates. You may also want to generate one by
using the other, as follows:

If you have a desired Release date and Want
date, you may want to check whether they are possible to meet based
on the current schedule. Leave both fields set to these dates.

If you would like the work order to begin
immediately, check the Force Forward Schedule box.

If you have a projected release date, you
may want to determine a reasonable Want Date to promise. Set the Release
Date, leave Want Date blank, and check the Force Forward Schedule
box. Assuming your current schedule is accurate, this estimates a
realistic Want Date.

5. If necessary, change
   the Desired Quantity.

Desired Quantity defaults to the work order
desired quantity. You may change the quantity if you want to see the
effects of a different quantity.

6. If you want the schedule
   check to include a check of material availability, click the Check Material Availability check box.

This examines material lead times and purchase
orders that have already placed in determining when you can start
work based on available materials.

7. Click the Schedule button
   to start the check.

VISUAL produces the following information
that appears in the Output Information section of the Check Availability
dialog box:

Scheduled Start Date
This is the date on which the first operation of the work order
would start.

Scheduled Finish Date
This is the date the work order is scheduled to be finished. If
you're checking against a specified Want Date, you should compare
whether this date is on or before it. If it is neither, the check
shows that the date can't be met with the schedule as it stands. You
may want to run the check against an infinite schedule to see where
the overloaded resources are.

If you are checking to determine a reasonable
Want Date, you can use this date as the Want Date. You may want to
add a safety factor to it.

Determinate Path Days
Delay This is the total time between the start and finish
dates of the determinant path that is not occupied by actual scheduled
production. This provides a measure of how much earlier your want
date could be if no other work orders were scheduled to interfere
with this one. Visually, this is the sum of the horizontal gaps between
successive operations of the determinant path in the Scheduling Window
that are not caused by weekends or other nonproduction time.

Total Days Delay
Similar to Determinant Path Days Delay, this is the days delay for
all operations in the work order, not just the determinant path.

8. When checking the schedule,
   actual place holding items are put into the schedule database.
   When you press the Close button, you're asked if you want to remove
   the results of this check from the schedule. You may want to leave
   them in the following circumstances:
9. You will shortly
   schedule this work order, but not immediately. You can leave the
   items scheduled in to reserve the space in case additional items
   are also scheduled in the mean time.
10. You want to
    examine the results of the check in more detail by using the Scheduling
    Window. For example, if the check shows that dates can't be met,
    you may want to examine the production and INFINITE schedules
    to more fully assess the situation.

If you answer NO to remove results, you
can remove them later by using the Purge Availability Checks option
in the Global Scheduler.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.htm) User-defined Help