Identifying the CCR




# Identifying the CCR

To determine which of your resources are CCRs, you must calculate
your resource planned load.

To find your resource planned load:

1. Select Scheduling,
   DBR Scheduler.
2. Select the production
   schedule. If you are licensed to use multiple sites, select the
   production schedule for the appropriate site.
3. Select File,
   DBR Schedule.
4. In the Options section,
   select Create DBR Product Schedule Only.
5. Click Ok.
6. After the scheduler
   runs, select File, Planned
   Load.
7. Specify this information:

Resource ID 
To view planned load information for a particular resource, select
the resource. Only the resources whose load you are monitoring are
displayed. To view planned load information for all resources whose
load you are monitoring, select \*All\*.

Calculation Date 
The current date is inserted. You cannot edit this field. This date
is used in conjunction with the value you specify in the Load Horizon
field to determine the date range to use to search for demand.

Load Horizon 
Specify the number of days from the Calculation Date to look for demand.
The value you specify here determines the end date of the demand horizon.

Create a Horizon Every 
To specify a subset of the load horizon, specify the subset in this
field. For example, if you specified 30 in the Load Horizon field,
but wanted to view demand information for every two days, specify
2 in this field.

Show Intermediate Horizons 
To display a line for every horizon subset as defined in the Create
a Horizon Every field, select this check box. To display a single
line for the horizon duration specified in the Load Horizon field,
clear this check box.

Apply Calendar Exceptions 
To take into account any calendar exceptions, select this check box.
To ignore calendar exceptions and use the standard shop schedule in
the load analysis, clear this check box.

8. Click Generate.
   The load for horizon you specified is calculated.