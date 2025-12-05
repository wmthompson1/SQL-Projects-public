Assigning Supply to Customer Order Delivery Schedule Lines from Inventory




# Assigning Supply to Customer Order Delivery Schedule Lines from Inventory

If you are unsure about which lines customer order
lines are delivery schedule lines, scroll down the Customer Order
Entry window line item table until you find the Del Schedcolumn. If
a check appears in the column, the line is a delivery schedule; if
not, there are no delivery schedule lines for this customer order
line.

1. With the customer order
   that contains the delivery schedule to which you want to assign
   supply displaying in the Customer Order Entry window, highlight
   the appropriate customer order line and click the Del Sched tab.
   The Edit Delivery Schedule Dialog box appears with all delivery
   schedule line items for the customer order line displaying in
   the line item table.
2. Select the line to which
   you want to allocate supply and click the Supply
   button. The Supply Links dialog box appears.

The following information appears in the header
section of the dialog box:

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
Before you establish any links to supply, this value is zero.

Fulfilled Qty
- The quantity that has been fulfilled from the supplying source.

Remaining Qty
- The quantity to which you have yet to assign supply. Before you
establish any links of supply, this quantity is equal to the Order
Quantity of the line.

3. Click the Insert
   button.
4. From the Type
   list box, select I.
5. Double-click <Supply
   Base ID> to view a list of warehouses from which you
   can assign supply. The Warehouses for Part dialog box appears.

The line item table contains
the following columns:

Available Quantity
- Quantity of the selected part that are currently available at the
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

6. Select the warehouse
   from which you want to draw supply and click the Ok
   button. The Warehouses Available Quantity appears in the Supply
   Unallocated Column of the Supply Links dialog box line item table.
7. In the Assign Quantity
   column, enter the quantity that you want to allocate from the
   available inventory supply to the customer order delivery schedule
   line. This quantity cannot be greater than the Supply Unallocated
   Quantity of the warehouse, or the Remaining Quantity to Assign
   of the customer order delivery schedule line.
8. Click Ok
   to commit the allocation of supply from inventory to the delivery
   schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help