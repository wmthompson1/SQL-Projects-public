Receiving Items on a Purchase Order




# Receiving Items on a Purchase Order

Use this procedure when receiving a complete purchase
order.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you created the purchase order. If you are licensed
   to use a single site, this field is unavailable.
2. Enter the Order ID for the purchase order.

The Purchase Order must have a status of
Released.

If the Auto Backorder
Selection Mode option from the Options
menu is active, VISUAL intelligently selects backorders based on the
PO Order ID. If you enter an Order ID for a closed order that has
backorders, VISUAL automatically selects the first open backorder
PO associated with that order.

For example, if PO 4001 was partially received,
and the backorder option is active, then VISUAL closes 4001 and creates
and releases 4001-1. If Auto Backorder Selection Mode is active and
you enter 4001 for the Order ID, VISUAL automatically calls up 4001-1.

3. Enter the Receiver ID for the transaction to receive
   these items.

If you are using Auto Numbering, you can
leave this field blank.

|  |  |
| --- | --- |
| POSTIT.gif | If you are receiving a consignment order, the Consignment Tracking check box appears selected. |

4. Alter the FOB field,
   if necessary.
5. Set Actual Recv Date to the appropriate date.

On startup, this field defaults to the current
date. After this, it defaults to the last Actual Recv Date used in
the session, regardless of the PO or Receiver that is currently called
up.

6. You may want to examine
   the Warehouse ID and Location ID for each inventory item to make
   sure they are correct.

You can change the Warehouse and Location
ID by selecting the line item and double-clicking on the Location
ID column header, then selecting from a table of valid locations for
the part.

|  |  |
| --- | --- |
| POSTIT.gif | When receiving consignment purchase orders, you must specify the correct consignment location into which you want to receive the part. |

If no Location ID appears, there are no
locations defined for the part. A part must have at least one location
defined to be received. You can do this through Part Maintenance,
or allow the Purchase Receipt Entry application to do it for you.
As noted above, you do not need to specify a warehouse and location
for a non-inventory part or for a service. These items are received
directly to work orders.

If you want to receive into a Warehouse/Location
that is defined in Warehouse Maintenance, but isnt currently assigned
to the Part ID, you can enter the Warehouse ID and Location ID into
the line item fields.

If you want to create a new warehouse location,
follow the same procedure. The system will create the new location,
assign it to the part, and receive the material into the new location.

7. To receive all materials
   on the purchase order, click the Receive All
   button.

This receives all of the items on the purchase
order by setting the Quantity Received for each line to Quantity Ordered
minus Total Qty Received. This receives all of the outstanding items
on the purchase order.

If the receipt is successful, the purchase
order will automatically be closed.

To make a partial receipt of materials on
this purchase order, enter the appropriate Quantity Received, if any,
on each line, then click the Save button.

The system prompts you to confirm the operation.

Select from the following options:

Leave order open (partial
receipt, backorder balance) - This leaves the order open awaiting
the remainder of the shipment. The purchase order does not close.

Copy remaining unreceived
lines to separate backorder - This copies the remaining quantities
to a new purchase order. The same Order ID is used, with the addition
of a suffix consisting of a dash and a digit. For example, if the
purchase order ID is 4001, the new Order IDs will be 4001-1, 4001-2,
etc. These are referred to as backorders, and are created to allow
the original order to be closed. This is common when some line items
are completely received, and others are back-ordered by the vendor.

The system understands that orders numbered
in this way are backorders, and is able to intelligently retrieve
them. If possible, you should avoid using a dash in your PO numbering
scheme.

Close order (partial
receipt, no backorder) - This is useful when the original order
quantity has been changed, or is not received for some reason. For
example, consider a case where a vendor ships you a partial shipment
on an order. The back-ordered quantity may not be available in a time
to suit your needs, and you may purchase from another vendor. This
option allows you to arrange with the vendor to cancel the remainder
of the shipment, and close the order short.

If the receipt operation is successful,
VISUAL creates a new receiver. The Receiver ID of the new receiver
appears in the Receiver ID field.

The Purchase Receipt Entry window immediately
returns to a condition where it is ready to create the next receiver.
VISUAL updates the Total Qty Recv to reflect the receipt, Last Recv
Date remains set to the last date used, and Quantity Received resets
to 0. Warehouse ID and Location ID always default back to the primary
location, or, if there is no primary location defined, the first location
on the list.

Because of this, the Purchase Receipt Entry
window does NOT show a complete record of the receipt just made. Do
not use the Purchase Receipt Entry window as a viewer for previous
receipts, but only to enter new ones.

## Closing a Service Line Short

When you close a line for an outside service short, you can also
have the option of also closing the linked operation on the work order.

To receive the prompt to close the operation, you must specify your
preference in Preferences Maintenance. To specify this setting:

1. Select Admin,
   Preferences Maintenance.
2. Click the Insert
   button.
3. Specify these settings:

Section Specify
Receiving.

Entry Specify
CloseLinkedOperationShort.

Value Specify
Y.

4. Click the Save
   button.

When you receive the service short in Purchase Receipt Maintenance,
select the Close order (partial receipt, no backorder) option, and
then click Ok. You are then prompted to close the work order operation
linked to the service receiver line. Click Yes to close the operation.
Click No to leave the operation open.

## Closing a Purchase Receipt Line without Receiving a Quantity

You can close a purchase receipt line without receiving any quantity.
Select the Close Ln Short check box, then
enter 0 in the Quantity Received field. Click Save.
The system asks if you intended to close the line without receiving
a quantity. Click Yes to confirm.

## Using the Auto-fill Receipt Quantity Preference

By default, the remaining quantity to be received is inserted in
the Quantity Received column when you select the row in the Purchase
Receipt Entry table or the delivery schedule table. Use Preferences
Maintenance to remove this functionality and require users to specify
the quantity received on the line.

This preference does not apply to the Receive All function. Regardless
of the preference setting you choose, quantities are automatically
populated if a user clicks the Receive All button or select File,
Receive All.

1. Select Admin,
   Preferences Maintenance.
2. Click the Insert
   button.
3. Specify these settings:

Section Specify
Receiving.

Entry Specify
AutoFillReceiveQty.

Value Specify
N to require users to manually specify the quantity that is being
received. Leave the value blank or specify Y to automatically populate
the Quantity Received column when users select the row.

4. Click the Save
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help