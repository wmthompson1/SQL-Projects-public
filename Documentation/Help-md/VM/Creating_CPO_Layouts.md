Creating CPO Layouts




# Creating CPO Layouts

1. From the Key/Version
   list box, select CPO and enter a version
   for the layout in the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single File -
The single file type reads all records from one file. Available record
types for CPO are HDR, LIN,
and SUB. CPO documents are imported from
Single files only.

Multiple File
- No Multiple file option is available.

3. Select the appropriate
   file style from the File Style section.

The file style refers to the format of the
data contained in the .VDI file. You can select:

Fixed This style
indicates that the data in the .VDI files will always occupy the same
"fixed" space for each field and record.

Delimited If
you select Delimited as the style, you need to define the character
that will indicate the end of a field (Asterisk, Comma, or Tab) and
the character that will indicate the end of a record (NewLine or Null).
For example, if a field in the .VDI file represents the Part ID, that
field would be 30 characters long in a Fixed file. However, in a Delimited
file, the actual Part ID would be used (no leading or trailing spaces)
and it would require a delimiter to indicate the end of the field
(an Asterisk, Comma, or Tab).

For Fields, select from Asterisk, Comma,
or Tab. Null is a special delimiter that is used to import or export
all records on their own lines. In order to use the Null field delimiter,
you MUST select the Fixed radio button and New Line record delimiter.
For Records, select from New Line and Null.

|  |  |
| --- | --- |
| POSTIT.gif | Note: If you are creating a Null (fixed length) layout (i.e. with each record contained on its own line), choose the following settings:  File Style: Fixed  Record: Newline  Field: Null (Fixed Length) |

4. From the Options men,
   select Special Settings or click the
   Special Settings button on the main
   toolbar

The Special Settings dialog box appears.
The CPO tab has the default position. You cannot select the other
two tabs.

Select the appropriate options:

Auto Generate CO ID
Select this check box if you want VISUAL to generate the Customer
Order ID for you. After you select the checkbox, you must enter a
Prefix Token for use in your VDI file.

During the exchange of EDI data, VISUAL
replaces the token with the actual generated Customer Order ID.

With Autogenerate CO ID selected, VISUAL
generates unique Customer Order IDs for incoming EDI customer orders.
You cannot, however, use this feature in situations where changes
to the order may be received, because VISUAL has no way of matching
the original order with the incoming changes to the order. Use this
feature for unique, discrete customer orders that you are fairly sure
will never change.

Enter a prefix token in the Prefix Token
field.

During the exchange of EDI data, VISUAL
looks for this token in the column each header, line, and sub-line
in your VDI import file.

5. If you mark this checkbox
   on the Line Item tab, VISUAL determines the line items to update
   based on the Matching criteria you selected for your layout in
   VMDI Generate, and then deletes those lines (and their associated
   delivery schedules) from the orders. The line items are then re-imported
   from the .VDI file. The Delete Unshipped Lines checkbox of the
   Inbound Rule is only used for CPO imports. This feature is useful
   for those trading partners that insist that any line items (that
   are contained in the import file) that were not shipped on a customer
   order should be deleted from that existing order prior to the
   import.

If you mark this checkbox on the Sub Line
Item tab, VISUAL determines the line items to update based on the
Matching criteria you selected for your layout in VMDI Generate, and
then deletes all of the unshipped delivery schedules from those lines.
The delivery schedules are then re-imported from the .VDI file. The
Delete Unshipped Schedules checkbox of the Inbound Rule is only used
for CPO imports. This feature is useful for those trading partners
that insist that any delivery schedules (that are contained in the
import file) that were not shipped on a customer order should be deleted
from that existing order prior to the import.

Click the Ok button
to commit these settings.

6. Specify Header settings:

Insert In VMDI
Generate, if you have selected the Insert checkbox in the Header of
the Inbound Rule of your CPO or PLN layout, then VMDI Exchange will
allow new orders or forecasts to be inserted into VISUAL. The Insert
checkbox of the Inbound Rule is only used for CPO and PLN imports.

Update - In VMDI
Generate, if you have selected the Update checkbox in the Header of
the Inbound Rule of your CPO or PLN layout, then VMDI Exchange will
allow existing orders or forecasts to be updated. For CPO transactions,
VISUAL determines the line items to update based on the Matching criteria
you selected for your layout in VMDI Generate. For PLN transactions,
VISUAL matches on the combination of the Customer ID, Part ID, and
Forecast ID. The Update checkbox of the Inbound Rule is only used
for CPO and PLN imports.

Replace - In VMDI
Generate, if you have selected the Replace checkbox in the Header
of the Inbound Rule of your PLN layout, then VMDI Exchange will match
on the combination of the Customer ID, Part ID, and Forecast ID. The
program will then eliminate those forecasts from your database, and
will re-import them from the .VDI file. The Replace checkbox of the
Inbound Rule is only used for PLN imports. VISUAL does not consider
dates when matching on existing forecasts.

Line Item Duplicate

Insert In VMDI
Generate, if you have selected the Insert checkbox in the Line Item
Duplicate of the Inbound Rule of your CPO layout, then VMDI Exchange
will allow new line items to be inserted into your VISUAL orders.
If you do not mark this checkbox, then new line items will not be
inserted into your VISUAL orders.

Update - In VMDI
Generate, if you have selected the Update checkbox in the Line Item
Duplicate of the Inbound Rule of your CPO layout, then VMDI Exchange
will allow existing line items to be updated on your VISUAL orders.
VISUAL determines the line items to update based on the Matching criteria
you selected for your layout in VMDI Generate. If you do not mark
this checkbox, then existing line items will not be updated on your
VISUAL orders.

Delivery Schedule Duplicate

Insert In VMDI
Generate, if you have selected the Insert checkbox in the Delivery
Schedule Duplicate of the Inbound Rule of your CPO layout, then VMDI
Exchange will allow new delivery schedules to be inserted into the
line items of your VISUAL orders. If the date and Shipto ID of the
delivery schedule you are importing do not exist on the line item
of your VISUAL order, then that delivery schedule is considered to
be new. If you do not mark this checkbox, then new delivery schedules
will not be inserted into your VISUAL orders.

Update - In VMDI
Generate, if you have selected the Update checkbox in the Delivery
Schedule Duplicate of the Inbound Rule of your CPO layout, then VMDI
Exchange will allow existing delivery schedules to be updated in the
line items of your VISUAL orders. If the date and Shipto ID of the
delivery schedule you are importing exists on the line item of your
VISUAL order, then that delivery schedule would be updated. If you
do not mark this checkbox, then existing delivery schedules will not
be updated in the line items of your VISUAL orders.

Quantity and Cumulative Base

If Quantity = Discrete,
then Cumulative Base is N/A.

If Quantity = Cumulative,
then Cumulative Base is Shipped Qty.

If you are importing Discrete quantities,
then the delivery schedule quantities are imported exactly as they
appear in your .VDI file; VISUAL does not have to do any comparisons,
but instead just imports the amounts as-is.

If you are importing Cumulative quantities,
your initial delivery schedule for a line item subtracts the values
of either the Our Total Shipments or Their EDI Accum Qty fields. See
Help documentation for additional details on Cumulative importing.

Line Item Match Fields
If you have chosen Update as your Line Item Duplicate inbound rule,
you have the ability to choose how VISUAL determines line item matches
for your CPO layout. If you do not choose any line item match fields,
then VISUAL will update line items based on a match of the Part ID.
If you have multiple line items on an order for the same Part ID,
then only the first occurrence of that part will ever be updated.
You need to choose additional fields to match on in order to avoid
that problem. Some customers decide to use the line item number as
their match field. However, since many EDI trading partners dont
use the line item number in the incoming data, other fields need to
be used in order to determine the correct line item for update. Even
when some EDI trading partners send the line item number, they dont
always reference it on updates to those orders.

To alleviate the problem with matching on
the line item number, choose other fields that will always be sent
in the line item. You want to choose a combination of fields that
will determine a unique line item in the order. If the combination
you have chosen does not determine unique line items, you will need
continue adding fields to your match criteria until you find the right
combination. For instance, Part ID and EDI Release Number may determine
a unique line item for your order. If it does not, try adding the
Shipto ID field. Keep in mind, these are just examples. You may use
any number and combination of line item fields you want.

To choose match fields:

1. * The Available Match
     Fields box will show all fields you have selected in your
     Line Item tab of your layout.
   * Highlight the field
     you want to add from the Available Match Fields box
   * Click the Right Arrow
     to move the field into the Selected Match Fields box
   * Repeat for as many fields
     as you need.
   * To un-select a field,
     highlight it in the Selected match Fields box and click the
     Left Arrow.
   * If you use the line
     item number field as part of your match criteria, all other
     match fields are ignored and the line item number by itself
     determines the match.

Also, we recommend that you not use the
Desired Ship Date as part of your match criteria if you have delivery
schedules on your line items. VISUAL looks at the Desired Ship Dates
in all of the delivery schedules for the line item and finds the earliest
date. VISUAL then updates the Desired Ship Date field on the line
item with that date. The line item desired ship date would fluctuate
with your delivery schedules and it would be very difficult to accurately
and consistently update your line items. If you are using delivery
schedules, it is a good idea to avoid using Desired Ship Date as part
of your match criteria.

If you are not using delivery schedules,
the Desired Ship Date is fine to use as part of your match criteria.

6. Click the Ok
   button to commit these settings.
7. Begin to define a record
   layout. See the section Defining Record Layouts for more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help