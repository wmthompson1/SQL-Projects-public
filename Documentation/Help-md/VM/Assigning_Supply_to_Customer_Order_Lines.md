Assigning Supply to Customer Order Lines




# Assigning Supply to Customer Order Lines

You can assign supply to a customer order line item
from six sources to satisfy the demand quantity of an outgoing customer
order. It is possible to allocate supply to a customer order line
item from all six sources.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which the order was created. If you
   are licensed to use a single site, this field is unavailable.
2. Click the Order ID button
   and select the order.
3. From the Customer Order
   Entry window, highlight the customer order line to which you want
   to assign coproduct supply and select Assign
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
otherwise, this is the customer's default primary warehouse. Specify
a warehouse other than the customer's default primary warehouse during
the entry of the order by double-clicking the <Warehouse ID>
column header for each customer order line.

Desired Ship Date
- The order's desired ship date, or the date on which shipment to
the customer is most ideal. Enter a Desired Ship Date during the entry
of the customer order.

Promise Date -
The date by which you promise the customer you will have fulfilled
the order and prepared it for shipping. Enter a Promise Date during
the entry of the customer order.

4. Click the Insert
   button to begin establishing demand links to the current customer
   order line.
5. From the Type list box,
   select the source of supply for this order line.

CP - To assign
coproduct supply to this line, select CP.

I - To assign
warehouse inventory to this line, select I.

PD - To assign
purchase order delivery schedule supply to this line, select PD.

PO - To assign
purchase order supply to this line, select PO.

|  |  |
| --- | --- |
| POSTIT.gif | If you use FIFO by Location as your inventory grouping method, then these conditions apply to purchase orders or purchase order delivery schedules linked to customer orders:   * After you receive   a purchase order linked to customer order, the linked   quantity can only be used to fulfill the customer order.   The linked purchase order quantity cannot be used for   another purpose unless the link is broken or the customer   shipment is complete. * Linked customer   orders should be shipped from the same warehouse location   where the linked purchased quantities were received. If   you ship a linked customer order from a different warehouse   location, the link to the purchase order is broken. |

WH - To assign
inter-branch transfer supply to this line, select WH.

WO - To assign
work order supply to this line, select WO.

6. Depending on your choice
   in step 3, double-click the Supply Base ID
   browse button to search for qualifying supply quantities.

For type CP, a dialog box appears that allows
you to search work orders for qualifying coproduct supply.

For type I, a list of warehouses that contain
the part appear.

For type PD, a dialog box appears that allows
you to search for qualifying purchase order delivery schedules.

For type PO, a dialog box appears listing
all purchase orders.

For type WH, a dialog box appears that allows
you to search for qualifying inter-brach transfers.

For type WO, a dialog box appears listing
all work orders.

7. If any lines appear
   that meet your search criteria, select the appropriate line and
   click the Ok button.
8. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   available coproduct supply to the customer order line. This quantity
   cannot be greater than the Supply Unallocated Quantity of the
   coproduct line, or the Remaining Quantity to Assign of the customer
   order line.
9. Click the Ok
   button to commit the allocation of supply to the customer order
   line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help