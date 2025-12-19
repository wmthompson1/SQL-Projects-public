Using Material Requirements Planning




# Using Material Requirements Planning

Material Requirements Planning is an optional module
that generates planned demand and supply orders for a part based on
the part's Order Policy, demand, and master production schedule (for
a master scheduled part). These orders appear in material netting
in the same way as actual orders. You can then firm and release the
planned orders into real supply orders.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
2. Select Material
   Requirements Planning from the File
   menu.

The MRP dialog box appears.

3. In the warehouse section,
   click the Warehouse arrow and select the warehouses you want VISUAL
   to include in the MRP run. You can select:

Universal When
you select Universal, MRP nets all supply and demand for each part
that is not identified by a warehouse, or associated with a warehouse
that is not Independently Planned. MRP also generates planned orders
using the Universal Planning parameters entered for each part in Part
Maintenance.

Independent
When you select the independent option, you can select individual,
independently-planned warehouses from the list. MRP nets the supply
and demand for each part specified for the warehouses you select.
MRP generates planned orders using the specified warehouse's planning
parameters entered in Part Maintenance. If you have not set planning
parameters for a given part/warehouse combination, MRP uses the planning
parameters for the Universal warehouse.

All Warehouses
When you select All Warehouses, MRP nets and plans orders for the
Universal warehouse and each independently-planned warehouse separately,
using the rules described above. If there are 10 Independently-Planned
warehouses along with a number of Universally-Planned warehouses for
a given part, MRP performs 11 separate nettings. This is the default
option.

If you are a Projects/A&D user, you
can also select a Program Manager whose warehouses you would like
to view. Please refer to your Projects user guide for more information.

4. Select the scope of
   processing.

As transactions are performed in the system,
VISUAL marks parts as requiring MRP. Events that trigger this marking
include creation and modification of purchase orders, customer order,
and work orders for the part, as well as inventory transactions involving
the part. This is done so you can process only those parts that might
require changes, rather than all parts. The number of parts marked
in this way is shown as Parts Requiring MRP Processing.

There are two choices for the scope of MRP
processing:

Process All Top Level
Parts (Regeneration) - A top-level part is one that is not
required in any material requirement for a work order. Demand orders
for top-level parts are only customer orders.

If you select this option, VISUAL processes
top level parts on the first MRP pass whether they are marked for
MRP or not. VISUAL processes non-top-level parts if they are marked
for MRP.

Process Parts Changed
Since Last Run (Net Change) - VISUAL processes only parts marked
for MRP.

5. Select Single or Multiple
   Level Processing.

When MRP processes a set of parts, it generates
two kinds of orders. Planned supply orders are created to meet existing
demand for each part. Planned demand orders are also created to account
for the material requirements of the newly planned orders.

If you select the Single Pass check box,
the process stops after the first pass. If you do not select the Single
Pass check box, MRP makes a second pass, now considering the new demand
orders caused by the newly planned supply orders. Passes continue
until no new demand orders are created.

6. Set Exception Marking
   Limits.

During processing, MRP marks parts as having
exceptions if a planned order is created, or if one of the normal
netting exceptions (ex: Stockout) occurs for the part. You can use
this marking as part of the query in the Search option. This allows
you to focus on parts that may need your attention.

You have three options to control how this
marking is done with regard to horizon:

No Horizon - Any
exceptions appearing for the part mark the part as having MRP exceptions,
regardless of how far out they are.

Fixed Horizon
- This specifies a number of days to look forward from the current
date for exceptions. MRP only marks the part as having exceptions
if any occur within this time frame. Specify Horizon in days.

Plus Part Leadtime
- The exception time frame is extended to the horizon plus the leadtime
specified for the part. This produces a horizon that varies for each
part. For a given horizon, parts that take longer to get are more
likely to appear as MRP exceptions. This option is strongly recommended
over the Fixed Horizon option.

7. Specify how to determine
   supply order quantities for master scheduled parts.

Net on-hand quantities
for master scheduled parts This check box is available only
if you have not activated the Suggested MPS feature in the Advanced
Material Planning window. Select this check box to subtract nettable,
on-hand balances from the total demand.

Apply Min/Max/Multiple
to Master Scheduled Parts Select this check box to adjust
the quantities ordered to take into account the minimum, maximum,
and multiple quantity ordering requirements for the part.

8. To exclude on-hold customer
   order lines from the demand calculation, select the Exclude
   On-hold Customer Orders check box. A customer order line
   is on hold if one of these conditions is met:

* The order
  line has a status of On Hold
* The order
  line has a status of Inherit and the order header status is On
  Hold

8. To exclude unreleased
   work orders from supply and demand calculations, select the Exclude Unreleased Work Orders check box.
9. Select the Log MRP check
   box if you want VISUAL to generate a log file for the MRP session.
   The log file appears in the directory where your executables are
   installed as Vmplnwin.log.
10. Click Ok
    to start processing.

MRP may take a few minutes to run, depending
on the number of parts that require processing, the number of demand
orders, the speed of your machine, and other factors.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](MRP_Processing.md)
MRP Processing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Firming_and_Releasing_Planned_Orders.md) Firming and Releasing Planned Orders