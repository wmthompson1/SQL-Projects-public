Specifying Drum Buffer Rope Settings




# Specifying Drum Buffer Rope Settings

If you are using the VISUAL Drum Buffer Rope functionality,
specify the following settings:

Allow DBR to Delete Work Orders - Select this check box if you want
to allow DBR to delete work orders.

Scheduling Notch Size in Minutes (1 to 6, or
10) - Specify the number of minutes you want DBR to use for
each Notch.

VISUAL Concurrent Scheduler schedules your work in intervals of
the number of minutes you specify.

You can set the value to be 1 minute, 2 minutes, 3 minutes, 4 minutes,
5 minutes, 6 minutes, or 10 minutes. If you leave the value in the
window blank, VISUAL uses a 10 minutes interval.

For example, if you have a process on a work order that takes 28
minutes to complete, and you set the Scheduling Notch Size to 10 minutes,
the scheduler schedules 3 - 10 minute intervals for the order. This
means that the Scheduler uses more time than is need for the process:
2 extra minutes.

If the process takes 40 minutes, and you have set a Scheduling Notch
Size of 2 minutes, the Scheduler schedules 20 - 2 minutes intervals,
thus not losing any time in the schedule.

Because this does not accumulate to very much time when considering
a few work orders, high Schedule Notch sizes can run into a great
deal of time if you have many work orders with many short processes,
take care to enter an appropriate Schedule Notch time that meets the
needs of your schedule.

Identify Resource with % Planned Load as CCR
- Enter the percentage of load you want to specify as being the threshold
for Capacity Constrained Resource.

For more information on DBR, refer to What is Drum-Buffer-Rope?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm)