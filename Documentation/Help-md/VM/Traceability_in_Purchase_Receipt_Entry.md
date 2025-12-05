Traceability in Purchase Receipt Entry




# Traceability in Purchase Receipt Entry

Use Traceability in Purchase Receipt Entry to record
the lot numbers of received materials. It is required when the Receiving
option is checked in the When to Apply section of the parts traceability
profile. Traceable parts are indicated by a check mark in the Trc
column of the line item table.

## For Material Receipt

1. Enter Receipt Line Information
   in Purchase Receipt Entry.

When receiving parts, first enter the Quantity
Received for each line, and modify the Warehouse ID and Location ID
if necessary.

2. Click the Save
   button or the Recv All button, if appropriate.

VISUAL prompts you to enter part traceability.

3. For each line containing
   a traceable part, select the line and click the Part
   Trace button.

The Traceability dialog box appears.

Total Quantity displays the Quantity Received
that you entered on the line. This is the quantity that must be accounted
for by one or more lots, serial numbers, or other trace IDs.

The Warehouse ID and Location ID from the
line item appear at the top of the dialog box. You can change it here
if necessary. When you save, you have the option of overriding the
original warehouse location you specified. You cannot specify multiple
warehouse locations in a single transaction.

4. Create and/or Enter
   Lot Numbers.

Enough new lines to handle the receipt are
automatically inserted into the table. This is done by referencing
the Maximum Lot Size for the part in its traceability profile.

For example, if Quantity Received is 105,
and Maximum Lot Size is 10, then 11 lines are inserted 10 lots of
10, plus 5 left over that must go into another lot.

For each line, the lot number is assigned
by the following rules based on the setting of the Number option in
the traceability profile for the part:

Automatic - The
Lot Number defaults to <Auto>, and cannot be changed. The number
is assigned when the receipt transaction is complete. This is useful
when shipments do not have preassigned lot or serial numbers, or you
want to assign your own internal number. You will probably want to
use the Print Trace Labels function with this option, to mark the
received materials with the assigned lot number.

User - The Lot
Number is blank and must be entered. This is useful when receiving
material lots with a vendor-assigned lot number or serial number.
You may wish to use that lot number, rather than reassigning your
own. You can enter the lot number from the vendors shipping paperwork
or packaging.

Automatic or User
- The Lot Number defaults to <Auto>, but you can override it
if necessary.

Use Part Trace Profile Maintenance to change
the setting for a Part ID.

5. Set the quantities.

Along with the newly created lines, the
system automatically fills in their Quantity fields so as to distribute
the total Quantity Received across the lot numbers. In the example
given above, each of the first 10 lot numbers would get a Quantity
of 10, and the last would get a Quantity of 5, for a total of 105
received.

You are not required to use these defaults.
If you want to modify quantities received on a lot number, change
the Quantity fields as appropriate. If you want to receive to more
lot numbers, click the Insert button to create new rows.

If you need to receive to less lot numbers,
select the unwanted lines and click the Delete
button. Use the Reset button to reset the dialog box to the original
default lines and quantities.

You can keep track of how much of the total
Quantity Received you have accounted for by watching the Numbered
Quantity field at the upper right. This field is the total of all
entries in the Quantity column. You usually want this to equal Total
Quantity.

Numbered Quantity can be greater than or
less than Total Quantity. When you close the dialog box, VISUAL warns
you and gives you the option to cancel or accept the override. If
you choose to override, Quantity Received for the line is automatically
adjusted to the Numbered Quantity.

Continuing with our example, suppose that
even though the lot size maximum is set to 10, you are shipped one
container of 50 units, and 5 containers of 10 units. You enter 50
for the first quantity, and 10 for the next 5 quantities. You delete
the other 5 lines they are unneeded. You also enter the lot numbers
from the 5 containers. When you try to close the window, VISUAL warns
you that 105 were being received, but you only accounted for 100.
You realize that 5 are missing, and decide to override so you can
finish the receipt. When you return to the Purchase Receipt Entry
window, you will see that the Quantity Received is now set to 100.
When you complete the transaction, you will have to deal with the
under-receipt in the normal way.

When you save the receipt, the same dialog
boxes (Close Short and Back Order) appear, informing you of the under
receipt, as if Traceability were not involved.

6. Enter Properties and
   Comments.

When a new lot number is created, you must
enter all properties at that point; afterwards, they can only be changed
using Part Trace Maintenance. If a property is marked as Required
in the traceability profile for the part, you cannot complete the
transaction until you enter a value for the property. Additionally,
you may enter any comments at this point. For example, you may wish
to make a note of the anomalous 50 unit shipment in the example above.

7. Override the Expiration
   Date, if necessary.

If the part traceability profile for the
part specifies a shelf life, the Expiration Date defaults to the current
date plus the shelf life. You can override this default date. For
example, you may feel that a certain amount of shelf life has already
expired before the receipt.

8. Click the Close
   button to exit the Traceability dialog box.

If the Numbered Quantity does not equal
Total Quantity, VISUAL prompts you and gives you the an option to
abort the close, or override the quantity. If you override, Quantity
Received for the line is reset to the current Numbered Quantity.

9. Repeat this procedure
   for each line, then click Save or Receive All as appropriate.
10. Print the Trace Labels.

## For Material Returns

1. Enter return information
   in Purchase Receipt Entry by selecting a line and clicking on
   the Return button.

The Purchase Receipt Returns dialog box
appears.

2. For each line containing
   a traceable part, select the line and click the Part
   Traceability button.

The Traceability dialog box appears.

Total Quantity displays the Qty Returned
that you entered on the line. You must now specify which lot numbers
are actually being returned.

3. Set the return quantities.

The table displays one line for each lot
number of the part that has an unissued quantity. These lot numbers
are your choices from which you can return materials.

|  |  |
| --- | --- |
| POSTIT.gif | If you use Purchase Receipt Entry to receive traceable materials that were linked to a work order, you cannot return them until Inventory Transaction Entry is used to do an Issue/Return of those materials back into inventory. |

The system automatically fills in the Quantity
fields to distribute the total Qty Returned across the lot numbers
as needed.

For example, if you are returning 100 units
and the first three lot numbers shown have Unissued Qty of 25, 30,
and 200, VISUAL resets their quantities to 25, 30, and 45, to account
for the 100 being returned. It is possible that these will not be
the actual lot numbers you are returning. You can adjust the quantities
by zeroing those for lot numbers that arent being returned, and filling
in the correct quantities of those that are. You will be accessing
lot numbers from the original containers or parts, or from the trace
labels that were attached earlier.

You can keep track of how much of the total
Qty Returned you have accounted for by watching the Numbered Quantity
field at the upper right. This field is the total of all entries in
the Quantity column. You usually want this to equal Total Quantity.

You can have Numbered Quantity be greater
than or less than Total Quantity. When you click Close,
VISUAL warns you and gives you the option to cancel or accept the
override. If you choose to override, Qty Returned for the line is
automatically adjusted to the Numbered Quantity.

4. Enter comments.

You can enter any comments about the return
in the Comments field. Note that these are in addition to, or replace,
any original comments that were made. You can modify the Expiration
Date at this point, if needed.

5. Click Close
   to exit the Traceability dialog box.
6. Repeat this procedure
   for each line, then click Save to complete
   the return transaction.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help