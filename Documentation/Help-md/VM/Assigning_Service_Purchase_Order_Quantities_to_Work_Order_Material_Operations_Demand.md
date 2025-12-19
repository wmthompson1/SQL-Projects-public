Assigning Service Purchase Order Quantities to Work Order Material Operations Demand




# Assigning Service Purchase Order Quantities

You can allocate service purchase order line quantities
to work order material operations demand using the Assign to Demand
option available from the Edit menu in the Purchase Order Entry window.

1. With the purchase order
   open that contains the service purchase order line from which
   you want to allocate to work order material operations demand,
   select the appropriate service purchase order line and select
   Assign to Demand from the Edit menu.

The Assign to Demand dialog box appears.

The Header section contains the following
read-only fields:

Order ID, Line #
- The current Purchase Order ID; the number of this line as it appears
in the Purchase Order Entry window line item table.

Order Quantity
- The order quantity of the current purchase order line.

Received Quantity
- The quantity of this purchase order line that you have received.

Allocated Quantity
- The portion of the purchase order quantity that you have allocated
to demand.

Fulfilled Quantity
- The portion of the quantity that you allocate to demand successfully
used in order fulfillment.

Available Quantity
- The quantity available to you for allocation purposes. Before you
establish any demand links, this value is equal to the Order Quantity.

2. Click the Insert
3. From the Type list box,
   select OP. This is the only possible
   selection.
4. Double-click <Demand
   Base ID> to view a list of work orders.
5. Select a work order
   and click the Select/Close button.
6. Double-click <Seq
   #/Line #> to view the selected work order's operation
   line items. There may or may not be lines to which you can establish
   demand links from the present purchase order receipt line in this
   work order.

The Work Order Material Operations Demand
dialog box appears.

The service to which you are assigning supply
from the current service purchase order line appears in the Service
ID field at the top of the header section.

7. Configure a search using
   the options in the header section and then click the Apply
   button.

If any operations in the work order for
the specified material exist, the lines of the selected work order
that meet your search criteria appear.

8. Select the appropriate
   line and click the Ok button.

The selected work order line information
appears in the Assign to Demand dialog box line item table.

9. In the Assign
   Quantity column, enter what quantity of the received purchase
   order line's Remaining Quantity to Assign
   you want to allocate to this work order's material operation demand.

This quantity cannot be greater than the
of the purchase order receipt line or the Unallocated
Requirement Quantity of the work order line.

10. Click the Ok
    to commit the allocation of supply from purchase order line work
    order's material operation demand line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.md) User-defined Help