Scheduling Outputs




# Scheduling Outputs

For each work order, the Scheduler produces the following
information:

## Start Date & Finish Date

For each operation, a start and finish date is determined. The start
date of the work order is implied by the start date of the first operation.
The finish date is implied by the finish date of the last operation.
For resources with multiple units of capacity, an operation may be
scheduled to run on more than one simultaneously. In general, each
schedule entry specifies a start and end time on a specified unit
of a resource.

## Determinant Path

The determinant path is the set of operations in a work order that
controls the duration of the work order. This is measured AFTER resource
constraints are taken into account. Such a path measured before considering
these constraints could be called a "critical path."

The determinant path operations appear in the Scheduling Window
as green bars. Late determinant path operations appear as olive bars.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.md) User-defined Help