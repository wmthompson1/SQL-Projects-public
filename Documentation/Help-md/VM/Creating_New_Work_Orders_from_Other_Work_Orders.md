Creating New Work Orders from Other Work Orders




# Creating New Work Orders from Other Work Orders

You can create a new work order by copying another
work order. Use the New Work Order from Work Order command to copy
a specific work order to produce another. This may be convenient if
the work order was a custom job, or had custom changes to a standard
part.

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

2. Select New
   Work Order from the File menu,
   then select from Work Order from the pop out menu.
3. If you are licensed
   to use multiple sites, click the From Site ID arrow and select
   the site that contains the master to copy. If you are licensed
   to use a single site, this field is unavailable.
4. Click the Base/Job
   ID button to select the Base/Job ID of the work order.
   Enter the Lot ID and Split ID.
5. Enter identification
   of new work order.

You can enter the Base ID, Lot ID, and Split
ID, or allow auto numbering to assign them for you.

6. Enter the desired release
   date, want date, and desired quantity.

Release Date and Want Date default to the
current date. Enter the appropriate dates.

Quantity defaults to one. Enter the quantity
desired for the new work order.

7. Select the items to
   copy to the new work order:

Forward Schedule from
Release Date Select this option if you want VISUAL to forward
schedule the work order.

Treat release date as
hard Select this option to prevent the VISUAL Concurrent
Scheduler from scheduling the work order until its release date arrives.
This can be a global setting for all work orders in all schedules,
for a particular schedule, or per work order, as in this case.

Copy All Document References
Select this option to copy an document references attached to the
master to the new work order.

Copy Reference Designators
Select this option to copy all reference designators for materials
to the new work order.

Copy Alternate Parts
Select this option to copy any alternate parts associated with materials
to the new work order.

8. Click the Save
   button to create the new work order.

VISUAL creates the work order with an Un-released
status.

If you create a work order from a master
that uses obsolete resources, the system sets the status of the operation
that uses the obsolete resource to cancelled.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help