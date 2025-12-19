Assigning Work Order Supply to a Customer Order Line




# Assigning Work Order Supply to a Customer Order Line

1. Highlight the customer
   order line item to which you want to assign work order supply
   and select Assign Supply to Customer Order
   Line from the Edit menu.

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
- A description of the part. The default from Part Maintenance.

Stock U/M - The
stock unit of measure of the part. The default from Part Maintenance.

Selling U/M -
The selling unit of measure of the part. The default from Part Maintenance.

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

2. Click the Insert button
   to begin establishing demand links to the current customer order
   line.
3. From the Type list box,
   select WO.
4. Double-click <Supply
   Base ID> to view a list of all the work orders currently in
   your database.
5. Select a work order
   with the matching Part ID and click Ok.

The work order appears in the Supply Links
dialog box line item table.

6. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   work order to the customer order line. The quantity that you enter
   here cannot be greater than the Supply Unallocated Quantity of
   the work order or the Remaining Qty to Assign of the customer
   order line.
7. Click Ok
   to commit the allocation of supply from the selected work order
   to the customer order line.

## Viewing Work Order Supply Allocation Information for a Customer Order Line Item

After you have either fully or partially allocated supply to a customer
order line item using the preceding procedures, you can view allocation
information on the customer order line.

For each customer order line item to which you
have allocated work order supply, the following appears:

* In the Supply Type column,
  if there is only one link of purchase order line supply, WO appears.
* In the Supply Type column,
  if there are multiple links of inventory supply, nothing appears.
* In the <Job ID>/<Order
  ID> column, if there is only one link of work order supply,
  the Work appropriate Order ID appears.
* In the <Job ID>/<Order
  ID> column, if there is more than one link of work order supply,
  Multiple Links appears.
* In the Lot ID/Line # column,
  if there is only link of supply from a work order, the Lot ID/Line
  # of the work order appears.
* In the Lot ID/Line # column,
  if there is allocated supply from a more than one work order,
  nothing appears.
* In the Split ID column,
  if there is only link of supply from a work order, the Split ID
  of the appropriate work order appears.
* In the Split ID column,
  if there is allocated supply from a more than one work order,
  nothing appears.
* In the Total Qty Allocated
  column, the total quantity of parts that you have allocated to
  the customer order line item appears.
* In the Job Qty Unallocated
  column, if there is only one supplying work order link, the amount
  that is still available from that work order for allocation appears.
  The Supply Quantity is subtracted from the Supply Unallocated
  Quantity to arrive at this value.

In the Job Qty Unallocated column, if there is more than one supplying
work order link, nothing appears.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help