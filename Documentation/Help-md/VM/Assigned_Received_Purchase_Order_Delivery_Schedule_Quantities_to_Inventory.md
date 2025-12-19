Assigned Received Purchase Order Delivery Schedule Quantities to Inventory




# Assigned Received Purchase Order Delivery Schedule Quantities to Inventory

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
   to inventory and select Assign Receipt Quantities
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
   select I.
5. Double-click <Demand
   Base ID> to view a list of warehouses that carry the
   part for which you are performing an allocation of the purchase
   order received quantity.

The Warehouses for Part dialog box line
item table contains the following information:

Available Quantity
- The quantity of the part that is available to the customer in this
warehouse and its locations. Though this many parts are available,
actual availability can be different for each customer that seeks
to purchase this part.

Committed Quantity
- The quantity of parts in this warehouse and its locations that you
have committed through demand fulfillment to customer orders, interbranch
transfers, work material requirements, and inventory. These parts
are not locked or unavailable, however.

Expected Quantity-
The quantity of parts that you expect to receive into this warehouse
from purchase orders, work orders, co-products supply and interbranch
transfers. You can allocate expected quantities to customer orders,
work order material requirements, interbranch transfers and inventory.

Expected/Committed Quantity
- The quantity of parts that you expect to receive into this warehouse
from purchase orders, work orders, co-product supply and interbranch
transfers that you have already committed to the demand fulfillment
of customer orders, interbranch transfers, work material requirements,
and inventory.

6. Select the appropriate
   line and click the Ok button.

The selected warehouse/inventory line information
appears in the Assign to Demand dialog box line item table.

7. In the Assign
   Quantity column, enter what quantity of the received purchase
   order lines Remaining Quantity to Assign you want to allocate to inventory in
   this warehouse.

This quantity cannot be greater than the
Remaining Quantity to Assign of the purchase
order line.

8. Click the Ok
   button to commit the allocation of supply from the purchase order
   receipt line to warehouse inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help