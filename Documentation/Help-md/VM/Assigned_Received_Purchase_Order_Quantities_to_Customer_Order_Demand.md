Assigned Received Purchase Order Quantities to Customer Order Demand




# Assigned Received Purchase Order Quantities to Customer Order Demand

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
   to customer order line demand and select Assign Receipt Quantities
   to Demand Links from the Edit menu.

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
The same value is used here that you entered in step 3.

Allocated Quantity
- The portion of the purchase order received (Total Quantity Received)
quantity that you have allocated to demand.

Fulfilled Quantity
- The portion of the quantity that you allocate to demand successfully
used in order fulfillment.

Fulfill Overage
- When the receive quantity that you are assigning to a link results
in the link received quantity being greater than the link allocated
quantity.

Demand Overage
- When the receive quantity that you are assigning to a link plus
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
   select CO.
5. Double-click <Demand
   Base ID> to view a list of customer orders.
6. Select a customer order
   and click the Select/Close button.
7. Double-click <Seq
   #/Line #> to view the selected customer orders line
   items. There may or may not be lines to which you can establish
   demand links from the present purchase order line in this customer
   order.

The Customer Order Demand dialog box appears.

8. Configure a search using
   the options in the header section and then click the Apply
   button.

If any exist, the lines of the selected
customer order that meet your search criteria appear.

9. Select the appropriate
   line and click the Ok button.

The selected customer order line information
appears in the Assign to Demand dialog box line item table.

10. In the Assign
    Quantity column, enter what quantity of the received purchase
    order lines Remaining Quantity to Assign
    you want to allocate to this customer order line.

This quantity cannot be greater than the
Remaining Quantity to Assign of the purchase
order line or the Unallocated Requirement Quantity
of the customer order line.

11. Click the Ok
    button to commit the allocation of supply from the purchase order
    line to the customer order line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help