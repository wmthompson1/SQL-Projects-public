Work order Scheduling Inputs




# Work Order Scheduling Inputs

This section outlines the information taken from work
orders in creating a global schedule.

## Scheduling Mode

The Concurrent Scheduler schedules each work order in one of two
modes, which you can control at the work order level.

## Backward Schedule

Scheduling of the work order will be driven by the work orders
Want Date, essentially working backwards from the final operation
to schedule each preceding one.

## Forward Schedule from Release Date

Scheduling of the work order is driven by the work orders Release
Date, working forward from the first operation to schedule each subsequent
one.

## Operation Duration

Each work order operation has a calculated Start Quantity feeding
into it, which depends upon the work order desired quantity and scrap
levels on down-line operations. Run hours is calculated based on the
specified Run time, Run Type, and Loadsize (if used).

Total labor hours required for an operation, and therefore total
resource-hours needed, can then be determined by:

Resource Hours = (Setup Hours x #Machines) + (Start Quantity x Run
Hours / #Machines)

An additional factor is any specified Move Hours for the operation.
Although these do not produce load on the resource, they affect when
the next operation can begin. The effective duration of an operation
is then given by:

Operation Duration =  Resource-Hours + Move Hours

  =  Setup Hours + (Start Quantity x Run Hours/Quantity)
+ Move Hours

For a service operation, the following is used:

Operation Duration = Transit Days

## Operation Overlap

These formulas are actually only correct when no overlap applies.
The Minimum Move Quantity of an operation allows you to specify how
much of an operations pieces or quantities must be completed before
they can begin to feed the next one. This causes the Could Start Date
for an operation to become more favorable (later for a backward schedule,
earlier for a forward schedule).

For example, if an operations End Quantity is 100, and Minimum
Move Quantity is 50, then the next operation can begin halfway through
the previous ones duration. This assumes that the run rates are equal.
If the consuming operation has a faster run rate than the supplying
operation, then it starts later than half way through so that it does
not run out of pieces before the supplying operation has finished
producing them. In terms of the leadtime discussed previously, this
effectively cuts the run portion of this operations duration in half.

## Subassembly Legs

Each subassembly of a work order is essentially scheduled independently
in terms of starting date. The completion of the last operation of
a subassembly determines when its parent operation can begin, in the
same way a previous operation would. Where both apply, the latest
one determines when the next operation can start. The Minimum Move
Quantity for the final operation of a leg allows an overlap with its
parent operation, in the same way as previously discussed.

## Operation Start Date and Status

If an operation is already started (released) when the Scheduler
is run, then its completion status is taken into account. If setup
is marked as completed, the setup time for the operation is not scheduled
in. Quantity Completed is compared against End Quantity to prorate
the remaining time required for the operation. You can optionally
schedule started work orders first, either freezing or not freezing
started operations after being scheduled.

## Service Start Date

For subcontractor operations, the Service Receipt Entry/Service
Status function is used to indicate a date when materials were shipped
to be serviced. When running a new schedule, this date is used to
deduct from the required Transit Days of this operation based on the
fact that it has already started.

## Material Lead Time

If Check Material Availability is being used, then material acquisition
leadtime enters into the situation in the same way as operation lead
time. In this case, start dates of operations are constrained by material
availability. If material is planned to be available in time for an
operation start, then it is not affected. If material can be made
available for the operation start, then its date is also not affected.

Consider, on the other hand, a special material that is not in stock,
with a lead time of 15 days. If the current shop resource loading
would allow the operation to start 5 days from today, Check Material
Availability pushes the operation out to the full 15 days, affecting
all dependent operations as well.

In checking material availability, VISUAL considers four things.
First, current inventory levels might show a sufficient quantity to
meet a requirement. Second, outstanding purchase orders may show additional
quantities that are planned to be received. Third, the parts lead
time shows the maximum time that must be waited for the material,
if the current and planned orders dont meet the need. And finally,
VISUAL considers materials expected from planned work orders.

## Concurrent Resources

If concurrent Setup and Run resources are specified for an operation,
these add parallel resource-hour requirements for the resources specified.
The capacity and calendars of those resources are used to schedule
in the same way as the primary resource. The calendars of the concurrent
resources can constrain the scheduling of the primary resource.

## Discontinuous Operations

The Scheduler supports discontinuous scheduling of operations. You
can set up a shop resource so that operations using that resource
are scheduled discontinuously.

You can overwrite the default values setup in Shop Resource Maintenance
by editing the operation in the Manufacturing Window.

During scheduling, when a load conflict occurs on a unit, the scheduled
duration of run on that unit is compared with the minimum segment
size. If the scheduled duration is at least the minimum segment size,
then the Scheduler creates a "segment" schedule from that
unit. Scheduling continues until a collection of "segment"
schedules is found, disjointed with respect to time, that is sufficient
to successfully schedule the operations duration.

Each scheduled disjointed segment is independent of any other, containing
its own setup and assigned units. Therefore, any segment may use different
units from any other and depending on usage min/max settings, may
have a different number of units than any other segment.

## Resource Minimums and Maximums

The Scheduler schedules quantities of the same operation to run
in parallel on multiple units of resource. For each operation, you
can specify the minimum units required to start the operation. The
operation is not scheduled to run at all unless at least this many
simultaneous units are available. You can also specify the maximum
an operation will use. This is particularly useful if you dont want
an operation scheduled in parallel at all specify a maximum of 1.
Leaving the maximum set to Null defaults to 1.

## Work Order Priority

The Concurrent Scheduler allows you to prioritize work orders on
a scale of one to fifty. In situations where work orders compete for
the same resource, this decides which takes priority.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.md) User-defined Help