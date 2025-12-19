Behind the Scenes of the Scheduling Process




# Behind the Scenes of the Scheduling Process

So, what happens after you begin
the scheduling process?

Unless instructed to do otherwise, the Global Scheduler
first attempts to backward finite schedule every work order. Backward
indicates that the system initially schedules the final operation,
then the next to last one and so forth. Finite indicates that the
system does not place more load into a time period than there is capacity
in that same time period.

There are three ways to instruct the system to "do otherwise":

* Activate the Infinite Capacity
  checkbox for the Schedule ID, which is not possible for the production
  schedule ID. In this way, all resources could possibly be overloaded.
* Deactivate the Schedule
  normally Checkbox for a Resource ID. In this way, that resource
  could possibly be overloaded.
* Activate the Forward Schedule
  from Release Date checkbox in the header card of a work order.

VISUAL computes the duration of an operation by calculating
the time you need to accomplish the operation remaining quantity (ending
quantity minus completed quantity) plus any setup time for the operation.

When making the initial backward finite schedule for a work order,
the Global Scheduler attempts to load the last operation of a work
order so that it schedules it to finish at the
end of the workday prior to the want date of the work order.
If load from other operations causes a conflict, making it impossible
to fit the entire operation (or the preset "Fit tolerance"
percentage of the operation), the Scheduler searches through progressively
earlier openings in capacity to find a slot in which the operation
fits. The start date for the operation is then calculated based on
the scheduled completion date of the operation.

If you instruct the Scheduler to Check Material Availability, it
checks to make sure that all materials required by the final operation
are available on the scheduled start date of the operation. If a purchase
order line is linked to the material, then the due date of that line
item must be before the proposed scheduled start date for the operation.
If there is no linking and the material has a Part ID, then the Scheduler
checks to see if a sufficient quantity of the material is available
on the proposed start date of the operation. The Scheduler considers
the quantity currently on hand, adding in all supply orders (including
planned orders, purchase orders and work orders for fabricated components)
that are due on or before the proposed start date and subtracting
the quantities needed by all other work orders that have been scheduled
prior to this one that need the material on or before the proposed
start date. The Scheduler uses the line item due date as the "due
in" date for incoming purchase orders and the want date for incoming
work orders that make fabricated components. It also accounts for
demand caused by planned orders. VISUAL first looks for the lead-time
on the work order requirement. If lead-time is not specified on the
work order requirement, then VISUAL looks at the part warehouse for
lead-time. If the lead-time is not specified on either the work order
requirement or part warehouse, then VISUAL uses the lead-time specified
for the part in Part Maintenance. If material is not available, the
Scheduler stops scheduling in the backward direction and begins a
forward finite schedule..

After the Scheduler successfully places the final operation in the
backward direction, it attempts to load the next-to-last operation
of the work order so that it finishes at the same time that it scheduled
the final operation to begin.

Two settings on the next-to-last operation can affect this process:
minimum move quantity and move hours.

When minimum move quantity is not null, the Global Scheduler attempts
to load the next-to-last operation of the work order so that it schedules
the last unit of the minimum move quantity to be done at the same
time it schedules the final operation to begin. The move hours setting
determines the minimum required offset from this optimal positioning.
If needed, VISUAL also checks for material availability.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.md) User-defined Help