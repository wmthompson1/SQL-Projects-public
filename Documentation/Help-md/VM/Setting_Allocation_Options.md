Setting Allocation Options




# Setting Allocation Options

A front-end scheduling scheme is supported by scheduling supplying
work orders ahead of consuming work orders. A list of work orders
is first constructed with either want date or priority taking precedence,
depending upon your choice.

Allocation is determined in this sequence:

1. If the Allocate fabricated
   materials check box is selected, then the system will pass supplying
   work orders to the scheduler before consuming work orders. This
   is done by constructing a new list that re-sequences the work
   orders in the original list. Each work order in the original list
   is processed in sequence as follows:

1. The
   work order is searched for any requirement that has a named part,
   is not linked to a P/O and is not a leg header.
2. For
   each such requirement:

1. * If customer
     demand for the requirements part ID has not previously determined,
     then demand for that part from any customer orders that meet
     the conditions setup in item 1 is determined. This is done
     once for each encountered part ID.
   * If supply
     for customer order demand for the part has not previously
     been allocated, then an attempt is made to allocate supply
     to the demand from qualifying customer orders as follows:
   * + First,
       any available supply is taken from inventory and allocated
       to the qualifying customer orders.
     + Then,
       if there is insufficient supply in inventory for the customer
       order demand, supply is taken from any work orders in
       the list to be scheduled. This is done by searching the
       list for enough supplying work orders to cover the customer
       order demand. Each supplying work order that is found
       is processed by going through the steps outlined here
       in a) through c).
   * Next,
     supply is sought for demand from the requirement.
   * As with
     customer orders, supply is sought first from available inventory.
   * If there
     is insufficient supply in inventory, then supply is taken
     from work orders in the list to be scheduled. The list is
     searched for enough supplying work orders to cover the demand
     (if there are enough). Each supplying work order that is found
     is processed by going through the steps outlined here in a)
     through c).

3. The
   work order is added to the list containing the new scheduling
   sequence of work orders.
4. The
   work order is marked as processed. This prevents supplying work
   orders which have been selected as a source of supply from being
   reprocessed if they were selected from the original list.

This results
in a new scheduling sequence of work orders where the lower level
supplying work orders are selected for scheduling before consuming
work orders.

2. The parts, availability
   and customer demand are optionally logged to the scheduling log
   file.
3. Supplying work orders
   which have been given a higher scheduling priority are optionally
   logged in the scheduling log file.

To select Allocations settings:

1. Click the Allocations
   tab.

The Allocations options appear.

2. If you want VISUAL to
   schedule supplying work orders before consuming work orders, select
   the Allocate fabricated materials check
   box.

When you select this box, VISUAL resequences
the order of all work orders. Use the part lead-time and additional
days fields to set a time period so that materials are available for
customers whose desired ship date is within that period.

3. In the Add to scheduling
   log section, select what you want VISUAL to include in the scheduling
   log:

Part allocation information
If you want to log parts, availability and customer demand to the
scheduling log file, select this check box.

Work order allocation
information If you want to log supplying work orders with
higher scheduling priorities in the scheduling file, select this check
box if you want to log supplying work orders with higher scheduling
priorities in the scheduling file.

4. In the During scheduling,
   allocate supply section, select how you want VISUAL to allocate
   supply when netting parts:

Non-Work Orders first
Select this option button if you want VISUAL to first allocate supply
to all non-work order demand (essentially customer orders). This reserves
supply for customer orders that is not available for any work order
requirements being scheduled: VISUAL fulfills customer orders from
the available supply pool before any work order requirements can draw
supply from it.

Work Order Requirements
First Select this option button if you want VISUAL to not
allocate supply to non-work order demandcustomer orders. This leaves
all supply available to fulfill work order requirement demand during
scheduling.

Based on Date Sequence
Select this option button if you want VISUAL to allocate supply
according to demand date priority. When scheduling work order requirements,
VISUAL allocates supply based on the demands required date. However,
once VISUAL allocates supply to a work order requirement, it is NOT re-allocated to another work order requirement
scheduled at a later time in the scheduling sequence, even if it has
an earlier demand date. Essentially, when VISUAL schedules a work
order requirement, customer orders with an earlier demand date draw
supply from the available supply pool and any remaining supply is
available to satisfy the work order requirement. After VISUAL allocates
the supply to the work order requirement, no other work order requirement
can draw from that allocated supply, even if it has an earlier demand
date.

5. In the Create Material
   Supply Links for Supply Within section, select for what you want
   VISUAL to create supply links:

Project Warehouses
If you want VISUAL to create links to supply within project type
warehouses, select the Project Warehouses
check box.

Universal Warehouses
If you want VISUAL to create links to supply within universal type
warehouses, select the Universal Warehouses
check box.

Allocate supply even
if insufficient to meet demand If you want VISUAL to allocate
supply even if there isnt enough supply to meet the demand, select
the Allocate supply even if insufficient to meet
demand check box.

6. If you are finished
   making changes to your scheduling preferences, press click the
   OK button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Concurrent_Scheduler_Preferences.htm) Setting Concurrent Scheduler Preferences

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_After_Forward_Pass_Options.htm) Setting After Forward Pass Options

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Material_Options.htm)
Setting Material Options