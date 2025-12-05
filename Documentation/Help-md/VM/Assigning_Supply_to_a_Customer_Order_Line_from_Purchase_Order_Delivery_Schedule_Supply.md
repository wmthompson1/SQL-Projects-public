Assigning Supply to a Customer Order Line from Purchase Order Delivery Schedule Supply




# Assigning Supply to a Customer Order Line from Purchase Order Delivery Schedule Supply

NOTE: If you use FIFO by Location as your inventory
grouping method, then these conditions apply to purchase orders linked
to customer orders:

* After you receive a purchase
  order linked to customer order, the linked quantity can only be
  used to fulfill the customer order. The linked purchase order
  quantity cannot be used for another purpose unless the link is
  broken or the customer shipment is complete.
* Linked customer orders should
  be shipped from the same warehouse location where the linked purchased
  quantities were received. If you ship a linked customer order
  from a different warehouse location, the link to the purchase
  order is broken.

1. With the appropriate
   customer order open, highlight the customer order line item to
   which you want to assign purchase order delivery schedule supply
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
the entry of the order by double-clicking the <Warehouse ID>
column header for each customer order line.

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
   select PD.
4. Double-click <Supply
   Base ID>, <Seq #/Line #>, or Piece # to search
   for qualifying purchase order delivery schedule supply.

The same dialog box appears regardless of
which column heading you double-click.

5. Using the search options
   in the header section, configure a search for purchase order delivery
   schedule lines and click the Apply button.

If any exist in your database, the purchase
order delivery schedule lines that meet your search criteria appear.

6. Select the appropriate
   purchase order delivery schedule line and click Ok.

The purchase order delivery schedule line
information appears in the Supply Links dialog box line item table.

7. In the Assign Quantity
   column, enter the quantity that you want to allocate from this
   purchase order delivery schedule line to the current customer
   order line.

The quantity that you enter here cannot
be greater than the Supply Unallocated Quantity of the purchase order
delivery schedule line or the Remaining Qty to Assign of the customer
order line.

8. Click the Save
   button to commit the allocation of supply from the purchase order
   delivery schedule line to the customer order line.

## Viewing Purchase Order Delivery Schedule Line Supply Allocation Information for a Customer Order Line

After you have either fully or partially allocated
supply to a customer order line item using the preceding procedures,
you can view allocation information on the customer order line.

For each customer order line item to which you have allocated purchase
order delivery schedule supply, the following appears:

* In the Supply Type column,
  if there is only one link of purchase order line supply, PD appears.
* In the Supply Type column,
  if there are multiple links of inventory supply, nothing appears.
* In the <Job ID>/<Order
  ID> column, if there is only one link of purchase order delivery
  schedule supply, the Purchase Order ID of which the delivery schedule
  is part appears.
* In the <Job ID>/<Order
  ID> column, if there is more than one link of inventory supply,
  Multiple Links appears.
* In the Total Qty Allocated
  column, the total quantity of parts that you have allocated to
  the customer order line appears.
* In the Job Qty Unallocated
  column, if there is only one supplying inventory link, the amount
  that is still available on that purchase order delivery schedule
  line for allocations appears. The Supply Quantity is subtracted
  from the Supply Unallocated Quantity of the purchase order delivery
  schedule line to arrive at this value.

In the Job Qty Unallocated column, if there is more than one supplying
inventory link, nothing appears.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help