Operations




# Operations

Operations represent one step in the manufacturing
process that is performed using a single resource. In terms of scheduling,
material planning, and costing, operations are the most basic components
of the manufacturing process.

An Operation Sequence Number is assigned to each operation on a
leg. Each leg has its own sequence of numbers. These components are
used to identify an operation:

Base ID - Identifies the master or work
order

Lot/Eng ID - Identifies the work order
lot, or revision of the master

Split ID - Identifies sub-lot produced
by a lot split

Sub ID - Identifies the leg on which the
operation exists

Operation Seq. No. - Identifies the operation
among the others on the same leg

Infor VISUAL supports two classes of operation:

In-house Operation - This is an operation
performed using the equipment, labor, and other resources of your
plant.

Sub-contracted Operation - This is an
operation where in-process material is shipped from your facility
to have one or more operations performed on it by a contracted service
vendor.

## Operation Resources

Each operation uses one and only one primary resource. Define VISUAL
shop resources in Shop Resource Maintenance.

VISUAL resources are divided into three classes:

Work Center - A piece of equipment, grouping
of equipment, work area, production line, or any other facility that
is scheduled, managed, and costed as a single unit.

Individual/Team - A person or team of
persons with a particular skill set or role. Again, the key factor
is the scheduling and management of this resource as a unit with a
specific capacity and calendar.

Sub-Contractor - Specifies a particular
kind of subcontract resource that is supplied by an external vendor.
Unlike the other two resource types, schedule and capacity are not
maintained by you. When specifying a Sub-Contractor resource, you
also specify a Service ID that indicates the actual service you want
to use to fulfill this resource requirement.

Concurrent Resources - You can also specify
subordinate setup and run resources for an operation. These must be
of the Individual/Group type, and indicate a person or persons that
are needed to setup and run an operation. Specification of concurrent
resources allows the scheduler to constrain the schedule when the
work center capacity is greater than the labor capacity needed to
staff it.

## Operation Quantities

Work orders always specify a number of pieces or amount of material
for the order to complete. This is the desired quantity. The system
manages the production of the desired work order quantity at the operation
level by tracking two basic quantities:

Start Quantity - The number of pieces
or amount of material entering the operation, from the previous one.

End Quantity - The number of pieces or
amount of material leaving the operation. These pieces either flow
to the next operation, or to finished goods. If this is the last operation,
the End Quantity equals the work order Desired Quantity.

The Manufacturing Window manages these quantities without your intervention,
based on the following information:

Next Start Qty - The Start Quantity required
for the next operation determines the End Quantity needed from this
one. If this is the last operation, then the Desired Quantity for
the work order determines the End Quantity needed.

Scrap/Yield % - You can specify how many
pieces or how much quantity will be lost due to scrappage, or how
much will remain as the final yield. You specify both as a percentage
of the total incoming material.

Fixed Scrap - A fixed number of pieces
or amount of material to be scrapped, often due to setup loss or testing.

The resulting equation is straightforward: Start Quantity for an
operation equals the Start Quantity needed for the next operation,
plus additional quantity to make up any loss due to fixed or variable
scrap in the current operation.

This includes the implied scrap specified by a yield percentage
less than 100%. When no scrap is specified for an operation, the Start
Quantity equals the Start Quantity needed for the next operation.
The Manufacturing Window works backward from the Desired Quantity
for the work order to calculate the Start and End Quantity of each
preceding operation.

When necessary, you are allowed to explicitly override these quantities.

It is important for you to understand Start and End Quantity in
terms of the final yield, and to understand how material requirement
quantities are calculated.

## Minimum Move Quantity

When a product is produced in discrete pieces or quantities that
can be individually processed, you can specify a minimum move quantity
for an operation. This is the minimum number of pieces that can move
from one operation to the next when finished. This allows the schedules
of sequential operations to overlap, because the output of one can
immediately begin to feed the next. When you do not specify Minimum
Move Quantity, all pieces must be completed before the next operation
can start.

## Operation Labor Hours

A key component of an operation's specifications are the setup and
run time required to perform the operation. This data is central to
the estimation of time and cost necessary to perform the operation.

Setup time is always specified in hours. It represents the onetime
labor required regardless of the number of pieces running for the
operation.

You can specify run time in a number of ways. In each case, you
can use the one best suited to the operation. Supported units are
hours per piece, pieces per hour, minutes per piece, pieces per minute,
loads per hour, and hours per load. The last two options allow the
specification to be constrained by any standard load size that is
required for the resource. When you use this, you must also specify
a loadsize in pieces. For example, a heat treating facility might
be capable of processing one load of 100 parts at a time, a load taking
4 hours. You can specify the time as 4 hours per load, with a loadsize
of 100. If 150 pieces are needed, the estimated time is 8 hours, since
two loads are required.

The system uses setup and run time specified in an operation for
estimation and projection only. Actual hours are always obtained from
labor tickets recorded against the operation.

## Standard Operation Rates

Costs for an operation are estimated by multiplying labor hours
applied by the standard rate for the operation. Run costs can also
be determined based on quantity completed, rather than hours worked.
These costs include both direct Labor, and Burden. The different options
for each rate can be used simultaneously, and all add together.

|  |  |
| --- | --- |
| Rate | Specified As |
| Setup Labor | Setup Cost per Hour |
| Run Labor | Run Cost per Hour or Run Cost per Unit Completed |
| Setup Burden | Burden per Hour, or as a Burden % of the Run Labor cost |
| Run Burden | Burden per Hour, or Burden per Unit Completed, or Burden % of the Run Labor cost |
| Fixed Burden | Onetime dollar value associated with the operation |

Sub-contract rates are specified strictly in terms of Run Cost per
Unit.

When you specify the resource for an operation, the standard rates
are copied into the operation. Although you can override them at this
point, the standard rated only provide cost estimations for the operation.
Actual cost rates are taken from the resource master, for standard
costing, or from the employee's pay rate, for actual costing.

## Operation Costs

Operations contribute to work order costs in
the following way:

In-house Operations - Labor and Burden
costs are incurred based on the number of hours worked on the setup
and run phases of the operation. Run costs can also be calculated
based on the number of pieces produced, rather than the hours worked.
VISUAL allows you to use these methods in combination, even within
the same operation.

Cost calculation depends upon the method of costing in use. For
standard costing, VISUAL uses the standard cost rates you specified
in the resource master. For actual costing, the system uses the labor
rate of the employees performing the tasks.

Costs generated by material requirements for an operation are also
considered to be part of the operation's overall cost. See Material
Requirements for more information on these.

Sub-contracted Operations - Subcontracted
operations have their own cost category - Service cost. All costs
incurred for subcontracted operations are accumulated in this category.

## Operation Scheduling

The Global Scheduler determines a shop schedule for each resource.
The Scheduler schedules operations using the following information
that you specify with the operation:

Setup Time - Applied one time for the
operation.

Run Time - Applied based on the incoming
quantity of the operation.

Setup Overlaps Previous Operation - If
you select this check box, then the set up of the operation is scheduled
to begin before the previous operation is completed.

Move Hours - You can also specify a number
of move hours for an operation. This is the actual clock time necessary
between this operation and the next, because of transportation time
or other factors that don't allow immediate start of the next operation.
Move hours drives the scheduling process only. It does not contribute
to the cost of the work order.

Setup time, run time, and move time for all previous operations
define an implied lead time for this operation - the production hours
between the start of the first operation and the time when this operation
can begin.

Minimum and Maximum Capacity - Shop Resource
Maintenance allows the specification of one or more units of capacity
for a work center or individual/group resource. When the Scheduler
schedules for that resource, it has a number of concurrent units with
which to work.

When you specify Minimum Capacity Use for an operation, the Scheduler
does not schedule the operation unless it has at least the minimum
number of units to use. The default is one - any available unit is
used to run the operation.

When you specify Maximum Capacity Use for an operation, the Scheduler
does not schedule the operation to use more units at once than the
maximum - even if more units are available. The default is the minimum
capacity use. This parameter can prevent a specific operation from
using all of a resource. It is also useful if there is an actual physical
maximum.

Concurrent Resources - These are required
in parallel with the setup and/or run of the primary resource.

Material Requirements - During scheduling,
if material availability checks are enabled, the Schedule does not
schedule an operation to start unless material is planned to be available.
If no actual material supply is planned, the lead-time for material
acquisition is included in the scheduling process.

Maximum Percent Complete A value can
be specified in this field only if the Quantity Complete by Hours
check box is selected. If a value is specified in the Max Percent
Complete field, then a percentage of the hours for the operation remains
on the schedule until the operation is manually closed.

For example, presume an operation takes 10 hours to complete and
80% is specified in the Maximum Percent Complete field. For the first
8 hours of labor reporting, percentage of completion is updated and
the amount of time remaining on the operation is reduced. After 8
labor hours have been reported, updates to the percentage of completion
stop and 2 hours remain on the schedule until the operation is manually
closed. An operation can be manually closed by indicating that the
run is complete on the labor ticket or by changing the operations
status in the Manufacturing Window.

All hours that are reported for an operation, including hours logged
after the maximum percent complete threshold has been reached, are
recorded for costing purposes.

## Operation Actuals

This section covers information associated with an actual operation
on a work order. The following additional information is associated
with such an operation:

Status - Operations have their own private
status - they can be released or unreleased independently. An operation
is automatically closed when the reported Quantity Complete meets
the End Quantity required. The system maintains the close date of
an operation. For operations, an additional status indicates whether
the setup portion of the operation has been completed.

Scheduled Start Date - The date on which
the operation is scheduled to start.

Scheduled Finish Date - The date on which
the operation is scheduled to finish.

Labor Hours - The setup and run hours
actually performed against the operation, as reported through labor
ticket entry.

Quantity Completed - Total quantity of
goods so far reported completed from the operation, through labor
ticket entry.

Quantity Deviated - Total quantity of
rejected goods reported for the operation, through labor ticket entry.

Labor Tickets - Labor tickets report completion
quantities and labor hours against a work order operation. These are
permanently linked and can be viewed if necessary.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help