Entering Interbranch Transfer Information



 
 
 
 
  
 
 
 
 
 


# Generating Interbranch Transfers

To create Inter Branch transfers:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the site that is
   managing this transaction. Any sites that share the same parent
   accounting entity as the site you specify can be used in the transaction.
   The site you specify is not necessarily involved in the transactions.
   The sites associated with the warehouse IDs you specify are used
   in the inventory transactions. If you are licensed to use a single
   site, this field is unavailable.
2. Enter an IBT ID for
   the transfer, or click the IBT
   ID button to select from a list of Interbranch Transfers.
   The Interbranch Transfers dialog box appears.
3. Select an Order Date for
   the transfer by either clicking on the calendar icon to select
   a date or manually entering a date in the field.

4. Click the From Whse ID
   button to select the warehouse from which you want to transfer
   parts. If you are licensed to use multiple sites, the browse table
   displays warehouses belonging to sites in the same parent entity
   as the site in the Site ID field. If you are licensed to use one
   site, the browse table displays all warehouses. The Warehouses
   dialog box appears.

The warehouses dialog box contains the following
columns:

Warehouse ID -
The ID of the warehouse from which you are transferring the parts.

Description -
The description of the warehouse from which you are transferring parts.

Name - The name
of the warehouse from which you are transferring parts

Address - The
address of the warehouse from which you are transferring parts.

City - The city
of the warehouse from which you are transferring parts.

State - The state
of the warehouse from which you are transferring parts.

Country - The
unique identifier for the country of the warehouse from which the
parts are being transferred.

5. Click the To Whse ID button
   to select the warehouse to which you want to transfer parts. If
   you are licensed to use multiple sites, the browse table displays
   warehouses belonging to sites that share the same parent entity
   as the site you specified in the Site ID field. If you are licensed
   to use a single site, this browse table displays all warehouses.

|  |  |
| --- | --- |
| POSTIT.gif | When using Inter Branch Transfer Entry to move parts or material into a consignment warehouse, VISUAL populates the Consignment section of the Other tab identifying the type of transferconsignmentand entering the name of the customer or vendor you assigned to the consignment warehouse. |

6. In the Desired
   Ship Date field, enter the date on which you would like to ship
   the parts.
7. In the Desired
   Recv Date field, enter the date on which you would like the receiver
   to receive the parts.
8. In the Transit
   Days field, enter the number of days the parts are to be in transit.

   |  |  |
   | --- | --- |
   | POSTIT.gif | Enter Transit Times in Warehouse Maintenance. |

9. On the Ship From/To
   tab, enter information into the following fields.

From the Status
list box, select a status for the transfer.

VISUAL automatically assigns a status to
a transfer.

From the Carrier
list box, select a carrier for the transfer. Entry is optional. Enter
Carriers in Application Global Maintenance.

From the Ship
Via combo box, select a means of conveyance for the transfer. Entry
is optional.

Enter a buyer in the Buyer
field. VISUAL uses a default buyer name unless you enter a different
one. Entry is optional.

For each line item, enter a freight amount for the shipment of the transfer
in the Freight Value field. Entry is optional.

On the Other tab, the following information
appears:

Last Shipped - The date on which you last shipped
the part appears.

Last Received - The date on which you last received
the part appears.

Returned - The date on which you last returned
the part appears.

10. Click
    the Contact tab
    and specify the contact for the Inter Branch Transfer Entry. You
    can select a contact with an ID or enter a standalone contact
    for this transaction only.

* To select a contact with
  a registered Contact ID, use one of these methods:

Select
an alternate contact -
Click the Contact browse button and select a
contact from the browse contact table. Select the Use
Selected Contact toolbar
button.

Specify
a new contact in the Contacts for Customer dialog - Click the Contact
browse button. Click
the Add New Contact button and specify contact
information through the Contact Maintenance window.

* To specify a standalone
  contact, specify the contact information in the fields on the
  Contact tab. If contact information is already displayed in the
  tab, you can edit the existing information to create a standalone
  contact. When you edit the information, the Contact ID field is
  cleared. The edits that you make in the Contact tab do not update
  contact information in your Contact table. Standalone contact
  information is saved with the transaction only and is not added
  to your Contacts table. If you anticipate using this standalone
  contact again, Infor recommends creating a contact with a Contact
  ID.

Specify
this information:

Contact ID/Name 
Enter the contacts full name and review the ID number. A contact
without an ID number does not display in Contact Maintenance.

Position Enter
the contacts position. For example, CEO.

Salutation Enter the salutation to use
for this vendor contact. This field has a drop-down menu populated
with some of the most popular salutations.

Phone/Ext
Enter the telephone number, with area code and extension, for the
contact. This may be a direct line to the contact, or a generic company
line.

Fax Enter
the area code and Fax number.

Mobile Enter
the contacts area code and mobile phone number.

E-Mail  Enter the appropriate vendor
E-mail address.

Standalone
contacts are not added to the Email Documents list for the vendor.
Only contacts with IDs can be added to the Email Documents list.

If
you do not want to assign a contact to this order, click the
Use No contact toolbar
button.

11. Click Insert to start adding IBT line item information.
12. Enter information in
    the following fields:

Part
ID - The Part ID of the part you are transferring.

Quantity - If
you are transferring a standard part, specify the number of parts
you want to transfer. If you are transferring a piece tracked part,
leave this field blank.

# Pieces If
you are transferring a piece tracked part, specify the number of pieces
to transfer. If you are transferring a standard part, leave this field
blank.

Length, Width, Height
If you are transferring a piece tracked part, specify the required
dimensions of the pieces. The required dimensions are determined by
the part record. After you specify the number of pieces and the dimensions,
the quantity is calculated and inserted in the Quantity field.

If you are transferring a standard part,
leave the Length, Width, and Height fields blank.

Transit Location ID
- The location within the From warehouse from which you are shipping
the parts. See the earlier definition.

If this Transit Location ID is not a defined
Transit Location ID, VISUAL asks you if you want to add this as a
valid Transit Location ID.

U/M - The unit
of measurement of the part.

Unit Price - The
price per unit of the part.

Cartons - The
number of cartons in the shipment.

Shipping Weight
- The shipping weight per part.

Weight U/M - The
weight unit of measure for the part.

Package Type -
The package type for the parts.

From User Dimensions
If you set up user dimensions for inventory adjustments, the default
dimensions based on the priorities you established for inventory adjustments
are inserted. You can override the defaults The dimensions specified
are used for the adjust out transaction generated for this IBT.

From Customer Order ID
To associate the adjust out portion of the inventory transfer with
a particular customer order ID, click the browse button and select
the order ID. The customer order ID you select is used for reporting
purposes only.

To User Dimensions
If you set up user dimensions for inventory adjustments, the default
dimensions based on the priorities you established for inventory adjustments
are inserted. You can override the defaults. The dimensions specified
are used on the adjust in transaction generated for this IBT.

To Customer Order ID
To associate the adjust in portion of the inventory transfer with
a particular customer order ID, click the browse button and select
the order ID. The customer order ID you select is used for reporting
purposes only.

13. Click Save
    to save the IBT.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Entry.md) User-defined Help