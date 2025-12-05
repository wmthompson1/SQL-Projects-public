MRP Processing




# MRP Processing

For each part that it processes, MRP performs a netting
process similar to that shown on the Material Planning Window interactive
window. MRP is always run with the following netting options:

* Net Using On-Hand Quantity
  (i.e., Net Available Quantity deselected)
* Deduct Safety Stock
* Net Using MRP Rules

Then, MRP essentially uses its own exceptions and suggested release
dates to generate planned supply orders. When MRP is run for a part,
previous planned orders for the part are deleted. MRP is only run
for parts with the following order policies:

Discrete or EOQ - A planned order will
be created to fill the exact required quantity for each demand.

Fixed - Planned orders can only be created
in the Order Quantity specified. An integer number of planned supply
orders will be generated as needed. For example, if demand is 50 and
fixed Order Quantity is 100, one order for 100 will be generated.
If fixed Order Quantity were 25, then two orders for 25 would be created.
This order may, of course, end up meeting multiple demands.

Period Supply - When a supply order must
be generated, its Quantity is enough to supply the specified Days
of Supply for the part.

Master Scheduled - Planned Supply Orders
are created to meet each Schedule Date and Schedule Quantity in the
Master Production Schedule. These orders are not planned by MRP based
on netting, but generated from the production schedule.

For Discrete, EOQ, Fixed, and Period policies, the Minimum Order
Quantity and Maximum Order Quantity for the part are also respected.
For example, if demand is 25, and the part has a Discrete policy with
a minimum order quantity of 30, the order will be for 30 units.

MRP will also generate planned requirements for every material requirement
of every planned work order it generated. If Single Pass is not selected,
then these requirements will be considered in the next pass of MRP.
Planned requirements are generated regardless of the required parts
order policy.

If the Application Global setting for Material
Resource Planning > By Release Date check
box is selected, MRP material netting will use the demand orders release
date instead of the required date. This will cause planned orders
to be generated based on the demand release date instead of the demand
required date.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.htm) User-defined Help