Firming and Releasing Planned Orders




# Firming and Releasing Planned Orders Advanced Material Planning

Use the Firm Orders dialog box to consolidate multiple
planned orders on a single purchase order or work order depending
on part type. When you create purchase orders, you can specify whether
you want to consolidate orders by vendor or only allow a single part
per order. You can also specify if you want to create delivery schedules
or separate line items for each planned order.

Also use the Firm Orders window to firm or release planned orders.
To place an actual work order or purchase order for a planned order:

1. Select a planning period
   date column.

Note:
To load a different planning period, click the column header in the
main Advance Material
Planning window, or hold down the control key while clicking
on each column heading to load multiple consecutive columns.

2. Select Firm/Release
   Planned Order from the Edit menu.

VISUAL defaults to the part currently in
the window.

3. Select the Populate on initial open check box if
   you want the data to populate in the Firm
   Orders window when it is initially accessed.

The data in the Firm
Orders window can be populated based on the selected filters
and configured options. See, [Configuring
Options](Configuring_Options.md).

4. Enter the starting and
   ending Part IDs in the Starting and Ending Part ID fields.

VISUAL defaults to the part currently in
the window.

5. Select a product code
   from the Product Code drop down box. "All" is the default.
   Enter product codes in Part Maintenance.

6. Select a commodity code
   from the Commodity Code list box. "All" is the default.
   Enter commodity codes in Part Maintenance.
7. Select the appropriate
   option button. This selection dictates what parts VISUAL displays.

If you select Fabricated,
VISUAL displays only parts in that planning period that are fabricated
and makes unavailable the Purchase Order Number Generation, Purchase
Order Rules, and the Purchase Order Line Item Rules sections below.
These two sections apply only to parts that you purchase through purchase
orders.

If you select Purchased,
VISUAL displays only parts in that planning period that are purchased
and makes unavailable the Work Order Number Generation and Work Order
Rules sections below. These two sections apply only to parts that
you fabricate through work orders.

If you select Both,
VISUAL displays parts that are both fabricated and purchased for that
planning period. All options are available below as well.

8. To sort the table by
   Vendor ID or Order ID, use the buttons at the bottom of the window.
   To sort the table by Part ID, Release Date, Want Date, Status,
   Qty On Hand, Projected Availability, or Available Quantity, double-click
   the column header.

9. Select the row that
   contains the part you want to order.
10. If the part is fabricated,
    select the appropriate Work Order Number Generation option button.

An engineering master must exist for fabricated
parts.

If you want the Work Order number to be
the next number in the Work Order number sequence, select the Use
the Next Number in Sequence option button.

If you want the Work Order number to be
the work order's want date and the work order's first operation Resource
ID, select the Use the want date w/ the first operation
Resource ID check box.

For example, 10TON - 01012000 is the Order
ID for a work order with a first operation Resource ID of 10TON and
a want date of January 1, 200.

If you want the Work Order number to be
the work order's want date and Part ID, select the Use
the want date w/ the Part ID check box.

Note:
After the firm/release
planned orders form is open, changing the part ID in the main
Advanced Material
Planning window does not change the part filter in the firm/release planned orders
form.

11. Select the appropriate
    Work Order Rules option button:

Consolidate work order
quantity - If you select this option button, VISUAL uses the
sum of the total quantity for all planned orders with the same Part
ID as the quantity for the work order. VISUAL creates only one work
order. This is the default.

Make separate work orders
- If you select this option button, VISUAL creates a separate work
order for each planned order.

12. If you want to forward
    schedule the order from the release date, select the Forward
    Sched From Release Date check box.

13. If you want VISUAL to
    copy all of the document references from the part's engineering
    master to the new work order, select the Copy
    All Document references check box.
14. If the part is purchased,
    select a Purchase Order Number Generation.

If you want the Purchase Order number to
be the next number in the Purchase Order number sequence, select the
Use the Next Number in the Sequence radio
button.

If you want the Purchase Order number to
be the Want Date and the Part ID, select the Use
the Want Date w/the Part ID radio button.

Select the appropriate Purchase Order Rules
option button:

Consolidate orders by
vendor - If you select this radio button, VISUAL adds multiple
Part IDs for the same preferred vendor on the purchase order. This
is the default.

Single part per order
- If you select this radio button, VISUAL creates a separate purchase
order for each Part ID for each selected part.

Select the appropriate Purchase Order Line
Item Rules option button:

Make delivery schedules
- If you select this radio button, when multiple planned orders exist
for the same Part ID, VISUAL creates a separate delivery schedule
for each planned order. There is only one line item per Part ID. This
is the default.

Make line items -
If you select this radio button, VISUAL adds each planned order as
a separate line on the purchase order and creates no delivery schedules.

Vendor ID In
the table, specify the ID of the vendor from whom you are purchasing
this material. To create an internal purchase order, specify the ID
of an internal vendor. Use internal purchase orders if you are licensed
to use multiple sites and you want one of your entities to supply
another entity. Set up internal vendors in Vendor Maintenance.

Internal Order
If you specified an internal vendor, this check box is selected.
Select this check box to create an internal purchase order. When you
create an internal purchase order, a corresponding internal sales
order is created automatically. Specify the ID of the internal customer
in the Internal Customer field. If you want to use an internal vendor
for this order, but you do not want to automatically create a corresponding
sales order, clear the check box.

Internal Customer
If you selected the Internal Order check box, specify the ID of
the internal customer that is purchasing the goods.

15. Click the Order
    button to create the order.

If VISUAL creates a purchase order, the
line remains in the line item table; if it creates a work order, after
you click Ok at the prompt the line disappears.

VISUAL converts the planned supply order
to an actual order. If there are associated planned requirements for
the order, they are replaced by the actual requirements associated
with the new order.

Remember that you must schedule any new
work orders using the Global Scheduler or the Schedule Current Work
Order command in the Manufacturing Window.

Note:
When you double-click a row header, the value in the part ID field
on the Parent Material
Planning window is updated with the line item part ID.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Material_Planning_Window.md) User-defined Help