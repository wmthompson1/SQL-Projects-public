Schedule Inputs




# Schedule Inputs

These items are actually attributes of the schedule
itself or the scheduling run.

## Schedule Type

The Concurrent Scheduler supports two types of schedule: Finite
and Infinite capacity. A finite capacity schedule uses the capacities
defined for each shop resource, while an infinite capacity schedule
ignores any capacity constraints. See [Behind
the Scenes of the Scheduling Process](Behind_the_Scenes_of_the_Scheduling_Process.htm).

## Check Material Availability

This option allows on-hand quantities, planned availability, and
part acquisition lead times to affect the schedule. For more information,
see [Running the Concurrent
Scheduler Manually](Running_the_Concurrent_Scheduler.htm).

## Fit Tolerance

This is the percentage of an operations duration which the scheduling
loading algorithm considers a successful schedule slot for the given
operation. For example, if you have this value set to 90, the Scheduler
looks for a slot into which it can fit 90% of the operation. It is
assumed that the remaining 10% of the operation can be completed in
this 90% time slot. The value must be between 50 and 100 percent.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help