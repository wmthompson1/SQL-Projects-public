Allocating Released Work Order Quantities to Inventory




# Allocating Released Work Order Quantities to Inventory

1. If it is not already
   open, select Inventory Transaction Entry
   from the Infor VISUAL Tools menu.
2. Select the Receipt
   radio button.
3. Click the Work
   Order ID button to select from a list of all currently
   released work orders in your database. Select the appropriate
   work order and click the Ok button.

The work order's Base ID, Lot ID, Split
ID, and Part ID appear.

4. If necessary, click
   the Location ID button to select the
   warehouse location into which you want to receive this released
   work order quantity.
5. From the Edit menu,
   select Allocate Demand to this Work Order.

The Assign to Demand dialog box appears.

The following read-only information appears
in the dialog box header section.

Work Order ID
- The ID of the work order that produces this coproduct.

Desired Qty -
The quantity of the work order.

Received Qty -
The quantity of the work order (Desired Quantity) that you have received
into inventory.

Allocated Qty
- The portion of the Desired Quantity that you have allocated thus
far to demand.

Fulfilled Qty
- The quantity that has been fulfilled from an allocation. When you
issue this quantity to the demand source, the demand allocation is
then fulfilled.

Available Qty
- The portion of the work order Desired Quantity that you have yet
to allocate to demand sources and is therefore still available for
allocation. Before you begin to establish demand links, this value
is equal to the Desired Quantity.

Part ID - The
Part ID of the work order, or the part produced by the work order.

Part Description
- A description of the above part.

Stock U/M - The
stock unit of measure of the part.

Warehouse ID -
The Warehouse ID of the work order, or the warehouse into which you
are receiving this work order. The object of any demand link you establish
must also have this Warehouse ID. If you attempt to establish a link
to a potential demand source that does not have this same Warehouse
ID, you are warned and cannot continue.

Sched Finish Date
- The date on which the work order is scheduled to finish. If you
have not scheduled the work order using the Schedule Work Order feature
of the Manufacturing window or run the Global Scheduler since adding
this work order to your database nothing appears here. However, if
you have scheduled the work order, the finish date and time of the
work order appears here.

Desired Want Date
- The date by which you want to the work order completed.

6. Click the Insert
   button to begin adding demand allocation information.
7. From the Type list box,
   select I.
8. Double-click <Demand
   Base ID> to view a list of warehouses that carry the
   work order Part ID.

The Warehouses for Part dialog box appears.

The Warehouses for Part dialog box line
item table contains the following columns.

Warehouse ID -
The ID of the warehouse.

Available Quantity
- The quantity of parts that the warehouse currently has available
for use.

Committed Quantity
- The quantity of parts that you have committed through allocation
or order fulfillment.

Expected Quantity
- The quantity of parts that you are expecting to receive into the
warehouse.

Expected/Committed Quantity
- The quantity of expected parts that you have already committed to
order fulfillment.

9. Select the appropriate
   warehouse and click the Ok button.
10. In the Allocate Quantity
    column, enter the quantity you want to assign to inventory. Because
    inventory (Warehouse ID) is the default destination for these
    parts, the link that you are now establishing is a preventative
    measure against other links of demand.

The quantity you enter here cannot be greater
than the Available Quantity of the work order itself.

11. Click the Save
    button to commit the allocation of work order quantities to inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.htm) User-defined Help