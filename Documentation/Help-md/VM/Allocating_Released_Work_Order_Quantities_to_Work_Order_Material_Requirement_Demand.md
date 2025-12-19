Allocating Released Work Order Quantities to Work Order Material Requirement Demand




# Allocating Released Work Order Quantities to Work Order Material Requirement Demand

When you receive inventory by work order, you can
assign the work order supply to a demand transaction. You must allocate
the supply before you complete the receipt.

You can allocate work order supply to these demand sources:

* Customer Orders (either
  at the line level or the delivery schedule level)
* Material Requirements
* Inventory locations
* Interbranch Transfers

To allocate work order supply quantities to demand:

1. Select Inventory,
   Inventory Transaction Entry.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site that owns the work order. If you are
   licensed to use a single site, this field is not available.
3. Click Receipt
   by WO.
4. Click the Work
   Order ID browse button and select the work order to allocate
   to demand.
5. If necessary, click
   the Location browse button and change the warehouse and location
   into which to receive the parts.
6. Select Edit,
   Allocate Demand to this Work Order.
   This information is displayed in the Assign to Demand dialog box
   header:

Work Order ID
The ID of the work order you selected.

Desired Qty
The quantity of the work order.

Received Qty
The quantity of the work order (Desired Quantity) that you have received
into inventory to date.

Allocated Qty
The portion of the Desired Quantity that you have allocated to the
demand to date.

Fulfilled Qty
The quantity that has been fulfilled from an allocation. When you
issue this quantity to the demand source, the demand allocation is
then fulfilled.

Available Qty
The portion of the work order Desired Quantity that you have yet
to allocate to demand sources and is therefore still available for
allocation. Before you begin to establish demand links, this value
is equal to the Desired Quantity.

Part ID The
Part ID of the work order, or the part produced by the work order.

Part Description
A description of the part on the work order.

Stock U/M The
stock unit of measure of the part.

Warehouse ID
The warehouse into which you are receiving this work order. The object
of any demand link you establish must also have this Warehouse ID.
If you attempt to establish a link to a potential demand source that
does not have this same Warehouse ID, VISUAL warns you and does not
let you continue.

Sched Finish Date
The date on which the work order is scheduled to finish. If you
have not scheduled the work order using the Schedule Work Order feature
of the Manufacturing Window or run the Global Scheduler since adding
this work order to your database, nothing is displayed here. If you
have scheduled the work order, the finish date and time of the work
order is displayed here.

Desired Want Date
The date by which the work order should be completed.

7. Click Insert.
8. Click the arrow in the
   Type column and select the type of demand to assign to supply.
   Select one of these options:
9. CD Customer
   Order Delivery Schedule Lines
10. CO Customer
    Orders
11. I Inventory
12. RQ Work
    Order Material Requirements
13. WH Interbranch
    Transfers

9. Specify the demand to
   link to the supply. Perform one of these steps:
10. If you selected
    CD, double-click the Piece # browse
    button. A list of delivery schedules for the part is displayed.
    You can filter the list by date and elect to view only delivery
    schedules with unallocated demand. You can also sort the table
    by customer order ID, desired receive date, or part ID. Select
    the delivery schedule to assign to supply and click Ok.
11. If you selected
    CO, double-click the Seq #/Line # browse
    button. A list of customer order lines for the part is displayed.
    You can filter the list by date and elect to view only customer
    order lines with unallocated demand. You can also show customer
    order lines for all parts. You can sort the table by customer
    order ID and line number, by desired ship date, and by part ID.
    Select the customer order line to assign to supply and click Ok.
12. If you selected
    I, double-click the Demand Base ID browse
    button. A list of warehouse locations is displayed. Select the
    location to supply and click Ok.
13. If you select
    RQ, double-click the Piece # browse
    button. A list of material requirements is displayed. You can
    filter the list by date and elect to view only material requirements
    with unallocated demand. You can also show all material requirements.
    You can sort the requirements by ID, required date, or part ID.
    Select the requirement to assign to supply and click Ok.
14. If you select
    WH, double-click the Demand Base ID
    browse button. A list of interbranch transfers is displayed. You
    can filter the list by date and elect to view only IBTs with unallocated
    demand. You can also show only IBTs for the part you are receiving
    or all IBTs. You can sort the IBTs by IBT and line number, desired
    ship date, or Part ID. Select the transfer to assign to supply
    and click Ok.

10. In the Allocate Quantity
    column, specify the quantity of the supply to allocate to the
    demand. The quantity you specify cannot be greater than the available
    demand quantity.
11. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.md) User-defined Help