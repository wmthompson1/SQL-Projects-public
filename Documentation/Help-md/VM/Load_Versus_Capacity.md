Load Versus Capacity




# Load Versus Capacity

Load and capacity are two dimensions of a schedule.
Load is the total amount of work hours scheduled for a given resource,
while capacity is the maximum amount of work hours a resource is available
for each shift of each day, and how many units of capacity are available
during that period. If the load for a job exceeds the capacity, you
cannot complete the job on-time unless you assign additional resources
to handle the excess load.

For example, if a work center has 3 machines that operate 8 hours
per day, the work center has 24 resource-hours of capacity. If you
are scheduling a job that requires 32 resource-hours (load), you need
to assign an additional resource (perhaps one extra machine working
one 8 hour day) to handle the excess load.

## What is Load?

The three dimensions of load are:

* which resources
* when
* how much

The when and how much dimensions are expressed in three measurements:
date/time, numbers of hours, and units.

Only firmed and released operations of work orders can cause load.
The only exceptions are temporary loads created by on-line availability
checks or by MRP-generated planned orders in schedules other than
the production schedule.

## What is Capacity?

There are two dimensions to capacity:

* when
* how much

The when dimension is expressed in date/time format; the how much
dimension is expressed in number of units format.

In VISUAL, the time dimension (when) of capacity may be different
for each day in the foreseeable future. It is expressed for each day
in terms of starting time of first shift and numbers of hours each
on first, second and third shifts. The number of units dimension (how
much) is expressed as the number of tasks or operations that can occur
at one time in each of three shifts. For example, it is possible that
you work more than one shift per day, yet do not have identical levels
of staffing on each shift.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.md) User-defined Help