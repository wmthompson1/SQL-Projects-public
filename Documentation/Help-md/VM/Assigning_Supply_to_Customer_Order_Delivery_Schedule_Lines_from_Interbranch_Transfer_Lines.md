Assigning Supply to Customer Order Delivery Schedule Lines from Interbranch Transfer Lines




# Assigning Supply to Customer Order Delivery Schedule Lines from Interbranch Transfer Lines

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
   you want to allocate supply and click the Supply
   button. The Supply Links dialog box appears.

The following information appears in the
header section of the dialog box:

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
   list box, select WH.
5. Double-click <Supply
   Base ID> or <Seq #/Line #> to search for qualifying incoming
   interbranch transfer lines. The same dialog box appears regardless
   of which column heading you double-click. The Interbranch Transfer
   Supply dialog box appears.

Only interbranch transfers with the same
Part ID appear in the line item table.

6. Using the search options
   in the header section, configure a search for interbranch transfer
   lines and click the Apply button. You
   may want to view all interbranch transfers - ones with different
   Part IDs than the current customer order delivery schedule - or
   transfers with unallocated supply only.

If any exist in your database, the interbranch
transfer lines that meet your search criteria appear.

7. Select the appropriate
   interbranch transfer line and click Ok.
   The interbranch transfer line information appears in the Supply
   Links dialog box line item table.
8. In the Assign Quantity
   column, enter the quantity that you want to allocate from interbranch
   transfer line to the customer order delivery schedule line. The
   quantity that you enter here cannot be greater than the Supply
   Unallocated Quantity of the IBT line or the Remaining Qty to Assign
   of the customer order delivery schedule line.
9. Click the Ok
   button to commit the allocation of supply from the interbranch
   transfer line to the customer order delivery schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help