Entering Quotes From Vendors




# Entering Vendor Responses

For each RFQ, you can specify responses for more than
one vendor. In the Vendor ID field, use the browse button to add vendors.
Before you enter quote information from a vendor, click the Vendor
ID drop-down button and select the vendor for whom you are entering
quote information.

To specify vendor responses to an RFQ:

1. Select Purchasing,
   Vendor RFQ Entry.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site where the RFQ was created. If you are licensed to use a single
   site, this field is unavailable.
3. Specify the vendors
   that are providing quotes. Click the Vendor ID browse button and
   select a vendor, or click the Name browse and select a vendor.
   To specify additional vendors, click the Vendor ID or Name browse
   again and select another vendor.
4. Click the Vendor
   ID drop-down button and select the vendor whose quote you
   are entering.
5. On the Address
   tab, review address information. By default, the vendors Purchase
   From address is inserted. You can edit the information.
6. To specify the vendor
   contact, click the Contact tab. By default,
   the vendors primary contact is inserted. You can specify a different
   contact:

* To select
  a contact with a registered Contact ID, use one of these methods:

Select an alternate contact
Click the Contact browse button and select a contact from the browse
table showing contacts assigned to the vendor. Select the Use Selected
Contact toolbar button.

Select a contact from all
contacts Click the Contact browse button and then click the
Associate existing contact toolbar button. Select a contact from the
Contacts dialog and click Ok. In the Contacts for Vendor dialog select
the contact and then click the Use Selected Contact toolbar button.

Specify a new contact in
the Contacts for Vendor dialog Click the Contact browse button.
Click the Add New Contact button and specify contact information in
the General tab and Address tab fields. Click the Save toolbar button.

If you do not want to assign a contact to this
RFQ, click the Use No contact toolbar button. Information in the Contact
tab is cleared.

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
  with a Contact ID. Specify this information:

Name Enter the
contacts full name and review the ID number. A contact without an
ID is not added to Contact Maintenance.

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
contact's E-mail address.

Note: Standalone
contacts are not added to the Email Documents list for the vendor.
Only contacts with IDs can be added to the Email Documents list.

7. In
   the table, select the part or service for which you are entering
   a vendor quote. You can select more than one line.
8. Select Edit,
   Vendor Quote.
9. The ID of the vendor
   and information about the part or service that is the subject
   of the quote is displayed. Specify this information:

Vendor Part ID
If the Vendor provided you with their own Part ID, you can enter
it in this field. This is for reference only, and may facilitate communication
with the vendor. This is not the Part ID as it exists in VISUAL.

Purchase U/M Enter or select
the Unit of Measure you use when you purchase this part or service.
This determines the measurement for the Quantity on the table. VISUAL
copies this information from the Vendor RFQ Entry window. You can
edit this value manually, or you can click the browse button to select
a different unit of measure from the list that appears.

Quote Date VISUAL automatically inserts the current
system date in the Quote Date field. You can override this date manually,
or you can click the Calendar button to select the date you received
the quote prices from your vendor.

Supplier Quote ID Enter
the ID your vendor uses to identify the quote.

Supplier Contract ID
If you specified a supplier contract ID on the header, the system
inserts the ID in the field. If you did not specify a supplier contract
ID on the header or would like to edit the supplier contract ID, enter
an ID here. If you change the supplier contract ID, the system updates
the supplier contract ID on the quote header and on any other quote
line.

When you approve the quote, the system generates
a contract ID you can use in purchase orders and purchase requisitions.

Supplier CLIN Specify the line
number in the vendor contract that describes the pricing for the item.

Effective Date
Specify the date that the vendor pricing becomes effective. If you
specified a contract ID, this is the date that the pricing for the
contract line becomes effective.

Expiration Date
Specify the data that the vendor pricing expires. If you specified
a contract ID, this is the date that the pricing for the contract
line expires.

Comments If you have any comments to add to the quote
line prices, enter them here. This is for information only and does
not print on any reports.

Status
You can manually change the RFQ Status using these options. If you
go through the RFQ Entry Approve Quote process, VISUAL automatically
changes this Status selection to Approved. Make your selection from
Printed, Quoted, Waiting, or Approved. By default, when you create
the RFQ line, VISUAL assigns a status of Quoted. If you approve the
RFQ line here, you must manually close the RFQ before you can use
it to generate a Purchase Order.

10. In the Quantity and
    Price table, specify the quantity breaks, prices, and leadtimes
    the vendor provided. The way you enter prices depend upon your
    Purchase Quote Type setting in Application Global Maintenance.
    If you have specified Qty Break tables, then the default price
    applies to quantities from 1 to the quantity you specify in the
    first quantity break. If you have specified Up To Quantity, then
    the default price applies to quantities greater than the largest
    up-to quantity you specify.

You must specify a default price. Optionally,
you can specify a default leadtime.

For other quantities, specify this information:

Quantity By
default, the quantities that you specified in the table on the main
Vendor RFQ Entry window are displayed. You can specify different quantities.

Price Specify
the price for each up-to or break quantity.

Leadtime Optionally,
specify how many days it takes for the vendor to deliver the quantity.
This field is informational only. You can use it to help you decide
which vendor quote to accept, but the value is not used in material
planning or scheduling.

11. Click the Save
    toolbar button.
12. If the RFQ is for more
    than one item, click the Next Vendor RFQ Line in Set button to
    navigate to the next part or service. Specify pricing information.
13. To specify pricing information
    for another vendor, repeat steps 4 through 12.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Vendor_RFQ_Entry.md) User-defined Help