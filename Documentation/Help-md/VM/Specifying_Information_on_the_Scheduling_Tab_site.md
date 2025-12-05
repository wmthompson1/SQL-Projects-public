Specifying Information on the Scheduling Tab




# Specifying Information on the Scheduling Tab

Use the Scheduling tab to define the default shop
calendar for the site. The weekly shop calendar defines standard workday
and shift information for your plant. The Global Scheduler uses this
information when producing a shop schedule. You can define calendars
specific to a particular schedule or individual shop resource. Where
neither of these are defined, the calendar specified here is used.
This calendar should therefore define the default work week. Exceptions
for holidays and different work center schedules are handled elsewhere.

If you are licensed to use a single site, set up scheduling information
in Application Global Maintenance. See [Specifying
Scheduling Information](Specifying_Scheduling_Information_Tenant.htm) in Application Global Maintenance.

1. Click the Scheduling
   tab.
2. In the Production Schedule
   section, click Define Production Schedule
   and specify this information:

ID Specify an
ID for the production schedule.

Description
Specify a description for the production schedule.

You can also specify a default production
schedule ID for the site when you access the Global Scheduler. If
you have not yet defined the default production schedule ID for a
site, when you access the Global Scheduler you will be prompted to
define the ID and description for each site that does not have a default
production schedule ID.

3. In the table, specify
   this information:

1st Shift Start
Enter the starting time for the first shift for each day of the
week. By default, the first shift starts in the morning (AM).

Shift 1, Shift 2, Shift
3 For each day that has at least one shift, specify the length
in hours of each shift. If a shift is not worked, enter a 0.

The totals of the three shifts cannot exceed
24 hours.

First Shift is the period of hours starting
at the 1st Shift Start time and ending after the specified number
of hours in the shift. Second shift follows immediately after the
first shift and ends after the specified number of hours. Third shift
is immediately after the second shift; it ends after the specified
number of hours.

For example, if you specify a shift start
of 7:00:00 AM, a first shift length of 8 hours, a second shift length
of 8 hours, and a third shift length of 4 hours, first shift is 7:00
AM to 3:00 PM, second shift is 3:00 PM to 11:00 PM, and third shift
begins at 11:00 PM and runs until 3:00 AM.

4. Use the check boxes
   to define scheduling parameters. The selections you make apply
   to all schedules for the site. Select one or more of these options:

Treat All Release Dates
as Hard in All Schedules To schedule all work orders based
on their hard release dates, select this check box. If you select
this check box, the Concurrent Scheduler schedules no activity on
any work orders in any schedule before the work orders hard release
date, which you specify when you create the work order. If you select
this check box, the Treat release date as hard check box on individual
work orders is not available.

To decide whether to treat the release date
as hard on a work order by work order basis, clear this check box.
When you clear this check box, the Treat release date as hard check
box becomes available on individual work orders. If you clear the
Treat release date as hard check box on an individual work order,
the release date is disregarded, and the work order is scheduled as
time and materials allow.

Use All Supply Before
Applying Lead-time in Material Checks To consider material
supply beyond work orders required dates, select this check box.
When you select this check box, the scheduler ignores a work orders
required date when locating material supply. When sufficient supply
is located, the work order is scheduled. If sufficient supply cannot
be located, then the materials lead time is used to determine when
the work order can be scheduled.

If you select this check box, then all parts
in the site will use all supply before applying lead time. You cannot
override the setting on the part record.

To consider material supply only up to the
work orders required date, clear this check box. When you clear this
check box, the scheduler does not look beyond the required date for
supply when there is insufficient supply at the required date. In
this case, it applies the parts or requirements lead time to determine
if sufficient supply can be obtained by the required date, or to determine
when it can obtain sufficient supply.

If you clear the check box in Site Maintenance,
you can specify on a part-by-part basis which setting to use. In Part
Maintenance, use the Supply Before Leadtime check box specify whether
or not to use the work orders required date when assessing supply.

The Concurrent Scheduler considers purchase
orders, purchase order delivery schedules, Coproducts, work orders,
and, if netting planned orders, planned orders, as supply.

Use Global Calendar and
Exceptions for Fabricated Parts To take calendar exceptions
into account when calculating availability dates for your fabricated
parts, select this check box. By using this setting you can specify
the dates you do not want to use in calculations. Clear the check
box to ignore calendar exceptions.

Use Global Calendar and
Exceptions for Release Dates To take calendar exceptions
into account when calculating release dates, select this check box.
By using this setting you can specify the dates you do not want to
use in calculations. Clear the check box to ignore calendar exceptions.

5. In the Scheduling Notch
   size section, specify the notch size for the schedule. To set
   the notch size to one second, select the One second check box.
   When you select this option, the In Minutes field is unavailable.
   To set the notch size in minutes, clear the One second check box,
   then specify a notch size in the In minutes field. You can specify
   any whole number from 1 to 6; for example, specify 2 for a notch
   size of two minutes. You can also specify 10 for a notch size
   of 10 minutes.
6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User Defined Help