Creating New Work Orders From Engineering Masters




# Creating New Work Orders From Engineering Masters

You can create a new work order by copying an engineering
master, a quote master, or another work order. The New Work Order
from Eng Master command is one of the standard ways to create a work
order for an inventory part.

If you are licensed to use multiple sites, you can
create a work order for one site from an engineering master, quote
master, or work order created in another site, provided that the materials
and resources exist in both sites.

1. If you are licensed
   to use multiple sites, open a work order in the site where you
   want to create a new work order. You have to open an existing
   work order to indicate in which site the new work order should
   be created. If you are creating a work order in your default site,
   you do not need to perform this step.

If you are licensed to use a single site,
you do not need to perform this step. You can create a new work order
from a blank Manufacturing Window.

2. Select File,
   New Work Order, then select from Eng Master from the pop
   out menu.

The Generate New Work Order from Eng Master
dialog is displayed.

3. If you are licensed
   to use multiple sites, click the From Site
   ID arrow and select the site that contains the master to
   copy. If you are licensed to use a single site, this field is
   unavailable.
4. Click the Part
   ID button to select the Part ID and Engineering ID.
5. Enter identification
   of new work order. You can enter the Base ID, Lot ID, and Split
   ID, or allow auto numbering to assign them for you.
6. Specify the want date
   and the release date. By default, the current date is inserted
   in the want date field. The release date is calculated by subtracting
   the part's lead time from the current date. You can specify different
   dates.

|  |  |
| --- | --- |
|  | If you specify a new want date, the release date is not automatically calculated. You must manually specify a new release date. The release date is automatically calculated only when you first specify a Part ID. |

7. Specify the quantity
   to manufacture.
8. Specify this scheduling
   information:

Forward Schedule from
Release Date Select this option if you want VISUAL to forward
schedule the work order.

Treat release date as
hard Select this option to prevent the VISUAL Concurrent
Scheduler from scheduling the work order until its release date arrives.
This can be a global setting for all work orders in all schedules,
for a particular schedule, or per work order, as in this case.

9. Specify the information
   to copy to the work order:

Copy All Document References
Select this option to copy an document references attached to the
master to the new work order.

Copy Reference Designators
Select this option to copy all reference designators for materials
to the new work order.

Copy Alternate Parts
Select this option to copy any alternate parts associated with materials
to the new work order.

10. Click Save
    to create the new work order.

The work order is created with an Unreleased
status.

If your created work order references documents
that cannot be copied because they are not part of the target site,
a message dialog displays allowing you to continue or cancel the procedure.

Note:
If you create a work order from a master that uses obsolete resources,
the system sets the status of the operation that uses the obsolete
resource to cancelled.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help