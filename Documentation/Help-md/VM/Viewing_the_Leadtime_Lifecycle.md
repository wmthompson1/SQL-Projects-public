Viewing the Leadtime Lifecycle




# Viewing the Leadtime Lifecycle

To view the Leadtime Lifecycle:

1. Perform one of these
   steps:
2. Select Sales, Estimating Window.
3. Select Sales, Customer Order Entry.
4. Select Sales, Order Management
   Window.

2. Select the quote or
   order.
3. If the quote or order
   has multiple lines, select the line.
4. Select Info,
   Leadtime Lifecycle.
5. This information is
   shown about the entire lifecycle:

% Overall The
percentage complete of the entire lifecycle. You can decide whether
to measure this percentage based on the number of steps in the process
or the number of days in the process. See [Selecting
a Measurement Basis for the Overall Percent Complete Calculation](Selecting_a_Measurement_Basis_for_the_Overall_Percent_Complete_Calculation.md).

Part The part
from the order or quote line.

Overall Leadtime
The total number of days in the standard leadtime process.

Leadtime Due Date
The date that the order would be complete if the leadtime process
is completed on time. This date is calculated by adding the overall
leadtime to the start date of the quote or the sales order, whichever
is earlier. Only work days as defined in your global calendar are
included in the calculation.

Quote Date The
date specified in the Quote Date field in the Estimating Window. This
information is displayed only when you access the lifecycle from the
Estimating Window.

Order Date The
date specified in the Order Date field in the Customer Order Entry
window or Order Management Window. This information is displayed only
when you access the lifecycle from a sales order.

Line Number
The line number of the quote or order selected in step 3.

Total Projected Days
The total number of days that it is anticipated to take to complete
the leadtime process.

Projected Date
The date that the process is anticipated to be complete.

Desired Ship Date
The desired ship date specified on the sales order. If you open
the lifecycle from the Estimating Window, this field is blank.

This information is shown about each step
in the lifecycle:

Start The date
that the step was started.

End The date
that the step was completed.

Std Days The
days allotted to this step as specified in Process Type dialog in
Part Maintenance.

Act Days The
actual number of days spent on the step.

Prj Days The
number of days that it is anticipated to take to complete the step.
This calculation is used:

Act Days + ((1 - (% Comp / 100)) \* Std Days)

% Comp The percent
of the step that has been completed. The progress bar at the bottom
of each step also shows percent complete.