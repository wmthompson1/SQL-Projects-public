Assigning Supply to Customer Order Delivery Schedule Lines from Purchase Order Lines




# Assigning Supply to Customer Order Delivery Schedule Lines from Purchase Order Lines

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

If you are unsure about which lines customer order
lines are delivery schedule lines, scroll down the Customer Order
Entry window line item table until you find the Del
Sched column. If a check appears in the column, the line is
a delivery schedule; if not, there are no delivery schedule lines
for this customer order line.

1. With the customer order
   that contains the delivery schedule to which you want to assign
   supply displaying in the Customer Order Entry window, highlight
   the appropriate customer order line and click the Del
   Sched tab. The Edit Delivery Schedule Dialog box appears
   with all delivery schedule line items for the customer order line
   displaying in the line item table.
2. Select the line to which
   you want to allocate supply and click the Supply button. The Supply
   Links dialog box appears.

The following information
appears in the header section of the dialog box:

Order ID/Line #/Del Sched
Line # - The Order ID of the current customer order; the line
number of the customer order delivery schedule line in the customer
order; the line number of the delivery schedule line in the delivery
schedule.

Order Qty - The
order quantity of the customer order delivery schedule line.

Total Shipped Qty
- The quantity of the customer order delivery schedule line that you
have shipped. Unless you have performed a partial shipment for this
line and chosen to keep the order open with a balance pending possible
future shipments, this value is zero for new customer order delivery
schedules.

Allocated Qty
- The portion of the Order Qty to which you have allocated supply.
Before you establish any links of supply, this value is zero.

Fulfilled Qty
- The quantity that has been fulfilled from the supplying source.

Remaining Qty
- The quantity to which you have yet to assign supply. Before you
establish any links of supply, this quantity is equal to the Order
Quantity of the line.

3. Click the Insert
   button.
4. From the Type
   list box, select PO.
5. Double-click <Supply
   Base ID> to search for qualifying purchase order lines.
   The dialog box that appears contains all the purchase orders currently
   in your database. Besides this list being perhaps too long to
   scroll through, selection of purchase orders is arbitrary at this
   point because you may select a purchase order line that has a
   different Part ID or Warehouse ID than the current purchase order
   line, and these two IDs must be the same in both in order to establish
   a demand link.

To avoid selecting purchase orders at random,
double-click <Seq #/Line #> to view
only those customer order lines in your database with the required
Part ID and Warehouse ID.

6. Highlight the customer
   order to which you want to allocate purchase order quantities
   and double-click the line item or click the Ok
   button. The purchase order line appears in the Supply Links dialog
   box line item table.
7. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   purchase order line to the customer order delivery schedule line.
   The quantity that you enter here cannot be greater than the Supply
   Unallocated Quantity of the purchase order line or the Remaining
   Qty to Assign of the customer order delivery schedule line.
8. Click the Ok
   button to commit the allocation of supply from the purchase order
   line to the customer order delivery schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help