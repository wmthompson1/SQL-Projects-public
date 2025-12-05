Editing a Purchase Order




# Editing a Purchase Order

If no receipts have been made for a purchase order,
you can edit any field on the order, including adding and deleting
purchase order lines. If an order is closed, you may be prompted to
reopen the order before saving changes.

If receipts have been made for a purchase order, then your ability
to edit the order depends upon whether the Prevent edit of PO after
receipt check box is selected for the vendor in Vendor Maintenance.
[See Adding Vendors](VMVNDMNTfrmVendor.htm).

If the Prevent edit of PO after receipt check box is selected for
the vendor, then you cannot edit any information on the purchase order
after a receipt has been made. Even if all receipts for the order
have been returned, you cannot edit the order if the Prevent edit
of PO receipt check box has been selected for the vendor.

If the Prevent edit of PO after receipt check box is cleared for
the vendor, then you can edit certain information on the order. You
can edit this information:

To edit a purchase order:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site from which the customer is buying items.
   If you are licensed to use a single site, this field is unavailable.
2. Call the Purchase Order
   you want to edit into the Purchase Order Entry window.

|  |  |
| --- | --- |
| POSTIT.gif | Purchase Order Entry can detect if receipts have been made against this PO. If no receipts have been made, you can edit all information except the Our Order ID. This field is the unique specifier for the PO; changing it creates a new purchase order.  You can use Purchase Receipt Entry to see if receipts exist for a purchase order. You can use the Receiver ID table to search for receivers against the purchase order ID in question. In general, you can tell whether receivers exist by using Purchase Order Entry. |

3. Make changes.

Header
You can change all fields in the purchase order header.

If you change
the Vendor ID after receipt (to correct a wrongly specified vendor),
the receiving paperwork is changed to show the receipt from the new
vendor. If you return the material and then purchase it from a different
vendor, you should use the Return feature of Purchase Receipt Entry.

If you change
the Vendor ID to a vendor that does not allow purchase orders to be
edited after receipts are made, then you cannot edit any other information
on the order.

|  |  |
| --- | --- |
| POSTIT.gif | Change the Vendor ID only after receipt to correct a wrongly specified vendor. If you receive material from one vendor and then change the Vendor ID, the receiving paperwork shows the receipt from the new vendor. If you return the material and then purchase it from a different vendor, you should use the Return feature of Purchase Receipt Entry. |

PO lines
You can edit this information:

[Quantity](javascript:TextPopup(this))

This allows you to make adjustments after you receive a material:
you may want to increase the order quantity without creating a
new purchase order. You cannot enter a quantity less than the
amount you received.

[Vendor
Part ID](javascript:TextPopup(this))

Unit Price and U/M are automatically updated if a cross-reference
exists for the current Part ID and Vendor ID.

[Unit
of Measure](javascript:TextPopup(this))

You should only modify Unit of Measure if it does not match
the true unit of measure of the material you received. For example,
if you purchase and receive 10 Pounds, but the PO specifies 10
Feet, you can correct the U/M on the PO at this point.

[Receive Date](javascript:TextPopup(this))

For material planning and scheduling to work properly, this
field should be as accurate as possible. You can modify Recv Date
based on any updated estimates when your vendor notifies you of
changes.

[Prices and Discounts](javascript:TextPopup(this))

Actual Costing automatically handles purchase price variances
between PO and Invoice. You do not have to manually update these
fields to reflect this difference. If you enter updated values
before you receive an invoice, you can estimate actual cost more
accurately.

[G/L Expense Account](javascript:TextPopup(this))

This field is not used until you assign the PO to an invoice.

[Links](javascript:TextPopup(this))

You can modify links to work orders after you receive materials.
You can also add new work order links to a lines and delete existing
links. By keeping this information up to date, material planning
and availability checking can make more accurate calculations.

[Part ID](javascript:TextPopup(this))

You cannot change the Part ID of a line after you have received
parts against the line.

[Service ID](javascript:TextPopup(this))

You cannot change the Service ID on a line after you have received
parts against the line.

[Linking a Work Order](javascript:TextPopup(this))

You can create a demand link to any unreceived parts or service
on a partially received line. You can do this by using Assign
to Work Order to add the necessary links.

[Adding New Lines](javascript:TextPopup(this))

If the purchase order is open, you can add new lines to it.
To add new lines to a closed purchase order, change its status
to released and add the lines.

The following situations may exist:

Link a work order to
a line for a partially received material - If a line has been
partially received, you may want to add or modify work orders linked
to the balance of the material. You can do this by using Assign to
Work Order to add the necessary links. Purchase Receipt Entry automatically
issues the material to the work order when it is received.

Link a work order to
a line for a material you have already received - Use Assign
to Work Order to add the link. You must use Inventory Transaction
Entry to manually issue the material from inventory to the work order.

Remove a work order link
for a material you have already received - Use Assign to Work
Order to delete the link. You must use Inventory Transaction Entry
to return the material to inventory.

Reassign materials you
have already received from one work order to another

Add new line items using the method described
in [Creating a Purchase Order](VMPURENTfrmPurchaseOrder.htm).
- You must re-release a closed PO to add new line items.

Delete any un-received lines, as necessary.

4. Click Save
   to save the changes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help