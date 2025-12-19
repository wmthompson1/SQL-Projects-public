Showing Part Inventory Transactions




# Showing Part Inventory Transactions

The process described above allows viewing of inventory
transactions associated with individual lot numbers for a part. You
may want to view all inventory transactions for the part at once.

To do this, select Show Part Inventory Transactions
from the Info menu. You do not need to select a line, because you
are viewing all transactions for the part.

The Part Inventory Transactions dialog box appears.

The lines that appear are the union of all transactions that would
be listed if you selected each line and clicked on the Show
Inv Trans button. Additionally, any inventory transactions
with quantities not traced also appear.

The line items are essentially the same as those described above
for showing Trace Inventory Transactions. However, the quantities
shown are slightly different. Quantity (not Quantity Traced) is the
total transaction quantity. Quantity Traced is the sum of all lot
number quantities associated with this transaction.

This dialog box is mainly provided to allow identification and adjustment
of existing inventory quantities for the part that have not been assigned
to lot numbers. This may have happened if you implemented traceability
after on-hand levels existed, or if traceability is not applied to
inventory adjustments.

You can identify any such quantities by comparing Quantity to Quantity
Traced. Normally, they should be equal. You can correct any discrepancies,
such as a Quantity Traced of zero, or less than Quantity, by selecting
the line and clicking on the Edit Part Trace
button. This is only allowed if there is a difference between the
quantities.

The standard Traceability dialog box appears, in which you can create
lot numbers as needed, or assign quantities to existing lot numbers.
The Numbered Quantity that appears is the difference between the Quantity
and Quantity Traced; this is the number for which you need to account.

To commit the changes made in the Traceability dialog box, click
the Save Part Trace button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help