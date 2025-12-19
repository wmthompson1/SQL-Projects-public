Assigning Received Purchase Order Delivery Schedule Quantities to Inventory




# Assigning Received Purchase Order Delivery Schedule Quantities to Inventory

1. With the purchase order
   that contains the delivery schedule line open, select the appropriate
   purchase receipt delivery schedule line from the Purchase Receipt
   Entry line item table and click the Del Sched
   button.

The Delivery Schedule Shipment dialog box
appears.

2. In the Receive Quantity
   column, enter the quantity of the purchase order line that you
   want to receive. You now have available this quantity for allocation
   to demand.

For example, if you receive the entire quantity
(the default selection), then the entire delivery schedule line quantity
is available to you for demand allocation; if you receive only half
of the purchase order delivery schedule line, then only half of the
purchase order delivery schedule line is available to you for demand
allocation.

3. Select the delivery
   schedule line from which you want to allocate received quantities
   to inventory and click the Demand button.

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
- The quantity if the receive quantity that you assigned to a link
results in the link received quantity being greater than the link
allocated quantity.

Demand Overage Quantity
- The quantity if the receive quantity that you assign to a link plus
the link issued quantity exceeds the link allocated quantity.

Receive Quantity
- The quantity of the purchase order delivery schedule line that you
are receiving See step 3 and the above, "Total Received Quantity."

Remaining Quantity to
Assign - The quantity of the received quantity that you still
can assign to demand. When this value equals zero, you cannot make
any further allocations to demand.

4. Click the Insert
   button to begin adding demand link information.
5. From the Type list box,
   select I.
6. Double-click <Demand
   Base ID> to view a list of warehouses that carry the
   part for which you are performing an allocation of the received
   quantity.

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

Expected Quantity
- The quantity of parts that you expect to receive into this warehouse
from purchase orders, work orders, co-products supply and interbranch
transfers. You can allocate expected quantities to customer orders,
work order material requirements, interbranch transfers and inventory.

Expected/Committed Quantity
- The quantity of parts that you expect to receive into this warehouse
from purchase orders, work orders, co-product supply and interbranch
transfers that you have already committed to the demand fulfillment
of customer orders, interbranch transfers, work material requirements,
and inventory.

The selected warehouse/inventory line information
appears in the Assign to Demand dialog box line item table.

7. In the Assign
   Quantity column, enter what quantity of the received purchase
   order delivery schedules Remaining
   Quantity to Assign you want to allocate to inventory in this warehouse.

This quantity cannot be greater than the
Remaining Quantity to Assign of the purchase
order delivery schedule line.

8. Click the Ok
   button to commit the allocation of supply from the purchase order
   delivery schedule line to warehouse inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help