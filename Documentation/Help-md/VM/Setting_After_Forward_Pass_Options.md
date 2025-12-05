Setting After Forward Pass Options




# Setting After Forward Pass Options

Use the After Forward Pass tab to select what you
want the Scheduler to do after a forward scheduling pass.

1. Click the After
   Forward Pass tab.

The After Forward Pass options appear.

2. Select the appropriate
   schedule forward options.

|  |  |
| --- | --- |
| TIP.gif | The following three options apply only to forward-scheduled work orders. Forward-scheduled  work orders are work orders for which you have set the Forward Schedule from Release Date option in the Manufacturing Window. |

Backward Schedule
- Select this option button if you want the VISUAL Concurrent Scheduler
to attempt the backward scheduling of work orders for which you have
set the Forward Schedule from Release Date option, after attempting
to schedule using a forward pass.

Backward Schedule if
On Time - Select this option if you want the VISUAL Concurrent
Scheduler to attempt to schedule work orders for which you have set
the Forward Schedule from Release Date option in a backward direction
if they are on time after a forward pass. This option allows the VISUAL
Concurrent Scheduler to adjust the position of these work orders in
a schedule. For example, by backward scheduling already on-time work
orders, the VISUAL Concurrent Scheduler may be able to move the release
date of a work order closer to its want date and thereby free up resource
capacity and eliminate lag time that may exist if a forward-scheduled
work order completes without delay and there are still a considerable
number of days until the want date arrives.

Do Not Backward Schedule
- Select this option button if you do not want the VISUAL Concurrent
Scheduler to backward schedule work orders for which you have set
the Forward Schedule From Release date preference. The work orders
release date as you set it in the Manufacturing window determines
its position in the schedule.

3. If you want to preserve
   the determinant path, select the Preserve Determinant
   Path check box.

The determinant path is the set of operations
in a work order that controls the duration of the work order. This
is measured AFTER the Scheduler takes resource constraints into account.
You can call the path that the Scheduler measures before considering
these constraints a critical path.

The determinant path operations appear in
the Scheduling Window as green bars. Late determinant path operations
appear as olive bars.

4. Choose what to do with
   work orders that you have not set to be forward scheduled from
   their release date. The same three options apply.

Backward Schedule
Select this option if you want the Concurrent Scheduler to attempt
the backward schedule of work orders after a forwards pass. If the
Concurrent Scheduler has already scheduled a work order in a backwards
direction, the work order stays where it is in the schedule.

Backward Schedule if
On Time Select this option if you want the Concurrent Scheduler
to attempt the backward schedule of work orders after a forward pass
if the work order is on time at that point. If the Concurrent Scheduler
has already scheduled a work order in a backward direction, the work
order stays where it is in the schedule.

Do Not Backward Schedule
Select this option if you do not want the Concurrent Scheduler to
attempt a backward scheduling pass of work orders after a forward
pass.

5. If you want to preserve
   the determinant path, select the Preserve Determinant
   Path check box.

6. If you are finished
   making changes to your scheduling preferences, press click the
   OK button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Concurrent_Scheduler_Preferences.htm) Setting Concurrent Scheduler Preferences

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Allocation_Options.htm)
Setting Allocation Options

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Material_Options.htm)
Setting Material Options