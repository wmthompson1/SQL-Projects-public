Allocating Released Work Order Quantities to Customer Order Delivery Schedule Demand




# Allocating Released Work Order Quantities to Customer Order Delivery Schedule Demand

1. If it is not already
   open, select Inventory Transaction Entry
   from the Infor VISUAL Tools menu.
2. Select the Receipt
   radio button.
3. Click the Work
   Order ID button to select from a list of all currently
   released work orders in your database. Select the appropriate
   work order and click the Ok button.

The work orders Base ID, Lot ID, Split
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
   select CD.
8. Double-click <Demand
   Base ID> or <Piece #>
   to view a list of Customer Order delivery schedule lines to which
   you can allocate supply.

The Customer Order Delivery Schedule Demand
dialog box appears.

9. If necessary, use the
   search options in the Options and Sort by sections to configure
   a search for customer order delivery schedule lines and click
   the Apply button.

All customer order delivery schedule lines
that meet your search specifications appear.

10. Select the appropriate
    line and click the Ok button.

The customer order delivery schedule line
information appears in the Assign to Demand dialog box line item table.

11. In the Allocate Quantity
    column, enter the quantity of the work order that you want to
    allocate to the customer order delivery schedule line.

The quantity you enter here cannot be greater
than the Demand Unallocated Quantity of the customer order delivery
schedule line or the Available Quantity of the work order.

12. Click the Save
    button to commit the allocation of work order quantities to customer
    order delivery schedule demand.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Transaction_Entry.md) User-defined Help