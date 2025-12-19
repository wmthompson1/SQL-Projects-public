Creating Service Purchase Orders




# Creating Service Purchase Orders

Use Purchase Order Entry to create new purchase orders.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site that is purchasing the service. If you
   are a licensed to use a single site, this field is unavailable.
2. If you are NOT using
   Auto Numbering, or if you want to override Auto Numbering, enter
   your companys Order ID for the purchase order in the Our Order
   ID field.

For example, you may want to use the number
from a pre-numbered purchase order form.

If you are using Auto Numbering, leave this
field blank.

VISUAL assigns the number the first time
you save the purchase order.

3. If necessary, change
   the Order Date.

Order Date defaults to the current date.

4. Enter the Vendor ID
   of the Vendor from whom you are ordering the part, or click Vendor ID button and select a vendor from
   the Vendors table.

After you enter the Vendor ID, VISUAL fills
in much of the vendor information for you. This information comes
from the Vendor database.

5. Enter the Desired Receive
   Date for this purchase order.

The Global Scheduler, Material Planning
Window, and all material availability checks use this field to predict
material availability.

6. Enter the original promise
   date of this purchase order.
7. Enter the purchase order
   status in the Status field.
8. Enter the vendor contacts
   information in the appropriate fields.
9. Select the Header
   tab and enter the applicable information.

The Header tab includes vendor Purchase
From and Ship To addresses.

FOB - If necessary,
override Free On Board information by selecting the appropriate FOB
information from the drop down box.

Ship Via - If
necessary, override Ship Via by selecting the appropriate Ship Via
from the drop down box.

Buyer - If necessary,
override Buyer information by selecting the appropriate Buyer information
from the drop down box.

10. If necessary, change
    the Ship To address by clicking on the Ship
    Addr button to set the Ship To address.

The Ship To Addresses dialog box appears.

The table at the top of the dialog box lists
the Ship To addresses defined for your company.

Select the line of the appropriate address
and click the Use Selected Ship To Address
button.

Click the Clear Ship
To Address on Order button to clear the Ship To address.

When you select a Ship To Address, the dialog
box closes automatically. The selected address appears at the bottom
of the Purchase From/Ship To field.

You can also use this dialog box to add,
modify, and delete Ship To addresses for your company.

11. Select the Blanket
    tab and enter the applicable information.

EDI Blanket Order
- An order you place for a given period of time that stands until
the quantities shipped match the total quantity ordered in the blanket
order. After the quantities shipped match the total quantity ordered,
you need to place a new blanket order to continue to receive parts.
For example, rather than placing 100 individual purchase orders of
1000 pieces, you can blanket order 100,000 pieces at once.

EDI Blanket Number
- The authorization number for the total quantity of parts on the
blanket order.

Contract ID -
The contract ID for the delivery schedule.

Shipto ID - The
ship to ID for the delivery schedule.

12. Click the Dispatch
    tab and enter the applicable information for outside services.

FOB - Select the
appropriate free on board from the drop down box.

Ship Via - Select
the method of transportation from the drop down box.

Ship from Addr
- Click this button to select the address of the vendor providing
the service.

13. Click the Ship
    To Addr button to set the Ship To address.

The Ship To Addresses dialog box appears.

The table at the top of the dialog box lists
the Ship To addresses defined for your company.

14. Select the line of the
    appropriate address and click the Use Selected
    Ship To Address button.

Click the Clear Ship
To Address on Order button to clear the Ship To address.

When you select a Ship To Address, the dialog
box closes automatically. The selected address appears at the bottom
of the Purchase From/Ship To field.

You can also use this dialog box to add,
modify, and delete Ship To addresses for your company. See [Entering
Shipping Addresses](Entering_Shipping_Addresses.md).

15. If necessary, override
    FOB and Ship Via information by changing the appropriate fields.
16. Click the Insert
    button to start adding line items to the Purchase Order.

VISUAL adds a new row to the top of the
table area and assigns it a line number.

The first column you select and the tab
movement between columns depends on your configuration of the line
item table. The procedures described below are for columns in standard
order. In many cases, order of entry is not important. You may want
to change the order accordingly.

17. Move to the Service
    ID field and enter the ID for the appropriate service.

If you do not know the ID, you can call
up a table of services by double-clicking on the column header.

If you enter a Service ID for a service
with a preferred vendor, but you have not previously entered a Vendor
ID for the purchase order, VISUAL automatically uses the Vendor ID
and information for the preferred vendor.

18. Enter the following
    information:

Base ID/Lot ID/Split
ID - These fields specify the work order you are placing the
purchase against.

Double-click the Base ID column header to
call up the Work Orders table.

The Work Order table dialog box appears.

The Work Orders table contains all released,
unreleased, firmed and closed work orders.

19. When you select a line
    from the Work Orders table, VISUAL fills the Base ID, Lot ID and
    Split ID fields.

Sub ID/Seq # for Service
- These fields specify the work order leg and operation sequence number
of the purchase order being made.

For a service, click the Seq # column header
to browse the Sub ID/Seq # for all operations of the selected work
order that use the specified Service ID.

20. When you select a work
    order, VISUAL fills in Sub ID and Seq. #.

Sub ID/Seq #/Piece #
for Part - These fields specify the work order leg, operation
sequence number, and individual piece part number to which the purchase
is being made.

For a material purchase, double-click the
Piece # column header.

The Work Order Material Requirements table
dialog box appears.

This table contains Sub ID/Seq# Piece Numbers
for all material requirements in the selected work order. You can
view any specifications by clicking View Specifications. When you
select a line from this table, VISUAL fills in Sub ID, Seq#, and Piece
#.

You can link a single purchase order line
to multiple work orders. For example, a single purchase of material
can be designated for multiple jobs. Only the first linked order appears
on the line item. To view and modify multiple linkages, select Assign to Work Order from the Edit
menu.

For easier linking of purchases to work
orders, you can use Purchase This Material/Service from the Manufacturing
Window, or Purchase to Job from the Material Planning Window.

21. If
    you want to purchase directly against a general ledger account,
    enter the account number in the G/L Expense Account ID column.
    Double-click the column header to select the appropriate G/L accounts.

This is an override field only. Default
accounts do not display in this field. You do not need to enter accounts
here.

22. If necessary, view or
    edit VAT information in the following fields:

VAT Code - The
VAT Code automatically populates with the default from Part Maintenance.

VAT % - The VAT
% is the tax percent based on the selected VAT code. You CANNOT edit
this field.

VAT Amount - The
VAT Amount is based on the VAT percent.

VAT Rcv % - The
VAT Rev % is the recoverable tax percent based on the selected VAT
code. You CANNOT edit this field.

VAT Rcv Amount
- The VAT Rev Amount is the amount of recoverable tax based on the
VAT percent.

23. Click the Insert
    button to add additional lines.

You can delete unwanted lines by selecting
the line and clicking on the Delete button.

VISUAL marks the line for deletion (an "x"
to the left of the line item) and removes it the next time you save
the purchase order.

24. Click the Save
    button to save the new Purchase Order.

If you do not specify a status of Firmed,
Released, Closed, or Cancelled/Void in the Status field, VISUAL creates
the PO with a default status of Firmed or Released.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Changing_Purchase_From_Addresses.md) Changing Purchase From Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Purchase_From_Addresses.md) Editing Purchase From Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Changing_Ship_To_Addresses.md)
Changing Ship To Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Ship_To_Addresses.md)
Editing Ship To Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Dispatching_Outside_Services.md) Dispatching Services

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.md) User-defined Help