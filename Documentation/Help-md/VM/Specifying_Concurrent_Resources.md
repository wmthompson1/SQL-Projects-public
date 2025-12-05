Specifying Concurrent Resources




# Specifying Concurrent Resources

An operation can require more than one shop resource. The additional
resources are used concurrently with the resource you specify in the
operation card header. Specify the additional resources on the Advanced
tab.

1. Select Eng/Mfg,
   Manufacturing Window.
2. Open the engineering
   master, quote master, or work order.
3. Open the card for the
   operation to which you are adding a concurrent resource.
4. Click the Advanced
   tab.

The Concurrent Resources information is
displayed.

5. Click the Insert
   Row button.
6. Specify this information:

Resource ID
Specify the ID of the resource that runs concurrently with the resource
specified on the operation.

Setup If the
resource is used concurrently during the setup of the operation, select
this check box.

Run If the resource
is used concurrently during the run of the operation, select this
check box.

Duration % Specify
the percentage of the total operation time that this resource is used.
For example, if the resource is used during half of the total operation
time, specify 50.

At Start  If
the resource is concurrent from the start of the operation, select
this check box. If the resource is concurrent at the end of the operation,
clear this check box.

# Mem to Schedule
If you specified a group resource in the Resource ID column, and
the group schedules its members individually, specify the number of
members in the group to schedule. A group resource schedules its members
individually when the Schedule One option
is selected in the Group Exclusivity section in Shop Resource Maintenance.
See [Adding a New Shop Resource](VMRESMNTfrmShopResource.htm).

The total duration of the run time is split
among the number of members that you schedule. For example, presume
the total run time for an operation is 5 hours. If you specify 100%
in the Duration % column and 2 in the # Mem to Schedule column, then
each member is scheduled for 2.5 hours. For setup time, the full setup
duration is scheduled for each resource.  For example, if the
setup time on the operation is 2 hours, and you specified 50% in the
Duration % column and 2 in the # Mem to Schedule column, then each
member is scheduled for one hour of setup time.

# Group Members
If you specified a group resource in the Resource ID column, and
the group schedules its members individually, the total number of
members in the group is displayed in this column.

Sched Eq. Cap.
Select this check box to schedule the concurrent resource on the
same number of units as the primary resource in the operation. For
example, if you specified 2 in the Capacity use - max and Capacity
use - min fields on the Other tab, select this check box to also use
two units of the concurrent resource. If the concurrent resource is
a group resource, and the group schedules its members individually,
you must specify 1 in the # Mem to Schedule column before you can
select this check box.

7. Click Save.

After you save the concurrent resources, a letter C is displayed
outside the upper left corner of the graphical operation card. The
C indicates that concurrent resources are present for this operation.
The C is displayed in the Graphical display mode only.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help