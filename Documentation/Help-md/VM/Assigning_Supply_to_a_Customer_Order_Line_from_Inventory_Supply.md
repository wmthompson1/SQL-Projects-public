Assigning Supply to a Customer Order Line from Inventory Supply




# Assigning Supply to a Customer Order Line from Inventory Supply

1. With the appropriate
   order open, highlight the customer order line to which you want
   to assign inventory supply and select Assign
   Supply to Customer Order Line from the Edit menu.

The Supply Links dialog box appears.

The following information appears in the
header section of the Supply Links dialog box.

Order ID/Line #
- The Order ID of the current customer order; the line number, as
it appears in the Customer Order ID, of the customer order line to
which you are assigning supply.

Order Qty - The
order quantity of the customer order line.

Shipped Qty -
The quantity of the customer order line that you have shipped. Unless
you have performed a partial shipment for this line and chosen to
keep the order open with a balance pending possible future shipments,
this value is zero for new customer orders.

Allocated Qty
- The portion of the Order Qty to which you have allocated supply.
Before you establish any links of supply, this value is zero.

Fulfilled Qty
- The allocated quantity that has been fulfilled by the supplying
source.

Remaining Qty
- The quantity to which you have yet to assign supply. Before you
establish any links of supply, this quantity is equal to the Order
Quantity of the line.

Part ID - The
ID of the part on the customer order line. This is the part for which
you are attempting to obtain supply.

Part Description
- A description of the part from Part Maintenance.

Stock U/M - The
stock unit of measure of the part from Part Maintenance.

Selling U/M -
The selling unit of measure of the part from Part Maintenance.

Warehouse ID -
The Warehouse ID of the customer order line. Without Warehouse IDs,
you cannot assign supply to customer order lines. Unless you specify
otherwise, this is the customers default primary warehouse. Specify
a warehouse other than the customers default primary warehouse during
the entry of the order by double-clicking the <Warehouse
ID> column header for each customer order line.

Desired Ship Date
- The orders desired ship date, or the date on which shipment to
the customer is most ideal. Enter a Desired Ship Date during the entry
of the customer order.

Promise Date -
The date by which you promise the customer you will have fulfilled
the order and prepared it for shipping. Enter a Promise Date during
the entry of the customer order.

2. Click the Insert
   button to begin establishing demand links to the current customer
   order line.
3. From the Type list box,
   select I.
4. Double-click <Supply
   Base ID> to search for qualifying inventory supply.

The Warehouses dialog box appears.

The line item table contains the following
columns:

Available Quantity
- Quantity of the selected part that is currently available at the
warehouse. Allocation to orders from inventory decreases this quantity,
acknowledgment of a receipt increases this quantity, and adjustments
to stock may either increase or decrease this value.

Committed Quantity
- Quantities of parts that you have committed through allocation.
As this value increases, the Available Quantity decreases. Though
these parts may still be in the warehouse, they are "committed"
as supply.

Expected Quantity
- Quantities of parts that you expect to receive from purchase orders,
purchase order delivery schedules, interbranch transfers, and work
orders.

Expected Committed Quantity
- Quantities of parts that you expect to receive from purchase orders,
purchase order delivery schedules, interbranch transfers, and work
orders that you have already committed through allocation.

5. Select the warehouse
   from which you want to draw supply and click the Ok
   button.

The Warehouses Available Quantity appears
in the Supply Unallocated Column of the Supply Links dialog box line
item table.

6. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   available inventory supply to the customer order line.

This quantity cannot be greater than the
Supply Unallocated Quantity of the warehouse, or the Remaining Quantity
to Assign of the customer order line.

7. Click Save
   to commit the allocation of supply from inventory to the customer
   order line.

## Viewing Inventory Allocation Information for a Customer Order Line Item

After you have either fully or partially allocated
supply to a customer order line item using the preceding procedures,
you can view allocation information on the customer order line.

For each customer order line item that has inventory
supply allocated to it, the following appears:

* In the Supply Type column,
  if there is only one link of inventory supply, I appears.
* In the Supply Type column,
  if there are multiple links of inventory supply, nothing appears.
* In the <Job ID>/<Order
  ID> column, if there is only one link of inventory supply,
  the appropriate supplying Warehouse ID appears.
* In the <Job ID>/<Order
  ID> column, if there is more than one link of inventory supply,
  Multiple Links appears.
* In the Total Qty Allocated
  column, the total quantity of parts that you have allocated to
  the customer order line appears.
* In the Job Qty Unallocated
  column, if there is only one supplying inventory link, the amount
  that is still available in that warehouse for allocation appears.
  The Supply Quantity is subtracted from the Supply Unallocated
  Quantity in the warehouse to arrive at this value.
* In the Job Qty Unallocated
  column, if there is more than one supplying inventory link, nothing
  appears.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help