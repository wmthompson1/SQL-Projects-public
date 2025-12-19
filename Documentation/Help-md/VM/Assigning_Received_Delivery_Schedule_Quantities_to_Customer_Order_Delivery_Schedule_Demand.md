Assigning Received Delivery Schedule Quantities to Customer Order Delivery Schedule Demand




# Assigning Received Delivery Schedule Quantities to Customer Order Delivery Schedule Demand

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

1. Select the appropriate
   purchase receipt delivery schedule line from the Purchase Receipt
   Entry line item table.
2. Click the Del
   Sched button.

The Delivery Schedule Shipment dialog box
appears.

3. In the Receive Quantity
   column, enter the quantity of the purchase order line that you
   want to receive. You then have available to you this quantity
   for allocation to demand.

For example, if you receive the entire quantity
(the default selection), then the entire delivery schedule line quantity
is available to you for demand allocation; if you receive only half
of the purchase order delivery schedule line, then only half of the
purchase order delivery schedule line is available to you for demand
allocation.

4. Select the delivery
   schedule line from which you want to allocate received quantities
   to customer order demand and click the Demand
   button.

The Assign to Demand dialog box appears.

The Header section contains the following
read-only fields:

Order ID, Line #, Del
# - The current Purchase Order ID; the line number of this
delivery schedule line as it appears in the order; the line number
of this line as it appears in the delivery schedule.

Order Quantity
- The order quantity of this delivery schedule line.

Total Received Quantity
- The quantity of this delivery schedule line that you have received.
The same value is used here that you entered in step 3.

Allocated Quantity
- The portion of this delivery schedule received quantity that you
have allocated to demand.

Fulfilled Quantity
- The portion of the quantity that you allocate to demand successfully
used in order fulfillment.

Fulfill Overage Quantity
- The quantity, if the receive quantity that you assigned to a link
results in the link received quantity being greater than the link
allocated quantity.

Demand Overage Quantity
- The quantity, if the receive quantity that you assign to a link
plus the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the purchase order delivery schedule line that you
are receiving See step 3 and the above, "Total Received Quantity."

Remaining Quantity to
Assign - The quantity of the received quantity that you still
can assign to demand. When this value equals zero, you cannot make
any further allocations to demand.

5. Click the Insert
   button to begin adding demand link information.
6. From the Type list box,
   select CD.
7. Double-click <Demand
   Base ID> to search for customer order delivery schedule
   lines to which you can establish demand links from the present
   purchase order delivery schedule received quantity.

The Customer Order Delivery Schedule Demand
dialog box appears.

8. Configure a search using
   the options in the header section and then click the Apply
   button.

All customer order delivery schedule lines
that meet you search criteria appear.

9. Select the appropriate
   line and click the Ok button.

The selected customer order delivery schedule
line information appears in the Assign to Demand dialog box line item
table.

10. In the Assign
    Quantity column, enter what quantity of the received purchase
    order delivery schedules Remaining Quantity
    to Assign you want to allocate to this customer order delivery
    schedule.

This quantity cannot be greater than the
Remaining Quantity to Assign of the purchase
order delivery schedule line or the Unallocated
Requirement Quantity of the customer order delivery schedule
line.

11. Click the Ok
    button to commit the allocation of supply from the purchase order
    delivery schedule lines received quantity to the customer order
    delivery schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help