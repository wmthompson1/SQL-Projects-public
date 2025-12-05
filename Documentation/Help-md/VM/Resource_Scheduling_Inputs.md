Resource Scheduling Inputs




# Resource Scheduling Inputs

This section outlines the shop resource items used
by the Concurrent Scheduler in creating a schedule.

## Schedule Type

You can mark operation-scheduling types in two
ways:

Schedule Continuous means that there is sufficient capacity for
performing the entire operation.

In Schedule Discontinuous, you can specify a minimum segment size.
A minimum segment size is the minimum required run duration on one
unit that must be scheduled before the segment is eligible.

## Capacity Type

Shop resources can be marked in one of two ways. Schedule Normally
indicates a finite capacity which is specified as described below.
If Schedule Normally is not selected, the resource is assumed to have
infinite capacity.

## Calendar

The resource weekly calendar for a resource specifies the duration
of each of three shifts for the seven weekdays. Calendar exceptions
allow this to be modified when needed. Calendars can be resource specific
and/or schedule specific.

## Resource Capacity

Resource capacity is defined in terms of how many hours a given
resource is available for each shift of each day and how many units
of capacity are available during that period.

For example, if a work center has 3 machines that operate 8 hours
per day, you could say that the work center has 24 resource-hours
of capacity.

The work center perspective sees 3 machines, each operating 8 hours
per day on the same shift; thus there are 24 hours of machine availability.
If there are 3 jobs or less, totaling 24 hours or less, then the work
center perspective is correct.

However, the work center perspective does NOT account for the fact
that only three jobs can be run at any given time, regardless of duration.

VISUAL sees this as a shift that is 8 hours long with 3 units of
capacity. This means that a maximum of 3 operations may be scheduled
to coincide with one another during that given period of time.

This is obviously different from 24 hours of capacity that is obtained
by having one unit available for 24 hours.

When you specify a number of units of capacity, VISUAL assigns a
unit number to each one, starting with 0. For example, if a drill
resource has a capacity of 3 on the first shift, VISUAL will schedule
operations on units 0, 1, and 2. The Scheduler always loads unit 0
first, then unit 1, and so on. This is significant in the following
situations:

## Some Operations are Shorter Than a Given Shift

Consider an example where each operation takes 2 hours, and you
have the capacity described above of one 8 hour shift that has 3 units
of capacity. The Scheduler will schedule up to twelve of these 2-hour
operations per day: each unit can do 4 operations in its 8 hours,
and there are 3 running in parallel.

## Capacities Vary Between Shift

Consider the same example, but add a second shift of 8 hours with
only 2 units of capacity. The Scheduler sees this as a work center
having a maximum of 3 machines. The first two are available 16 hours
(8 hours on the first shift, and 8 hours on the second shift), and
the third is available only 8 (8 hours on the first shift). When the
Scheduler loads the operations for this work center, it first looks
at capacity for unit 0 (the first machine). Therefore, it may schedule
up to 16 hours of time on that machine. If neither the first nor second
machine are available, then the third is used, which has only 8 hours
available on this day on the first shift.

It is important to note that this operation remains on this unit
for its entire duration. This means that the operation is not eligible
to use extra second shift time on the next day whether it is available
or not, or any day because there is no third machine on second shift.
The assumption is that you cannot move the operation from this machine
once it has begun. This may often be reasonable for a quantities of
one, or any time there is significant setup involved, but it may be
problematic when varying capacity is caused by staffing. In this case,
an operator can move between machines. You can raise the priority
of the work order to correct this problem.

When the Scheduler starts an operation, if units 0 and 1 have load
and unit 2 does not, the Scheduler starts with unit 2. However, if
either unit 0 or 1 become available and the Scheduler finds a better
schedule on 0 or 1, then it chooses the better scheduler. This means
that in the forward direction, the Scheduler will delay the start
of the schedule if it results in an earlier finish. In the backward
direction, the Scheduler will choose an earlier finish date if it
results in a later start (perhaps due to more capacity duration.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help