Shipping a Customer Order




# Shipping a Customer Order

To ship against a customer order:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you placed the customer order. If you are licensed
   to use a single site, this field is unavailable.
2. Enter the Order ID of the customer order to ship, or
   click the Order ID button to select from a list of released customer
   orders.

You can only ship against an order with
a Released status.

The header and line item information for
the order appear. Only line items with quantities remaining to be
shipped appear.

When you first start Shipping Entry, the
Ship Date defaults to the current date. After this, it defaults to
the last Actual Ship Date.

|  |  |
| --- | --- |
| POSTIT.gif | When shipping any part that is marked for consignment, the Consignment Tracking check box appears selected.  The Consignment tracking check box appears grey indicating that you cannot make changes to its status. |

3. Modify the ship date
   if the actual shipment took place on a different date.
4. If you have selected
   the Auto calculate check box in Shipping Entry Preferences, the
   system determines the supply status based on the calculation setting
   you specified. If you did not select the Auto calculate check
   box, you can click the Calculate Supply Status
   button to calculate the supply status. For more information on
   how the system calculates supply status, refer to Setting Shipping
    Entry Preferences. The system inserts one of the following
   values in the Supply Status field:

In Stock The
system inserts In Stock if you have sufficient quantity of the part
on hand to ship the order.

Expected The
system inserts Expected if the quantity of the part you have on hand
plus the quantity of the part you have on order and due to arrive
in inventory before the Desired Ship Date (on the customer order)
exceeds the amount required to ship the order. Amount on order includes
both parts you are in the process of purchasing and parts scheduled
to be made on a released and scheduled work order.

No Supply The
system inserts No Supply if the quantity of the part you have on hand
does not exceed the amount required to ship the order.

5. On the General tab,
   optionally update this information:

FOB Specify the free on board code for the shipment.
This code indicates when ownership of the shipment changes from the
shipping company to the receiving company. The code that was specified
on the customer order is inserted.

Ship Via Specify the shipping method to use
to send the order. The code that was specified on the customer order
is inserted.

Ship Charge Acct If the customer requests that
you charge shipping costs directly to the customers account when
you ship items be the ship via method that you selected, specify the
customers account number. The account that was specified on the customer
order is displayed.

Ship Status
The ship status that is specified on the packlist is inserted. These
statuses are used:

Shipped A new packlist
is created that has not yet been approved for invoicing.

1, 2, 3 (Review levels)
These values have a user-defined meaning. By specifying who can
set various statuses using Security Maintenance, you can create an
approval work flow procedure.

Approved When a
packlist with this status is detected, the invoice forms program can
generate an invoice for the packlist. Invoice generation ignores packlists
with other statuses other than A.

Notification Sent
This check box contains a checked value if an email notification
is sent for the current packlist at least once. This is read-only
check box

6. For each line item,
   enter the actual freight amount, if any, in the Actual Freight
   field. Specify actual freight amounts in the customer's currency.
7. For each line item,
   enter Warehouse ID and Location ID, if necessary.

For line items with inventory parts, the
Warehouse ID and Location ID default to the primary location for the
part, or the first defined location if no primary location exists.

You may want to double-check these locations,
and change them if needed. You can enter the IDs, or double-click
the Location ID column header to select from a list of valid locations
for the part. You may want to pay particular attention to the on-hand
quantity in each location.

You must specify a valid location for shipment
of inventory parts; the parts in this location must not be on hold.
If the part is on hold in the selected location, VISUAL notifies you
when you attempt to save the pack list.

8. Specify the quantity
   to ship. Provided that the shipment does not include any piece-tracked
   parts, you can click the Ship All toolbar button to ship all items
   on the order. Each Ship Qty field is completed with the remaining
   quantity needed and creates the pack list for the shipment.

If you are shipping a piece tracked part,
you cannot use the Ship All button. You must specify this information:

Pieces to Ship
Specify the number of pieces you are shipping.

Length/Width/Height
Specify the dimensions of the pieces you are shipping. You can specify
dimensions different from the dimensions on the customer order.

After you specify the number of pieces and
the dimensions, the quantity to ship is calculated.

9. If you specified a ship
   quantity that is less than the order quantity, specify how to
   process the remaining quantity on the customer order line:

* To close the
  line, click Yes in the dialog box. The
  lines status is updated to Closed, and the Closed Short check
  box is selected for the order line. If the line is the only line
  in the order, the customer order header status is also updated
  to closed. If the line is not the only line in the order, you
  are prompted to decide how to process the remaining lines on the
  order after you click Save. See step 11.
* To leave the
  line open, click No in the dialog box.
  No updates are made to the lines status. You are prompted to
  decide how to process the remaining balance after you click Save.
  See Step 11.

10. If you ship a quantity
    for a line that is greater than the total remaining to be shipped,
    the system asks how it should handle the overage. Choose one of
    these options:

Distribute to other lines
for the same Part ID This searches for other line items with
the same Part ID and distributes the overage to each line in turn.
This is done one line at a time until no more quantity remains to
be distributed, or no more lines remain to which you can distribute.

At this point, the remaining overage remains
in the Ship Qty for the original line. Selecting this option when
there are no other lines with the same Part ID has the same effect
as selecting Over Ship on this Line.

Over ship on this line
This leaves the Ship Qty as-is, and allows this line to specify
more shipped parts than the order quantity.

11. Click the Save
    button.

The information is saved.

* If you shipped
  all quantities on the order, the header status of the customer
  order is updated to Closed. If the shipped lines had a status
  of Released, the status of the lines is updated to Closed. If
  the shipped lines had a status of Inherit, the status of the lines
  is not updated. The lines with a status of Inherit are considered
  closed because the order header status is closed.
* If you shipped
  partial quantities, specify how to process the remaining balance.
  A shipment is a partial shipment if you did not ship all lines
  in the order or if you shipped partial quantities of order lines
  and did not close the lines short. Click one of these options:

Leave Order Open (partial
shipment, backorder balance) Click this option to process
remaining shipments from the original customer order.

When you click this option, the status on the
customer order header is not updated. The statuses of order lines
that you did not ship are not updated.

If you clicked Yes when you were prompted to
close the order line in step 9, then the status of the line that you
shipped is updated to Closed.

If you clicked No when you were prompted to
close the order line in step 9, then the status of the line that you
shipped is not updated.

Copy remaining unshipped
lines to a separate backorder Click this option to close
the original order and create a separate back order.

When you select this option, these updates
are made to the original order:

* The status
  on the header is updated to Closed.
* Lines
  that had a status of Firmed, Released, or On Hold are updated
  to Closed. The check box that indicates that the lines were closed
  short is selected.
* Lines
  that had a status of Closed or Cancelled remain Closed or Cancelled.
* Lines
  that had a status of Inherit are updated to Closed if you click
  Yes in the prompt to close the remaining quantity when you ship
  the line.
* Lines
  that had a status of Inherit retain a status of Inherit if you
  click No in the prompt to close the remaining quantity when you
  ship the line.

The new backorder has these characteristics:

* The ID
  of the new backorder is the original order ID followed by a dash
  and a digit. For example, if the Order ID is 2005, the new Order
  IDs become 2005-1, 2005-2, etc. If possible, you should avoid
  using a dash in your Customer Order ID numbering scheme.
* On the
  Other tab in Customer Order Entry, the Is Separate Back Order
  check box is selected for the new backorder.
* The header
  status of the new backorder is the same as the header status of
  the original order before shipment. For example, if you click
  this option after partially shipping a released line on an order
  that has a header status of Firmed, the backorder has an order
  status of Firmed.
* Lines
  from the original order that have remaining balances are copied
  to the backorder. The status of the lines on the backorder is
  the same as the status of the lines on the original order before
  shipment.
* Lines
  that do not have remaining balances are not copied to the backorder.
  A line has no remaining balance if it is closed or canceled.

Close order (partial shipment,
no backorder) Use this option to close the order. No other
shipments from the order can be made.

When you click this option, the header status
of the order is updated to Closed.

If the status of the line is Firmed, Released,
or On Hold, the status is updated to Closed.

If the status of the line is Inherit, Closed,
or Canceled, no updates are made to the line status. Lines with a
status of Inherit are considered closed because the header status
is closed.

## Overriding the Customer Credit Limit During Shipment

If you specified Override Allowed in the Ship Credit Limit Control
field for the customer in Customer Maintenance, then the customers
credit limit is checked. If the customer has exceeded its credit limit,
a dialog is displayed. Click Yes
to ship the order.

Note: Additionally, the
age limit is checked if the customer has a Receivable Age Limit. If
the customer has unpaid invoices older than the receivable age limit
a dialog is displayed. Click Yes
to ship the order.

If you specified No Override in the Ship Credit Limit Control field
for the customer in Customer Maintenance, then the customers credit
limit is checked. If the customer has exceeded its credit limit, a
dialog is displayed. You cannot ship the order.

Note: Additionally, the
age limit is checked if the customer has a Receivable Age Limit. If
the customer has unpaid invoices older than the receivable age limit
a dialog is displayed. You cannot ship the order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Shipping_Intrastat_Items_for_a_Customer_Order.htm) Shipping Intrastat Items for a Customer
Order

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help