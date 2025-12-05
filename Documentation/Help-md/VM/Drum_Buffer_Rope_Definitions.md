Drum Buffer Rope Definitions




# Drum Buffer Rope Definitions

## Capacity Constrained Resource (CCR)

Capacity constrained resources are resource (occasionally resources)
that you want to plan to use as close to 100% as possible. Though
a few companies may have more than one CCR, typically there is only
one.

## Time Buffers

## CCR Buffer

A CCR buffer is a generous allowance of time for work to reach the
CCR after you have issued material to a work order.

The time to actually perform the work that must be done prior to
the CCR operation is usually quite small when compared to the CCR
buffer time. The purpose of the CCR buffer is to protect the CCR from
being starved for work.

## Shipping Buffer

For a work order that uses the CCR, the shipping buffer is a generous
allowance of the time to perform the operations subsequent to the
CCR, after you have completed the work at the CCR.

The time to actually perform the work that must be done subsequent
to the CCR operation is usually quite small when compared to the shipping
buffer time.

For work orders that do not use the CCR at all, the shipping buffer
represents a generous allowance of time for all work to be done once
you have issued material to a work order. Because you produce these
work orders free of the constraint resource, these work orders are
sometimes called "Free Orders." The time for you to actually
perform all of the work that must be done on "Free orders"
is usually quite small when compared to the shipping buffer time.

The purpose of the shipping buffer is to protect you against missing
the due dates to your customers.

## Assembly Buffer

For multilevel work orders, where one or more legs do not go through
the CCR but are assembled with another leg that does go through the
CCR (at a point downstream from the CCR operation), the assembly buffer
is a generous allowance of time for work to reach the point where
it joins up with a CCR leg once you have issued the material to the
non-CCR leg.

The purpose of the assembly buffer is to protect the shipping buffer
from being consumed by "Murphy" events along the non-CCR
legs. Material release dates are calculated for non-CCR leg materials
by subtracting both the shipping buffer time and the assembly buffer
time from the customer's due date.

## Rods

When a work order has two or more CCR operations that you must perform
sequentially, it is necessary to provide protection to the CCR for
each of the affected operations. The Rod is a generous allowance of
time for you to perform work between the two CCR operations.

## Lead-time Buffer

For stocked materials that you purchase, the lead-time buffer is
a generous allowance of time to comfortably obtain more materials
(including time to place the purchase order).

## Minimum Lead-time

For stocked materials that are purchased the minimum lead-time buffer
is the shortest time in which you could obtain more.

|  |  |
| --- | --- |
| TIP.gif | In VISUAL DBR, time buffers are expressed in hours. When converting buffer hours to days, the "Typical" daily calendar is used. This is either the calendar for "All" Resources that is specific to the schedule being run or the calendar for "All" Resources and "All" schedules if you have not established a calendar specifically for the schedule. |

## Inventory Buffers

## Replenishment Level

For stocked materials, whether you purchase them or make them, when
your on hand quantity plus your on order quantity reaches a level
less than your replenishment level quantity, it is time to place a
replenishment order.

## Emergency Stock %

For stocked materials, whether you purchase them or make them, when
your on hand quantity reaches the Emergency Stock % of the replenishment
level, it is time to expedite the acquisition of more of this material.

In TOC terms, when this happens, the part is in the Red Zone of
its inventory buffer.

## Minimum Batch Size

The minimum batch size is the smallest quantity for which VISUAL
DBR will create a replenishment order.

## DBR Production Schedule (DPS)

The DBR Production Schedule is a list of work orders necessary to
meet all of your customer orders. During the process of creating the
DPS, VISUAL DBR nets supply (inventory plus existing supply orders)
against demand (customer orders). When insufficient supply exists,
VISUAL DBR creates a work order to provide what is needed with the
objective of finishing in time to meet the customer orders that need
it.

## Buffer Factors

VISUAL DBR gives you the ability to establish different buffer sizes
for each product and for each type of buffer. VISUAL DBR accomplishes
this by requiring you to set up typical buffer sizes, then establishing
buffer factors for the types of buffers you want to make different
than the standard. (The default buffer factor is one.) Using a buffer
factor type approach allows you to change the size of a specific buffer
company wide by changing only the typical sizea single number change.

VISUAL DBR applies the existing buffer factor overrides to the new
typical size to calculate the new size for the work orders requiring
an override. The alternative to this method is for you to manually
change hundreds, or thousands, of engineering masters or work orders
when you want to reduce a buffer size.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Overview
of DBR Scheduling

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_DBR_Maintenance.htm) User-defined Help