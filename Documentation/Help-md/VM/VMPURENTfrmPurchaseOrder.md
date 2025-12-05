Creating a Purchase Order




# Creating a Purchase Order

Use Purchase Order Entry to create new purchase orders.
Specify general information about the purchase order in the purchase
order header. Specify the parts or services ordered in the line item
table.

## Entering Information in the Purchase Order Header

1. If
   you are licensed to use multiple sites, click the Site ID arrow
   and select the site that is making the purchase. If you are licensed
   to use a single site, this field is unavailable.
2. If
   you are NOT using Auto Numbering, or if you want to override Auto
   Numbering, enter your company's Order ID for the purchase order
   in the Our Order ID field.

For example, you may want to use the number
from a pre-numbered purchase order form.

If you are using Auto Numbering, leave this
field blank.

VISUAL assigns the number the first time
you save the purchase order.

3. If
   necessary, change the Order Date.

Order Date defaults to the current date.

4. Enter
   the Vendor ID of
   the Vendor from whom you are ordering the part, or click the
   Vendor ID button
   and select a vendor from the Vendors table.

After you enter the Vendor ID, VISUAL fills
in much of the vendor information for you. This information comes
from the Vendor's record.

If you select a Vendor ID that uses a different
currency from the previous purchase order you entered, the system
displays a message warning you that the currency has been changed.

5. Enter
   the Desired Receive Date for
   this purchase order.

The Concurrent Scheduler, Material Planning
Window, and all material availability checks use this field to predict
material availability.

6. Enter
   the original promise
   delivery date of this purchase order. This is the date that the
   vendor promises to deliver the product or service.
7. Enter
   the promise ship date for the order. This is the date that the
   vendor promises to ship the order.
8. If
   you want VISUAL to use a specific warehouse when fulfilling the
   need for this purchase order, click Warehouse ID and
   select the warehouse you want to use.
9. The
   customer's default Currency ID appears in the Currency
   ID field.
10. Enter
    the purchase order status
    in the Status field.
11. Enter
    the vendor's contact information appears on the Pur from/Ship
    to tab.
12. Select
    the Purc From/Ship To tab
    and enter the applicable information.

Price breaks by header
site Use this check box if you are creating a consolidated
purchase order. To use the price breaks offered by the vendor to the
site in the Site ID field, select the Price Breaks
by Header Site check box. When you select this check box, the
total quantity of the part ordered, regardless of site, is used to
determine the pricing. To use the price breaks offered to each site
on the individual lines, clear this check box.

See [Consolidated
Purchasing](Consolidated_Purchasing.htm).

FOB
- If necessary, override Free On Board information by selecting
the appropriate FOB information from the drop down box.

Ship
Via - If necessary, override Ship Via by selecting the appropriate
Shipper from the drop down box.

Buyer
- If necessary, override Buyer information by selecting the
appropriate Buyer information from the drop down box. You must select
an eligible buyer. You cannot specify a buyer who is excluded from
using the vendor in this field. See [Excluded
Buyers and Vendor Documents](Excluded_Buyers_and_Vendor_Documents.htm).

ShipTo
ID The ShipTo ID of the address to which the vendor will
ship this order appears. Because you must set this at the Vendor level,
you cannot override the ShipTo ID for this purchase order.

Sales Order ID
Enter the sales order ID your vendor uses for this order.

Internal Order
If this is an internal order, select this check box. Use internal
orders to purchase materials from other sites in your enterprise.
If you are licensed to use multiple sites, you must place internal
orders to acquire materials from sites that have a different parent
entity than the site selected in the Site ID field. See [Buying and Selling Between
Accounting Entities](Buying_and_Selling_between_Accounting_Entities.htm).

Internal Customer ID
If you selected the Internal Order check box, specify the ID of
the internal customer.

Use Cust VAT/Tax
This check box is used in transactions between accounting entities.
See [Buying
and Selling Between Accounting Entities](Buying_and_Selling_between_Accounting_Entities.htm).

SO Tax Shipto ID
  This field is used in transactions between accounting entities.
See [Buying
and Selling Between Accounting Entities](Buying_and_Selling_between_Accounting_Entities.htm).

13. If
    necessary, change the Ship To address.

Click the Ship Addr button to
set the Ship To address.

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

14. Click the Contact
    tab to specify contact information. The vendor's primary contact
    information is displayed. You can select a contact with a Contact
    ID or enter a standalone contact for this transaction only.
15. To select
    a contact with a registered Contact ID use one of these methods:

Select an alternate contact
- Click the Contactbrowse button and select
a contact from the browse table showing contacts assigned to the vendor.
Select the Use Selected Contact toolbar button.

Select
a contact from all contacts - Click the Contact
browse button and then click the Associate
existing contact toolbar button. Select a contact from the
Contacts dialog and click Ok. In the Contacts
for Vendor dialog select the contact and then click the Use
Selected Contact toolbar button.

Specify a new contact in
the Contacts for Vendor dialog - Click the browse button. Click
the Add New Contact button and specify contact
information in the General tab and Address tab fields. Click the Save toolbar button. In the Contacts for Vendor
dialog select the contact and then click the Use
Selected Contact toolbar button.

You can also assign contacts to vendors in
the Contact Maintenance window.

* To specify
  a standalone contact, specify the contact information in the fields
  on the Contact tab. If contact information is already displayed
  in the tab, you can edit the existing information to create a
  standalone contact. When you edit the information, the Contact
  ID field is cleared. The edits that you make in the Contact tab
  do not update contact information in your Contact table. Standalone
  contact information is saved with the transaction only and is
  not added to your Contacts table. If you anticipate using this
  standalone contact again, Infor recommends creating a contact
  with a Contact ID.

Specify this information:

Contact ID/Name
Enter the contacts full name and review the ID number. A contact
without an ID number does not display in Contact Maintenance.

Position Enter
the contacts position. For example, CEO.

Salutation Enter
the salutation to use for this vendor contact. This field has a drop-down
menu populated with some of the most popular salutations.

Phone/Ext Enter
the telephone number, with area code and extension, for the contact.
This may be a direct line to the contact, or a generic company line.

Fax Enter the area
code and Fax number.

Mobile Enter the
contacts area code and mobile phone number.

E-Mail Enter the
appropriate vendor E-mail address.

Note:
Standalone contacts are not added to the Email Documents list for
the vendor. Only contacts with IDs can be added to the Email Documents
list.

If you do not want to assign a contact to
this order, click the Use No contact toolbar
button.

15. Select the Dispatch
    tab to enter the applicable information for outside services.

Ship
From/Dispatch to - The Ship to address appears.

FOB
- Select the appropriate free on board from the drop down box.

Ship
Via - Select the method of transportation from the drop down
box.

Carrier
- Select the trucker for this order.

Ship
from Addr - Click this button to select the address of the
vendor providing the service.

Ship To Addr -
Click this button to select the location from which you are sending
the material to an outside service.

Dispatch
Address - Click the address button and select the place from
which you want to dispatch this customer's order.

Confirmed
Ship Date - The date that the vendor sent the items in your
order to you. You enter this date manually; it is not read from an
electronic document, such as an advanced ship notice. You can use
this field to record the confirmed ship date for any purchased parts,
not just parts that you have dispatched to vendors for service. This
field is informational only. While you can view the information in
the Material Planning Window, the information is not considered when
evaluating the availability of supply. You can also specify this information
on the purchase order line.

16. Select
    the EDI tab
    and enter the blanket information.

EDI Blanket
Order - An order you place for a given period of time that
stands until the quantities shipped match the total quantity ordered
in the blanket order. After the quantities shipped match the total
quantity ordered, you need to place a new blanket order to continue
to receive parts. For example, rather than placing 100 individual
purchase orders of 1000 pieces, you can blanket order 100,000 pieces
at once.

EDI Blanket Number
- The authorization number for the total quantity of parts on the
blanket order.

Contract ID -
The Contract ID for the delivery schedule.

Ship To ID - The
Ship To ID for the delivery schedule.

17. Click
    the Other tab:

Vendor
Bank ID - The vendor's bank ID appears.

Sales
Order ID Enter the sales order ID your vendor uses for this
order.

Special
Price Authorization Use this field to indicate if the pricing
the vendor offers is part of a promotion or other program. Click the
arrow and select a code from the list.

Printed -
If you have previously printed this invoice, select the Printed check
box.

DCMS
Dispatched - If you are running Distribution Center Management
, the DCMS check box appears solid.

Entered
By - If the order was created in the Purchase Order Entry window,
then the ID of the user who created the header information for the
order is displayed. A User ID is displayed if the order was created
manually, by copying an existing order, by creating an order from
a RFQ, or by creating an order
from a requisition. If the order was created automatically
through another VISUAL application, such as the Material Planning
Window, then no User ID is displayed. Note:
***This field was introduced in VISUAL
8.0.0. A User ID is displayed in this field only if the order was
created in VISUAL 8.0.0 or later.***

18. Click
    the 3PL tab:

Owner ID - Click the Owner ID button to override
the Owner ID.

19. Click the Notifications
    tab to specify when to send notifications about this order. Notification
    emails are addressed to the contact specified on the Contact tab.
    Internal employees receive copies of the email. Specify this information:

Notify Me If
the user ID that you singed into VISUAL with is associated with an
employee ID that has an email address, then the Notify Me check box
is available. Select the check box to receive internal notifications.
The email address specified for your employee ID in Employee Maintenance
is displayed.

Send Notification to
Order Contact - In the Send Notification to Order Contact section,
select the notifications to send to the vendor:

Email on New Order
Select this check box to email the vendor when a purchase order
is saved for the first time.

Note:
In terms of notification status, a purchase order is considered new
until the first email notification for the specified customer order
is sent.

Email on Changed Order
Select this check box to email the vendor when changes to a purchase
order are saved.

Email on PO Receipt 
Select this check box to email the vendor when a purchase has been
received. If multiple shipments are received to fulfill an order,
then emails are sent for each receipt.

Notifications Sent
- This check box contains a checked value if an email notification
is sent for the current customer order at least once. This is a read-only
check box.

Send Notifications
- In the Send Internal Notifications section, use the check boxes
to specify when employees receive notifications. In addition to the
Email on New Order, Email on Changed Order, and Email on Shipment
check boxes, you can select the Email on Invoice Payment to send a
notification to an employee when payment for the shipment is received.

To edit the list of internal recipients
that receive notifications for this order, select Edit,
Order Notifications.

## Entering Information in the Purchase Order Line Item Table

To add line items to the purchase order:

1. Click
   the Insert Row toolbar
   button.

VISUAL adds a new row to the table area
and assigns it a line number.

2. In
   the Site ID field, select the site that is purchasing the part.
   The site you specified on the header is inserted by default. If
   you are creating a consolidated purchase order, click the down
   arrow and select the site to use. You can select any site that
   belongs to the same parent entity as the site you specified on
   the header.

See [Consolidated
Purchasing](Consolidated_Purchasing.htm).

3. Enter
   the number of parts you are ordering in the Quantity column.
4. If
   you are working with dimensional inventory, enter the following
   dimensional information instead of a quantity:

* # Pieces
* Length
* Width
* Height
* Dim UM

5. Select
   or enter one of the following:

Inventory Part
If you are purchasing an inventory part, double-click the browse
button in the Part ID column and select the part you want to add.

You have the following browse options:

Part
ID Identifies a part with this unique identifier.

Part
Description Describes the part as defined on the customer
order line.

Parts
supplied by current vendor Select
this option button to display all parts the selected vendor carries.
This selection is not available until you enter a vendor.

The same Part
ID can be listed multiple times in the browse table. A Part ID is
listed more than once if multiple Vendor Part IDs are associated with
the same part or if you have approved multiple vendor RFQs for the
same Part ID.

Vendors
Supplying Current Part Select this option button to view
a list of vendors that carry the part. You cannot use this selection
until you specify a Part ID.

The Vendors Supplying
Current Part option does not select a new Part ID, but instead selects
a vendor from among those that supply the part. When you use this
option, the Vendor ID and all PO vendor information can change. If
this happens, VISUAL requests confirmation. The Vendor Part ID, U/M,
and Unit Price on the line item all set or reset to the new vendors
values.

If you enter
a Part ID for a part that has a preferred vendor, and you have not
previously entered a Vendor ID for the purchase order, the Vendor
ID and information for the preferred vendor is automatically used.

The same vendor
can be listed multiple times in the browse table. A vendor is listed
more than once if multiple Vendor Part IDs are associated with the
part or if you have approved multiple vendor RFQs for the part.

Non-inventory Part
If you are purchasing a non-inventory part, enter the part number
in the Vendor Part ID column.

For non-inventory parts, you must also enter
Unit of Measure, and Unit Price.

An easier alternative is to use Purchase
This Material/Service in the Manufacturing Window.

Service If you
are purchasing a service, double-click the Service ID browse button
and select the service you want.

6. If
   this purchase order is for a service, enter the quantity of parts
   you are sending to the vendor in the Dispatch quantity column.
7. If
   you are purchasing a part that is know by another name or Part
   IDdifferent than your VISUAL Part IDenter that name or ID in
   the Mfg Name or Mfg Part ID columns.
8. If
   you have a purchase contract with the vendor supplying the part
   or service and would like to apply the contracts prices, click
   the Contract ID button and select the contract and contract line
   that applies to your purchase. The system inserts the appropriate
   unit price for the part or service based on the quantity you ordered.
9. If
   the vendor supplying the part on this line sells it using a different
   unit of measure than what you use, double-click the U/M browse
   button and select the unit of measure you want.
10. Enter
    the following dates:

Recv Date Enter
the date on which you want to receive the part or service on this
line.

Promise Delivery Date
Enter the date the vendor quotes you will receive the part or service
on this line.

Promise Ship Date
Enter the date the vendor promises to ship the part or service on
this line.

Confirmed Ship Date
Specify the date that the vendor sent the part to you. You enter
this date manually; it is not read from an electronic document, such
as an advanced ship notice. This field is informational only. While
you can view the information in the Material Planning Window, the
information is not considered when evaluating the availability of
supply.

11. Enter
    the following monetary figures for this line:

Unit Price Enter
the amount per piece in the Unit Price column. If you applied a contract
ID to the line, the system inserts the unit price. If the system inserts
the unit price, you cannot change it.

Disc % Enter
the percentage discount your vendor is allowing you for this line
in the Disc % column.

Extension VISUAL
calculates the extension from the unit price and discount columns.

Freight Enter
the amount the vendor charges you for freight in the Freight column.

Fixed/Base Charge
If this vendor charges you a fixed amount for an order , enter that
amount in the Fixed/Base Charge column.

Minimum Charge
If this vendor charged a fixed minimum charge for the order, enter
it in the Minimum Charge column. VISUAL uses this figure if to calculate
the line total if it is larger than the Extension amount.

12. If
    this is an international order, you can override or enter the
    following:

HTS Code Double-click
the HTS Code browse button and select the appropriate Harmonized Tariff
Schedule Code for the goods on this line.

Country of Origin
Double-click the Country of Origin browse button and select the
country in which the goods were manufactured.

VISUAL populates the Duty % from the Harmonized
Tariff Schedule Code you selected and calculates the duty amount.

13. If
    you want to make a purchase directly against a general ledger
    account, double-click the G/L Expense
    Account ID browse
    button and select the account you want to use.

Because default accounts do not appear in
this column, use this column for overriding only.

You do not need to select an account unless
the part is a consumable part.

Because consumable parts are expensed, you
must enter a G/L expense account ID before attempting to save the
purchase order. If you attempt to save the purchase order without
entering a G/L Acct ID for a consumable part, VISUAL will not save
the order and notifies you that you must select a G/L Acct. ID.

14. If
    this line is for a material or service you are purchasing for
    and linking to a work order, enter the following information:

Base ID Double-click
the Base ID browse button and select the work order to which you want
to link this purchase order line. VISUAL populates the Lot ID and
Split IDs from the work order you select.

Seq # If you
are ordering a service, double-click the Seq # browse button and select
the operation for which you are ordering the service.

Piece # If you
are ordering a part, double-click the Piece # browse button and select
the operation for which you are ordering the part.

You can link a single purchase order line
to multiple work orders. For example, a single purchase of material
can be designated for multiple jobs. Only the first linked order appears
on the line item.

|  |  |
| --- | --- |
| POSTIT.gif | Any alternate parts you specified on the work order are not displayed in the dialog box. |

Link Part ID
If there is only one inventory link, the Part ID of the link appears.
If there are multiple inventory links, nothing appears.

Allocate Qty
Enter the amount of this line you want to allocate to the demand (work
order) you selected.

15. Double-click
    the appropriate browse buttons and select the following:

Ship From ID
The address from which you will ship parts to your vendor for servicing.

Disp Addr ID
The address from which this vendor will ship the parts back to you
after servicing.

Ship to ID The
address you want the vendor to ship parts back to you after servicing.

Owner ID If
you are working with consigned parts, select the actual owner of the
parts.

16. If
    you are working with an international order, you can view or edit
    VAT information in the following columns:

VAT Code VISUAL
populates the VAT Code from the part you selected.

VAT % VAT %
is the tax percent based on the selected VAT code. You CANNOT edit
this field.

VAT Amount VISUAL
calculates the VAT Amount based on the line amount and the VAT %.

VAT Rcv % The
VAT Rev % is the recoverable tax percent based on the selected VAT
code. You CANNOT edit this field.

VAT Rcv Amount
VISUAL calculates the VAT Rcv Amount based on the line amount and
the VAT Rcv %.

17. Click
    Save to save your purchase
    order and line items. The User ID of the User who entered each
    line is displayed in the Entered By column of the table. See **[Configuring Line Item Tables](Configuring_Line_Item_Tables.htm)**
    for more information on how to customize columns within a table.

If you have not specified a status of Firmed,
Released, Closed, or Cancelled/Void in the Status field, VISUAL creates
the PO with a default status of Firmed or Released.

If you are purchasing outside services,
the quantity you entered in the Dispatch Quantity column appears in
the Total Quantity Dispatched column. You can now view this dispatch
in the Service Dispatch Entry window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Changing_Purchase_From_Addresses.htm) Changing Purchase From Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Purchase_From_Addresses.htm) Editing Purchase From Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Changing_Ship_To_Addresses.htm)
Changing Ship To Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Ship_To_Addresses.htm)
Editing Ship To Addresses

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help