Creating DBR Schedules




# Creating DBR Schedules

After you have identified your capacity-constrained resources and
set up buffers for those resources, you can run the DBR scheduler
to schedule work orders on the CCR and create planned purchase orders
for purchased materials.

To create a DBR schedule:

1. Open the DBR Schedule
   window.
2. Select the schedule
   to run.

Note: To run the
DBR Scheduler for all of the active Schedules on your list, click
the DBR Schedule All Active toolbar button. You will be able to select
all of the same settings except the "Delay Orders When No Material"
and "Preserve Previous Schedule" options.

3. Click the Schedule DBR
   Schedule button.
4. Specify this information:

Schedule As Of 
To change the date the schedule starts, specify the date in this field.
The current date is inserted by default.

At Time 
Specify the start time for the schedule. The current time is inserted
by default.

Preserve previous schedule 
If you have previously run a schedule for this CCR and you want to
save the details of that schedule, select the Preserve
previous schedule check box. Any new scheduled items are
merged with the preserved schedule.

Create DBR Production
Schedule Only  To create the DBR production schedule
only, select this check box. When you select this option, existing
supply is matched with existing demand. No new work orders or planned
purchase orders are created. Use this option to identify the CCR.
To generate new work orders and planned purchase orders to meet demand,
clear this check box.

Do Not Switch Op's w/mat'l
w/problem op's  To prevent the scheduler from swapping
problem operations (missing material) it encounters for different
operations that use the same CCR (with material) from a different
work order, select the Do Not Switch Op's w/mat'l
w/problem op's check box. To allow the scheduler to swap problem
operations, clear this check box.

Suppress C/O Allocation
Links Creation  To prevent the scheduler from allocating
supply from work orders to demand from customer order, select this
check box. To allow the scheduler to allocate supply from work order
to demand from customer orders, clear this check box.

At the beginning of a run, the scheduler
deletes any links it created in previous runs but does NOT delete
those set by the user.

Delay Orders When No
Material  To delay work orders until the material requirements
are available, select this check box. To schedule work orders even
if the material requirements are not available, clear this check box.

Mark Unreleased Work
Orders for Reuse  To mark all work orders that are set
to unreleased during the scheduling process so that those work orders
can be reused on the next scheduling run, select the Mark
Unreleased Work Orders for Reuse check box. To prevent
unreleased work orders from being used in a subsequent scheduling
run, clear this check box.

Save Incidental Setups 
To save similar resource setups it encounters between one operation
and the next, select this check box. When you select this check box,
the set up time for a resource can be used for more than one operation.
To allow for set up time for each operation, clear this check box.

Run Save Setup 
To schedule "like" operations (those with the same operation
type) on the same resource, back to back, so that the resource/machine
only needs to be setup for the first operation, select the Run
Save Setup check box. For example, presume you have five "like"
operations to schedule on the same CCR, and each has two hours
of setup time. If you select this check box, the machine is set up
only once, and then all five operations are run through the machine.
This saves eight hours of set up time. If the operations were
not run back to back, the machine would need to be set up for
each of the five operations, taking 10 hours of set up time.

Max Days to Save Setup 
If you are saving resource setups, specify the number of days
after the original setup you want the scheduler to look out in the
schedule to find a "like" operation that can be scheduled
back to back with a given operation.

Generate Exceptions 
To generate part exceptions at the end of the scheduling run, select
this check box. After the scheduler is run, any part exceptions are
displayed. If you do not want to generate exceptions, clear this check
box. You can manually generate the part exceptions in the DBR Scheduler
window by clicking File, Part Exceptions.

Suppress All Processing
Messages  To run the scheduler without stopping for error
messages, select this check box. To generate error messages during
the scheduling process, clear this check box. Issues with scheduling
are stored in the VMDBRSCH.log file.

5. Click OK.

A progress dialog box appears.

When this CCR schedule is complete, the
progress dialog box closes and the appropriate information appears
in the schedule table.

If you have not previously generated buffers
for the CCR that you select, a dialog box appears informing you to
generate/update the appropriate buffers before continuing. Click Yes.

After you run the scheduler, this information
is displayed in the schedule table:

Run Start Date 
The date the schedule was last run is displayed.

Run End Date 
The date the scheduler last completed a scheduling pass is displayed.

Schedule As Of Date 
The date that the schedule starts is displayed.

Problem W/Os 
The number of work orders that were scheduled to be complete
later than the want date is displayed.

Work Orders 
The total number of work orders scheduled is displayed.

Operations 
The total number of operations scheduled is displayed.

Requirements 
The number of material requirements is displayed.