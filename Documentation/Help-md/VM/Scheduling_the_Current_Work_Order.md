Scheduling the Current Work Order




# Scheduling the Current Work Order

Use the Schedule Current Work Order command to schedule
the current work order into a schedule without running the full global
scheduler. To do this:

1. Select Schedule
   Current Work Order from the File
   menu.

The Schedule Work Order dialog box appears.

This dialog box is similar to the Check
Availability window, with the following differences:

* You are only
  free to change the Schedule ID to use, the Check Material Availability
  option, and the Freeze Started operations option. The other items
  are locked in from the work order header.
* When you press
  Schedule, the work order is actually permanently scheduled, rather
  than just checked.
* |  |  |
  | --- | --- |
  | POSTIT.gif | When you schedule an individual work order into an existing schedule this way, the work order necessarily gets the lowest priority among all orders that are already in the schedule. This function never modifies existing work order schedules; the current work order is fit in where possible. If this is not the result you want, you should use the Global Scheduler to schedule this work order, and reschedule all others. Schedule Current Work Order is most useful when the work order is planned for a time period where there is little other activity. Then, this function quickly schedules the new order without the overhead of rescheduling all other orders. |

2. Select the Schedule
   ID.

To add the work order the current schedule,
choose the production schedule from the Schedule ID drop down menu.
This is the default finite schedule used in Infor VISUAL.

3. Enter the appropriate
   work order to schedule into the Work Order to Schedule field.
4. If you want the schedule
   check to include a check of material availability, select the
   Check Material Availability check box.
5. If you want the schedule
   check to include a check of service availability, select the Check
   Service Availability check box.
6. If you want to freeze
   started operations before scheduling, select the Freeze Started
   Operations check box.
7. Click the Schedule
   button to start the check.

VISUAL produces the following information,
which appears in the Output Information section of the Schedule Work
Order dialog box:

Scheduled Start Date
- This is the date on which the first operation of the work order
will start.

Scheduled Finish Date
- This is the date on which the work order is scheduled to be completed.

Determinate Path Days
Delay - This is the total time between the start and finish
dates of the determinant path that is not occupied by actual scheduled
production. This provides a measure of how much earlier your want
date could be if no other work orders were scheduled to interfere
with this one. Visually, this is the sum of the horizontal gaps between
successive operations of the determinant path in the Scheduling Window
that are not caused by weekends or other non-production time.

Total Days Delay
- Similar to Determinant Path Days Delay, this is the days delay for
all operations in the work order, not just the determinant path.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help