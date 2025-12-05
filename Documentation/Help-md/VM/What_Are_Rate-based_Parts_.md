What Are Rate-based Parts?




# What Are Rate-based Parts?

A rate-based part is a fabricated part that you produce in predictable
daily quantities. Because the daily run rate is predictable, the quantity
produced per day is used to determine when supply of the part is anticipated
to be available to meet demand.

When you sell a rate-based part, the daily rate is used to calculate
when the part is projected to be available to meet customer demand.

When a work order consumes a rate-based part in a material requirement,
the work order can be scheduled to begin earlier than if the part
is not rate-based. For example, presume you have work orders with
these parameters:

| Work Order 001 | Produces 100 Part A |
| Work Order 002 | Requires 10 Part A for production |

If Part A is not a rate based part, then work order 002 would be
scheduled to start after work order 001 is due to be complete.

If Part A is a rate based part, then work order 002 would be scheduled
to start after work order 001 produces 10 parts. If work order 001
produces 10 parts per day, then work order 002 would be scheduled
to start one day after work order 001 starts.