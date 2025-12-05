Scheduling Selected Work Orders




# Scheduling Selected Work Orders

This option is not available if you are licensed to use DBR or Easy
Lean. If you are licensed to use DBR or Easy Lean, use the DBR Scheduler
to create and schedule work orders. See [What
is DBR Scheduling](VMDBRSCHWhat.htm).

You can choose to schedule only some of the work orders. To use
this option:

1. If you are licensed
   to use multiple sites, open a master that belongs to the site
   that contains the work orders to schedule. If you are licensed
   to use a single site, open any master.
2. Select File,
   Select and Schedule Work Orders.
3. Double-click the Work Order ID browse button and select the
   work orders you would like to schedule. You can select multiple
   work orders from the dialog box, or you can select work orders
   one at a time. If you plan to use the Table window order option,
   you may want to select work orders one at a time to arrange the
   work orders in the order you want.

The system displays the following information
about each work order:

Global Rank
The system inserts the priority you set for the work order. Set work
order priorities in the Work Order Priority dialog box.

Release Date
The system inserts the date the work orders status was changed to
Released.

Want Date The
system inserts the want date from the work order header.

Start Date This
is the date on which the first operation of the work order will start.

Finish Date
This is the date on which the work order is scheduled to be completed.

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

4. Select the Schedule
   ID.
5. Select from the following
   options:

Check Material Availability
Select this option to check that materials are available as part
of the scheduling process.

Check Service Availability
Select this option to check that services are available as part
of the scheduling process.

Treat release date as
hard Select this option to enforce the release date on the
work order. The system schedules the work order to begin on the release
date. If you clear this option, the system disregards the release
date and schedules the work order as time and materials allow.

Freeze started operations
Select this option to freeze the schedule of any started operations.
If you clear this check box, the system may reschedule started operations.

6. Select the order the
   system should schedule the work orders. Select one of the following
   options:

Order want date
The system schedules the work order with the earliest want date
first, the second earliest want date second, and so on.

Priority, want date
The system schedules the work order with the highest priority and
the earliest want date first. The system schedules all work orders
with the highest priority before scheduling other work orders.

Priority, release date
The system schedules the work order with the highest priority and
the earliest release date first. The system schedules all work orders
with the highest priority before scheduling other work orders.

Table window order
The system schedules the work orders in the order in which they
are displayed in the work order table.

7. Click the Schedule
   button to schedule the work orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help