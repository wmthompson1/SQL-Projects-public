The Master/Work Order




# The Master/Work Order

The term "master/work order" refers to any
of the three objects that you can use in the Manufacturing Window.
The term "header," for example, "work order header,"
sometimes refers to the part of the master/work order that contains
general data for the entire structure. This is to distinguish from
the legs, operations, and material requirements that make up a large
part of the substructure of a master/work order.

## Master/Work Order Identification

Masters and work orders are identified by a number of key fields
that form a logical structure:

Base ID - This is the top-level identification
for a master or work order.

For an engineering master, the Base ID must be the same as the Part
ID that it represents.

For a quote master, the Base ID always matches the Quote ID of the
quotation to which it belongs.

For a work order, the Base ID is sometimes called the Job ID and
uniquely identifies the order.

Lot ID/Eng ID - For a work order, the
Lot ID identifies a specific lot within a larger work order specified
by Base ID. This allows all of the lots to have the same Base ID.

For an engineering master, this field is the Engineering ID, which
allows multiple revisions of the same part. You can use the engineering
ID to maintain multiple variations of the same part. If you are licensed
to use multiple sites, use the engineering ID to create unique engineering
masters for a part that is used in multiple sties.

For a quote master, this field uniquely identifies the quote master
from others attached to the same quote.

Split ID - Split ID uniquely identifies
the child lots of a split work order. This way, all splits can have
the same Base ID/Lot ID as the parent lot. This field allows a manual
split. For engineering masters, this field should always be zero.

Sub ID - Masters and work orders can have
a number of subassembly legs, each of which represents the independent
production of a subassembly required by the parent operation. The
Sub ID uniquely identifies a leg within the work order. The primary
leg is always Sub ID zero.

The first three fields uniquely identify a master or work order.
When taken together, they are usually shown in the following format:
Base ID/Lot ID, Split ID. If Split ID is 0, it is usually not shown.
When used for a work order, the combination is sometimes called a
Work Order ID.

All four fields uniquely identify a leg of a master or work order.
When taken together, they usually appear in the following format:
Base ID-Sub ID/Lot ID, Split ID. When Sub ID is zero, it is usually
not shown.

## Master/Work Order Quantity

The Quantity associated with an engineering or quote master represents
a standard lot size for any work orders produced.

The Quantity associated with a work order is sometimes called the
Desired Quantity, and is the quantity that should be received into
finished goods.

## Master/Work Order Costs

Master/work order manufacturing costs are broken out into four categories:

* Material
* Labor
* Burden
* Service

In short, the total cost for a master/work order in each category
is the sum of those costs for all operations on all legs of the master/work
order.

## Work Order Scheduling

The Global Scheduler schedules work orders; you can view the output
in the Scheduling Window. The following data drives the schedule:

Release Date - The earliest date the work
order can start production.

Want Date - The Date the finished goods
from the work order should be available.

Desired Quantity - The quantity that should
be received into finished goods. This ultimately drives the actual
run time of each operation, and thus the entire schedule.

Forward Schedule - If you set the Forward
Scheduled from Release Date option, then the Scheduler works forward
from the release, trying to schedule the work order for completion
as soon as possible. Otherwise, the Scheduler attempts to have the
work order finish to meet the Want Date of it and all other work orders.

Priority - You can set work order priorities
in the Global Scheduler. Priorities affect which work orders take
precedence over others. By default, all work orders have the same
priority.

Operations & Requirements - Operations
dictate the actual scheduling of individual resources. Material requirements
are important if the Scheduler uses the Check Material Availability
option.

## Work Order Actuals

A work order contains additional data beyond that for a master.
Because it represents an actual instance of production, a work order
must have the ability to track status and scheduling. The following
information is associated with a work order:

Status - This is the master status for
the work order, although sub-components have their own status.

The system considers Unreleased work orders
to be in the engineering process and/or unauthorized for release.

The system considers Firm work orders
to be firm in terms of quantity, release, and want date, but not authorized
to begin. Released work orders can begin production on the scheduled
start date.

Closed work orders are finished productions.

Canceled work orders are not produced.

Scheduled Start Date - Date on which the
work order is scheduled to start by the Global Scheduler.

Scheduled Finish Date - Date on which
the work order is scheduled to finish by the Global Scheduler.

Determinant Path - The "determinant
path" for a work order is the string of operations (a path) that
controls the total duration of the work order. Whereas "critical
path" is the controlling path in an ideally scheduled work order,
the determinant path also takes into account schedule delays caused
by unavailability of resources.

Identifying the determinant path shows the operations, and therefore
resources, that you can focus on to reduce the duration of the work
order. Modifying other operations cannot shorten the duration.

Quantity Received - Total quantity so
far received into finished goods.

Linked Demand - You can directly link
customer orders, customer order delivery schedules, interbranch transfers,
inventory, and other work order's material requirements to a work
order. This can be a one-to-one link, where the order is strictly
for the demand, or can be a reservation, where a work order is planned
to meet a number of demands.

## Master/Work Order Variables

You can set up any number of variables for a master/work order.
These are named items with changeable values. Variables primarily
define material requirements in terms of variable dimensions. For
example, an engineering master to produce a door might specify variables
of length and width. In a material requirement for a piece of sheet
metal, you can specify the area needed in terms of the length and
width. When the system creates a work order for an actual door, you
can set the length and width as appropriate, and the material requirement
quantity is calculated automatically.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help