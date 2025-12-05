Analyzing Planned Load Information




# Analyzing Planned Load Information

Because the object of using Drum-Buffer-Rope is to create a schedule
based on your capacity-constrained resources, it is important that
you declare as CCRs ONLY those resources that are true constraints.

It is up to your management team to declare the resources that should
be treated as CCRs. In order to help your management team arrive at
that decision, DBR has a utility that shows planned load for each
resource.

You can use the information in the Planned Load dialog box to identify
the CCR. A resource that has the most total hours of planned load
per unit in the future is a CCR candidate. A resource that has the
highest percentage of its load ready to be worked on right now is
another CCR candidate, as it reflects the fact that a lot of work
is currently stuck in front of that resource.

The Planned Load information provided can show planned load as a
single total per resource over the entire demand horizon or can be
broken down into subtotals based on a time period you choose. When
you break the demand horizon down into subtotals, you can pinpoint
when a resource may become a CCR in the future.

The Resource Planned Load table contains the following ten columns:

Resource ID The Resource ID column contains
the names of your resources.

Horizon  The Horizon column contains
the number of days horizon for the planned load you generated.

Load per Unit  The Load per Unit
column contains the planned load in hours per unit figures that the
program calculates based on the current state of your work orders
at your resources.

Load with Material per Unit  The
Load Available per Unit column contains the amount of the load in
hours that has all of its material available on which you can work.
For example, the full quantity needed to be done at that operation
is available for you to work on now.

% Load with Material per Unit  The
% Load Available per Unit column contains the amount of the load (in
percentage) per unit that is available for you to schedule.

# of Resource Units  The quantity
of each of your resource units appears in the # of Resource Units
column.

Planned Load The Planned Load column
contains the hours of planned load for the resource.

Planned Load with Material  The
Planned Load Available column contains the total number of hour with
material available.

Hour of Capacity The total number of
hours of capacity available for this resource.

% Load per Capacity What percent of
resource capacity consumed by the load.

% Load with Material per Capacity 
The percentage of the load available because the material has been
reported complete at the previous operation.

Could Finish  The date on which
the specified resource could finish the entire planned load appears
in the Could Finish column. This calculation assumes that all necessary
materials are available.

Available Could Finish  The Available
Could Finish date is the date on which the planned load could be scheduled
to finish on the specified resource. For the available could finish
date, the only constraints the scheduler takes into account are those
of the shop calendar.