Receiving a Returned Shipment




# Receiving a Returned Shipment

Use Shipping Entry to process a returned shipment.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which you created the order. If you
   are licensed to use a single site, this field is unavailable.
2. Click the Order
   ID browse button and select the order containing the returned
   item.
3. If you are licensed
   to use dimensional inventory, click the Packlist
   ID browse button and select the packlist for quantity the
   customer is returning. If you are not licensed to use dimensional
   inventory, you can leave the Packlist ID field blank.
4. Click the Return
   button.

The Customer Order Shipment Returns dialog
box appears. The table has one line for each customer order line item.

5. Set the Return date.

This date defaults to the current date.

The line item table contains essentially
the same information as the Shipping Entry line item table. The Trc
column indicates whether the part is traceable.

6. Specify the quantity
   the customer is returning to you.

If the customer is returning a standard
part, specify the quantity in the Qty Returned column.

If the customer is returning a piece tracked
part, specify the number of pieces and dimensions that the customer
is returning. The customer can return pieces with different dimensions
from the pieces originally shipped. For reference, the number of pieces
and the dimensions of the shipped part are displayed in the Pieces
Shipped, Length Pieces Shipped, Width Pieces Shipped, and Height Pieces
Shift fields. Specify this information:

Returned Pieces
Specify the number of returned pieces.

Returned Length, Returned
Width, and Returned Height Specify the dimensions of the
pieces that the customer is returning to you.

After you specify the number of pieces and
the dimensions, the Qty Returned is calculated based on the conversion
factor for this part.

For both standard and piece tracked parts,
you cannot specify a return greater than the original shipment.

7. For return of inventory
   parts, you must also specify Warehouse ID and Location ID in which
   to receive the returned parts.

These fields default to the primary location
defined in Part Maintenance. If no primary location is defined, you
must manually specify the location.

Although you must use an existing Warehouse
ID, you can enter a Location ID that is not currently defined as valid
for the part, or a Location ID that does not exist at all. If you
do this, a dialog box appears, asking if you want to use the location
anyway.

If you click Yes,
VISUAL creates the new location, if necessary, and set up the new
location as a valid location for the part.

8. In the Description column,
   optionally specify a description of the transaction. You can use
   the description to specify the reason for the return. The text
   that you specify is displayed in the Description field when you
   view the transaction in Inventory Transaction Entry.
9. Click the Save
   button to process the return.

If the return transaction is successful,
the dialog closes and a new packlist is created. The Ship Qty that
is displayed on the new packlist is minus the return.

If the customer order is closed, you can
reopen it if you intend to reship the part. Click Yes
when you are prompted to reopen the order. The order header status
is updated to Released. The lines against which returns were made
are updated to Inherit.

If you choose not to reopen the order, the
order header status remains Closed. If the status of the line was
Inherit, it remains Inherit.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Receiving_Returned_Shipments.htm) Receiving Returned Shipments from Customers
with RMA Requirements

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Assigning_Supply_from_Returned_Shipments_with_Demand_Links.htm) Assigning Supply from Returned Shipments
with Demand Links

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Assigning_Supply_from_Returned_Shipments_with_Delivery_Schedule_Lines.htm) Assigning Supply from Returned Shipments
with Delivery Schedule Lines

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help