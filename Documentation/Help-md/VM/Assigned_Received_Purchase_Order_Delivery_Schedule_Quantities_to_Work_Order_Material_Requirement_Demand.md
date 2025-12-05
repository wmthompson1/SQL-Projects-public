Assigned Received Purchase Order Delivery Schedule Quantities to Work Order Material Requirement Demand




# Assigned Received Purchase Order Delivery Schedule Quantities to Work Order Material Requirement Demand

If the part that you are receiving is a work order
material requirement, you can allocate a quantity of the purchase
order receipt line to work order material requirement demand.

1. With the purchase order
   displaying from which you want to allocate a received quantity,
   enter the quantity of the purchase order line that you want to
   receive in the Receive Quantity column. You now have available
   to you this quantity for allocation to demand.

For example, if you receive the entire quantity
(the default selection), then the entire purchase order quantity is
available to you for demand allocation; if you receive only half of
the purchase order line quantity, then only half of the purchase order
line is available to you for demand allocation.

2. Select the purchase
   order line from which you want to allocate received quantities
   to work order material requirement demand and select Assign
   Receipt Quantities to Demand Links from the Edit menu.

The Assign to Demand dialog box appears.

The Header section contains the following
read-only fields:

Order ID, Line #
- The current Purchase Order ID; the line number of this line as it
appears in the purchase order.

Order Quantity
- The order quantity of the current purchase order line.

Total Received Quantity
- The quantity of this purchase order line that you have received.
The same value is used here that you entered in step 3..

Allocated Quantity
- The portion of the purchase order received (Total Quantity Received)
quantity that you have allocated to demand.

Fulfilled Quantity
- The portion of the quantity that you allocate to demand successfully
used in order fulfillment.

Fulfill Overage Quantity
- The quantity, if the receive quantity that you assigned to a link
results in the link received quantity being greater than the link
allocated quantity.

Demand Overage Quantity
- The quantity if the receive quantity that you assign to a link plus
the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the purchase order line that you are receiving See
step 3 and the above, "Total Received Quantity."

Remaining Quantity to
Assign - The quantity of the received quantity that you still
can assign to demand. When this value equals zero, you cannot make
any further allocations to demand.

3. Click the Insert
   button to begin adding demand link information.
4. From the Type list box,
   select RQ.
5. Double-click <Demand
   Base ID> to view a list of work orders.
6. Select a work order
   and click the Select/Close button.
7. Double-click <Seq
   #/Line #> to view the selected work order's material
   requirement line items. There may or may not be lines to which
   you can establish demand links from the present purchase order
   receipt line in this work order.

The Work Order Material Operations Demand
dialog box appears.

8. Configure a search using
   the options in the header section and then click the Apply
   button.

Depending on how you configured you search
and if any material requirements exist for the part in the selected
work order, the appropriate lines appear.

9. Select the line you
   want to establish a demand link to and click the Ok
   button.

The selected work order line information
appears in the Assign to Demand dialog box line item table.

10. In the Assign
    Quantity column, enter what quantity of the received purchase
    order line's Remaining Quantity to Assign
    you want to allocate to this work order's material requirement
    demand.

This quantity cannot be greater than the
Remaining Quantity to Assign of the purchase
order receipt line or the Unallocated Requirement
Quantity of the work order material requirement line.

11. Click the Ok
    button to commit the allocation of supply from the purchase order
    receipt line to the work order's material requirement demand.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.htm) User-defined Help