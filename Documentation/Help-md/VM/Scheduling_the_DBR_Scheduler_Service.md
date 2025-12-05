Scheduling the DBR Scheduling Service




# Scheduling the DBR Scheduling Service

After you install the DBR Scheduling Service, specify when the DBR
Scheduling Service should be prompted to run schedules with the DBR
Scheduler.

When you use the service, each of your schedules can be run at a
different time. Repeat this procedure for each schedule you would
like to run with the service. To run a schedule with the service,
the service must be installed for the site specified for the schedule.

To schedule the Scheduling Service:

1. Select Scheduling,
   DBR Scheduler.
2. In the table, select
   the schedule that you will run with the Scheduling Service. Make
   sure you select a schedule from a site for which you have set
   up the Scheduling Service.
3. Select File,
   Set as Scheduled. The ID of the schedule
   you selected is displayed.
4. Specify this information:

Preserve previous schedule
If you have previously run a schedule for the CCR and you want to
save the details of that schedule, select the Preserve previous schedule
check box. Any new scheduled items are merged with the preserved schedule.

Create DBR Production
Schedule Only To create the DBR production schedule only,
select this check box. When you select this option, existing supply
is matched with existing demand. No new work orders or planned purchase
orders are created. Use this option to identify the CCR. To generate
new work orders and planned purchase orders to meet demand, clear
this check box.

Do Not Switch Op's w/mat'l
w/problem op's To prevent the scheduler from swapping problem
operations (missing material) it encounters for different operations
that use the same CCR (with material) from a different work order,
select the Do Not Switch Op's w/mat'l w/problem op's check box. To
allow the scheduler to swap problem operations, clear this check box.

Suppress C/O Allocation
Links Creation To prevent the scheduler from allocating supply
from work orders to demand from customer order, select this check
box. To allow the scheduler to allocate supply from work order to
demand from customer orders, clear this check box.

At the beginning of a run, the scheduler
deletes any links it created in previous runs but does NOT delete
those set by the user.

Delay Orders When No
Material To delay work orders until the material requirements
are available, select this check box. To schedule work orders even
if the material requirements are not available, clear this check box.

Mark Unreleased Work
Orders for Reuse To mark all work orders that are set to
unreleased during the scheduling process so that those work orders
can be reused on the next scheduling run, select the Mark Unreleased
Work Orders for Reuse check box. To prevent unreleased work orders
from being used in a subsequent scheduling run, clear this check box.

Save Incidental Setups
To save similar resource setups it encounters between one operation
and the next, select this check box. When you select this check box,
the set up time for a resource can be used for more than one operation.
To allow for set up time for each operation, clear this check box.

Run Save Setup
To schedule "like" operations (those with the same operation
type) on the same resource, back to back, so that the resource/machine
only needs to be setup for the first operation, select the Run Save
Setup check box. For example, presume you have five "like"
operations to schedule on the same CCR, and each has two hours of
setup time. If you select this check box, the machine is set up only
once, and then all five operations are run through the machine. This
saves eight hours of set up time. If the operations were not run back
to back, the machine would need to be set up for each of the five
operations, taking 10 hours of set up time.

Max Days to Save Setup
If you are saving resource setups, specify the number of days after
the original setup you want the scheduler to look out in the schedule
to find a "like" operation that can be scheduled back to
back with a given operation.

Generate Exceptions
To generate part exceptions at the end of the scheduling run, select
this check box. After the scheduler is run, any part exceptions are
displayed. If you do not want to generate exceptions, clear this check
box. You can manually generate the part exceptions in the DBR Scheduler
window by clicking File, Part Exceptions.

Suppress All Processing
Messages This check box is selected by default. You cannot
clear the check box. If an error is encountered, the scheduler continues
to run. Issues with scheduling are stored in the VMDBRSCH.log file.

5. Specify when the service
   is active. Specify this information:

Start Date Specify
the date that the service should running the DBR scheduler. Leave
this field blank or specify todays date if you do not want to delay
the start of the service.

End Date Specify
the last date that the service should run the DBR scheduler. Leave
this field blank if you do not want to set up an expiration date for
the service.

Enabled To use
the service with the selected schedule, select this check box. To
stop using the service, clear this check box.

6. In the Run Type section,
   weekly is selected. You cannot change this selection. This selection
   indicates that the service should check for updates only on the
   days and times you specify.
7. In the Days of Week
   section, specify the days of the week to run the service.

Use the Run At section to specify the times
of day that the service should run the scheduler. The times you specify
apply to all days that you run the service. You can run the service
up to 6 times a day.

Depending on the polling interval that was
specified when the service was installed, the DBR scheduler might
not be run exactly at the time you specify. At the times that you
specified, the DBR scheduler is flagged as needing to be run. The
DBR scheduler is started when the DBR Scheduling Service polls the
database and finds that the DBR scheduler needs to be run. When you
specify a time, the DBR scheduler could be run at any time between
the time that you specify and the time that you specify plus the polling
interval. For example, if you specify 7:00:00 as the start time and
the polling interval is 600 seconds, then the DBR scheduler is started
sometime between 7:00:00 and 7:10:00.

8. Click Save.