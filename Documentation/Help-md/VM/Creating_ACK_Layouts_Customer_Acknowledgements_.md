Creating ACK Layouts (Customer Acknowledgements)




# Creating ACK Layouts (Customer Acknowledgements)

1. From the Key/Version
   list box, select ACK and then enter
   a version for the layout in the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single file -
The single file type writes all records to one file.

Multiple file
- The multiple file type writes each record type to a separate file.
Available record types for ACK are HDR, LIN, and SUB.

3. Select the appropriate
   file style from the File Style section.

The file style refers
to the format of the data contained in the .VDI file. You can select:

Fixed - This style
indicates that the data in the .VDI files will always occupy the same
"fixed" space for each field and record.

Delimited - If
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
| POSTIT.gif | If you are creating a Null (fixed length) layout (i.e. with each record contained on its own line), choose the following settings:  File Style: Fixed  Record: Newline  Field: Null (Fixed Length) |

4. From the Options menu,
   select Special Settings or click the
   Special Settings button on the main
   toolbar.

The Special Settings dialog box appears.
The ACK tab has the default position. You cannot select the other
two tabs.

Select the appropriate option:

Original Orders Only
(855) - Select this option button if you want to acknowledge
original customer orders only. Original orders are orders with the
EDI Release checkbox selected and the Order Changed checkbox cleared.
These check boxes appear in the EDI tab of the Customer Order Entry
window.

Change Orders Only (865)
- Select this option button if you want to acknowledge changed customer
orders only. Changed orders are orders with both the EDI Release checkbox
selected and Order Changed checkbox selected. These check boxes appear
in the EDI tab of the Customer Order Entry window.

When you update an existing order using
VMDI Exchange, VISUAL selects the Order Changed checkbox. When you
manually make changes to new orders in Customer Order Entry, you have
to manually mark the Order Changed checkbox. You can clear the checkbox
if you mistakenly change an order prior to exporting your 855 ACK
documents. When you export acknowledgments for changed orders, the
checkbox for those orders is automatically cleared.

If multiple 865 layouts exist for the same
customer, the 865 ACK is only exported one time per change. That is,
if you have orders with Order Changed checkbox marked and you export
865 ACK, you cannot export the same orders with another layout --
unless you first re-select the checkbox.

Both Original and Change
(ORDRSP) - Select this option button if you want to acknowledge
both original and changed customer orders.

When you update an existing order using
VMDI Exchange, VISUAL selects the Order Changed checkbox. When you
manually make changes to new orders in Customer Order Entry, you have
to manually mark the Order Changed checkbox. You can clear the checkbox
if you mistakenly change an order prior to exporting your 855 ACK
documents. When you export acknowledgments for changed orders, the
checkbox for those orders is automatically cleared.

If multiple 865 layouts exist for the same
customer, the 865 ACK is only exported one time per change. That is,
if you have orders with Order changed checkbox marked and you export
865 ACK, you cannot export the same orders with another layout --
unless you first re-select the checkbox.

VMDI includes Customer Order Acknowledgement
Codes on every line item (LIN record) of your ACK (this applies to
855 as well as 865 documents). You can enter and maintain common Customer
Order Ack Codes using Application Global Maintenance. If the codes
your trading partner requires you to use are not in the default list,
you may add them.

When your EDI order is saved or received
via VMDIXCHG, all customer order line items have your default code
on them. For example, some clients use the IA code (Item Accepted),
some use AC (Item Accepted and Shipped), and others might use a common
code. You can add as many codes as you need. Do this in Customer Maintenance.
See Customer Order Entry for more information. You can change the
code assigned to your line items at any time. Be certain that they
are correct on your order line items Before you export your ACK documents,
otherwise you may need to update the codes on your orders and re-export
the ACKs.

5. Before exporting your
   ACK documents, you may find one of your line items requires a
   code other than the default. For example, you may have IA as your
   default, but need to send IH (Item on Hold) for this one line
   item.

In that case,

1. * Open
     Customer Order Entry and find the order.
   * Highlight
     the line item and scroll over to the far right of the line
     item table.
   * Select
     the Ack Code field and choose the code you want to use.
   * Save the order.
   * Click
     the Ok button to commit these settings.

6. Begin to define a record
   layout.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help