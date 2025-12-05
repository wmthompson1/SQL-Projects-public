Viewing Work Order Audit Details for a Schedule




# Viewing Work Order Audit Details for a Schedule

Use the Work Order Audit dialog box to view information about the
actions the scheduler took to schedule work order operations. This
information is generated only if you selected the Generate audit records
check box in Preferences.

To view work order audit information:

1. In
   the DBR Scheduler window, select the schedule to use.
2. Select File,
   Show Work Order Audit.
3. By default, the work
   orders for the schedule you selected in the DBR scheduler are
   displayed. To view work order scheduled with a different schedule
   in the same site, specify the schedule in the Schedule ID field.
   To view work orders on all schedules in the site, select \*\*All\*\*.
4. View this information:

Schedule Rank 
The work orders rank is inserted. Work order with a higher rank are
given preference in the schedule.

Work Order ID
The ID of the work order is inserted.

W/O Pass No 
The number of passes the scheduler took to successfully schedule the
work order.

Pass ID The
action taken by the scheduling pass is inserted. These codes are used:

A Assign supply/demand.

C Resolve capacity
constraints.

F Check feasibility.

I Infinite backward
schedule.

L Load from database

M Merge schedules.

R Generate material
release schedule.

S Make-to-stock.

T Push before today
forward.

U Save setups.

V Check DBR planning
schedule viability.

Result The result
of the scheduling pass is inserted. These codes are used:

A Added load.

C Resolved a capacity
constraint.

D Loaded from database.

E Moved to alternate
resource.

F Failed.

H Moved since material
is available.

I Infinite backward
schedule result.

K  Link violation.
The time between the scheduled end of the first operation and the
scheduled start of the second operation exceeds the maximum gap.

L Resolved a load
conflict.

M Resolved a material
constraint.

N  Moved since
material not at the CCR.

O Resolved a conflict
with a make-on-time order.

S Scheduled a make-to-stock
item.

V Moved to schedule
a make-to-stock item.

T  Moved forward
from before today.

U  Saved setup.

V  Moved to
schedule a make-to-stock item.

Y Delayed due to
a validity check.

Start Date The
date that work started on the work order is inserted.

Finish Date
The date that the work order was completed is inserted.

Release Date
The date that the work orders status was changed to Released is inserted.

Want Date The
desired due date of the work order is inserted.

5. To view detailed information
   about a work order, select the work order line and then click
   the Show Detail... button.
6. Each operation scheduled
   on the CCR is displayed. View this information:

Work Order ID
The ID of the work order that contains the operations in the table.

Part ID The
finished good made at the completion of the work order.

Scheduled Rank Out Of 
The operations rank is inserted. Operations with a higher rank are
given preference in the schedule. The total number of operations scheduled
is inserted after Out Of.

Pass Count 
The number of attempts the scheduler made before the work order was
successfully scheduled is inserted.

7. In
   the table, the operations schedule on the CCR are displayed. To
   highlight the operations with a critical material supply problem,
   select the Show Critical Material check
   box. For example, if a work order requires three materials, the
   first with lead time of 10 days, the second with a leadtime of
   6 days, and the third with a leadtime of 25 days, the material
   with the longest leadtimein this case 25 daysis highlighted
   in red to alert you that there may be a potential problem with
   the material that may result in the work order being late. After
   identifying such critical instances in a work order, you can take
   steps to rectify the situation.
8. View this information:

Attempt No The
number of attempt the schedule made to schedule the operation is inserted.

Sub ID The work
order sub ID is inserted.

Seq No The sequence
of the operation within the work order is inserted.

Resource ID
The ID of the resource used in the operation is inserted.

W/O Pass No 
The number of passes the scheduler took to successfully schedule the
work order.

Pass ID 
The action taken by the scheduler is inserted.

Result The result
of the scheduler pass is inserted.

Result Detail
A description of the result is inserted.

Start Date The
date the operation is scheduled to start is inserted.

Finish Date
The date the operation is scheduled to be complete is inserted.

Supply ID If
this operation is linked to supply, the supply ID is inserted.

Early/Late The
number of days early this operation was completed or the number of
days late this operation was completed.

9. Below the table, information
   about the work order is inserted. View this information:

Desired Release Date
The date the work order is requested to be released is inserted.

Desired Want Date
The date the work order is requested to be complete is inserted.

Desired Quantity
The quantity of finished good to be produced by the work order is
inserted.

Sched Start Date
The date the work order is scheduled to start is inserted.

Sched Finish Date
The date the work order is scheduled to finish is inserted.

Received Quantity
The quantity of finished good complete is inserted.

10. To print the work order
    audit information, click the Print button.