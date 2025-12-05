Shipping Interbranch Transfers



 
 
 
 
  
 
 
 
 
 
 
 
 
 
 


# Shipping Interbranch Transfers

After you have entered and saved an IBT using Interbranch
Transfer Entry, you can ship the transfer, either partially or entirely,
as you would a customer order.

1. If it is not already
   open, select Interbranch Transfer Shipping Entry from the Tools
   menu. The Interbranch Transfer Shipping Entry window appears.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site is managing this transaction. If you
   are licensed to use a single site, this field is unavailable.
3. Click the IBT
   ID button to select the IBT you want to ship from a list
   of all the IBTs currently in your database.
4. Enter a Shipper ID for
   this interbranch shipment in the Shipper ID field. For new interbranch
   transfer shipments, you should not attempt to select an existing
   Shipper ID by clicking the Shipper ID button. If you do, the IBT
   with that Shipper ID appears in the window. If you do not want
   to enter a unique Shipper ID, let VISUAL, using your auto-numbering
   preferences, assign this IBT shipment a new Shipper ID. See later
   in this section for more information on setting auto-numbering
   preferences for Shipper lines.
5. Change the Actual Ship
   Date if necessary. If this date, which you entered in Interbranch
   Transfer Entry, is not correct, make the adjustment now.

VISUAL fills the Desired Ship Date field
with the Desired Ship date you entered in Interbranch Transfer Entry.
You cannot edit this date. This date is for planning purposes only;
it is an "ideal" against which you can develop optimal scheduling
scenarios.

6. Click
   the Contact tab
   and specify the contact for this IBT Entry. You can specify a
   different contact for the To Whse ID receiving the shipment. You
   can select a contact with an ID or enter a standalone contact
   for this transaction only.
7. To
   select a contact with a registered Contact ID, click the
   Contact
   browse button
   and select a contact from the browse table. Click the Use
   Selected Contact toolbar
   button.
8. To
   specify a standalone contact, specify the contact information
   in the fields on the Contact tab. If contact information is already
   displayed in the tab, you can edit the existing information to
   create a standalone contact. When you edit the information, the
   Contact ID field is cleared. The edits that you make in the Contact
   tab do not update contact information in your Contact table. Standalone
   contact information is saved with the transaction only and is
   not added to your Contacts table. If you anticipate using this
   standalone contact again, Infor recommends creating a contact
   with a Contact ID.

Specify
this information:

Contact ID/Name - Enter the contact's full
name and review the ID number. A contact without an ID number does
not display in Contact Maintenance.

Position -
Enter the contact's position. For example, CEO.

Salutation - Enter the salutation to
use for this vendor contact. This field has a drop-down menu populated
with some of the most popular salutations.

Phone/Ext-
Enter the telephone number, with area code and extension, for the
contact. This may be a direct line to the contact, or a generic company
line.

Fax -
Enter the area code and Fax number.

Mobile -
Enter the contact's area code and mobile phone number.

E-Mail-
Enter the appropriate vendor E-mail address.

Note:
Standalone contacts are not added to the Email Documents list for
the vendor. Only contacts with IDs can be added to the Email Documents
list.

If
you do not want to assign a contact to this transaction, click the
Use No contact toolbar
button in the Contacts dialog.

7. Click the Other tab
   and select a shipping method from the Ship Via list box. This
   is an optional entry.

|  |  |
| --- | --- |
| POSTIT.gif | When using Inter Branch Transfer Shipping Entry to ship transfers to consignment warehouses, VISUAL selects the Consignment Transfer check box, identifying the type of transfer, and populates the name of the customer or vendor you assigned to the consignment warehouse. |

8. Specify the quantity
   to ship. If you are shipping a standard part, specify the quantity
   to ship In the Ship Quantity column. The default Ship Quantity
   is the Quantity Ordered.
9. If you are shipping
   a piece tracked part, specify the number of pieces to ship in
   the # pieces to ship field. After you specify the number of pieces,
   the quantity of the shipment is calculated and inserted in the
   Ship Quantity field.

You can ship more than the quantity ordered
for both standard and piece tracked parts. If you enter a value that
will result in an overshipment, a dialog box is displayed when you
move the cursor to another field.

You can also ship less than the quantity
ordered. If you choose not to ship the entire Quantity Ordered, you
are presented with two options upon savingto leave the order open
or close the order.

10. In the Location ID column,
    enter the Location ID in the From Warehouse, from which you want
    to ship the parts.
11. Enter information in
    the following optional fields.

Actual Freight
- The amount you are paying to ship this transfer

Cartons - The
number of cartons in the shipment.

Shipping Weight -
The shipping weight per part.

Weight U/M - The
weight unit of measure for the part.

Package Type -
The package type for the parts.

HTS Code - Double-click
to select a Harmonized Tariff Schedule code from the table for this
line.

Country of Origin
- Double-click to select a Country of Origin for the IBT line.

See Application Global Maintenance for more
information on HTS Codes and Countries of Origin.

12. If you are shipping
    a partial quantity, specify how to process the remaining quantity
    in the transfer. After you click Save,
    select one of these options:

* Leave order
  open (partial receipt, backorder balance) - This leaves the IBT
  open awaiting the remainder of the shipment. The IBT does not
  close.
* Close order
  (partial receipt, no backorder) - This is useful when the original
  IBT quantity has been changed, or is not received for some reason.
  For example, consider a case where the From warehouse ships you
  a partial shipment on an IBT order. The back ordered quantity
  may not be available in a time to suit your needs, and you may
  request that quantity from another warehouse. This option allows
  you to arrange with the To Warehouse to cancel the remainder of
  the shipment, and close the order short.

VISUAL ships the IBT lines.

13. If you are shipping
    the entire Order Quantity, click Ship All.

VISUAL ships the IBT lines.

If you are shipping a quantity that is greater
than the Ordered Quantity, a dialog box appears asking you to confirm
this over shipment.

14. Click Ok
    to continue.
15. Click Ship
    All.

VISUAL ships the IBT lines.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Shipping_Entry.htm) User-defined Help