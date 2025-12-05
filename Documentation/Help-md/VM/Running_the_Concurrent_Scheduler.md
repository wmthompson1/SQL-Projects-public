Running the Concurrent Scheduler Manually




# Running the Concurrent Scheduler Manually

After you have created any new schedules and activated
any existing schedules, use the Global Scheduler to initiate a global
schedule.

There are two scheduling options:

* Global Schedule
* Global Schedule all Active

Global Schedule requires that you select
a schedule to run. The Global Scheduler processes only one schedule
using this function.

Global Schedule All Active processes all
schedules that are marked as active.

The Scheduler sorts all work orders eligible for scheduling (firmed
and released work orders) in order by their priorities, then by want
date and then release date within each priority group. Thus, if any
two work orders have the same priority, the Scheduler uses the want
date then the release date to determine the sequence in which to schedule
them.

The Scheduler loads only firmed and released operations and materials.
It first attempts to schedule work orders backwards from the want
date to determine if there is enough capacity and time (according
to the calendar which applies to the schedule in question) to complete
each operation.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help