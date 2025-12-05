Time Buffers




# Time Buffers

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

For work orders that do not use the CCR, the shipping buffer represents
a generous allowance of time for all work to be done once you have
issued material to a work order. Because you produce these work orders
free of the constraint resource, these work orders are sometimes called
"Free Orders." The time for you to actually perform all
of the work that must be done on "Free orders" is usually
quite small when compared to the shipping buffer time.

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

## User-defined Buffers

For made-to-order parts (not stocked), user-defined buffers provide
extra buffer protection to either a particular operation or to a particular
leg. You can specify these buffers on engineering masters or on individual
work orders.