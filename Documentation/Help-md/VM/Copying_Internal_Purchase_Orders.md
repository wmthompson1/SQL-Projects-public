Copying Internal Purchase Orders




# Copying Internal Purchase Orders

You can create a new internal purchase order from an existing internal
purchase order.

To create a new order:

1. In Purchase Order Entry,
   select the internal order to copy.
2. Select Edit,
   Copy Purchase Order.
3. In the To PO ID field,
   specify the ID of the new purchase order. Leave this field blank
   to use the auto-numbering scheme set up for purchase orders.
4. Specify the information
   to copy:

Copy PO Line Items
To copy the purchase order lines, select this check box. To copy
the header information only, clear this check box.

Copy PO Line Item Links
This check box is available only if you selected the Copy PO Line
Items check box. To copy demand links, select this check box. Clear
this check box if you do not want to copy demand links.

Copy Delivery Schedule
This check box is available only if you selected the Copy PO Line
Items check box, and at least one purchase order line has a delivery
schedule. To copy the delivery schedules for the line items, select
this check box. Clear this check box if you do not want to copy delivery
schedules.

Copy Document References
To copy the documents attached to the purchase order header, select
this check box. If you do not want to copy document attachments, clear
this check box.

Copy Line Document References
To copy the documents attached to the purchase order lines, select
this check box. If you do not want to copy documents attached to the
lines, clear this check box.

Create Internal Order
To create the new purchase order as an internal order, select this
check box. When you select this check box, the Internal Cust ID field
becomes available. Specify the ID of the internal customer. If you
are copying an existing internal order, the internal customer ID specified
on the existing order is inserted by default.

Use Cust VAT Tax
If applicable, specify the VAT code to apply to the customer order.

To use the VAT code that is specified on
the internal vendor record, clear the Use Cust
VAT/Tax check box.

To use the internal customers tax information,
select the Use Cust VAT/Tax check box. To
use the tax information on the main customer record, leave the SO
VAT/Tax Shipto ID field blank. To use tax information that is associated
with a customer address, specify the ID of the address in the SO VAT/Tax
Shipto ID field.

5. Click the Copy
   button. The new order is created.

You cannot close the original purchase order using the copy dialog.
The Close Order check box is not available for selection.