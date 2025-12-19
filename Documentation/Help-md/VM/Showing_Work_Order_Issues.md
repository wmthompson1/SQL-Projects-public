Showing Work Order Issues




# Showing Work Order Issues

If you are viewing inventory transactions for the
trace record of a fabricated part, you can go down another level.

1. Select an inventory
   transaction for the Receipt of a work order into inventory from
   the Traceable Parts Inventory Transactions dialog box.
2. Click the Detail
   button.

The Work Order Issues dialog box appears.

This window lists all of the Issue transactions
for the selected work order that are for traceable parts.

The following information appears:

Transaction #
- Identification of the inventory transaction.

Part - The Part
Description for the issued part.

Trace ID - The
lot number, serial number, or other label for the grouping.

Quantity Traced
- As described previously, the total transaction quantity.

Total Quantity Required
- The quantity required from the material requirement specified in
the work order.

Total Quantity Issued
- The total quantity issued to this requirement. This is from this
transaction and any others.

Transaction Date
- Date of this issue transaction.

When you select a line, the trace record
information for the record specified on the selected line is summarized
at the bottom of the window. Issued Quantity, Received Quantity, Reported
Quantity, Assigned Quantity, Expiration Date, and Properties are all
shown for the lot number.

It is easy to get confused at this point,
because of the many relationships between inventory transactions and
lot numbers. One inventory transaction can have more than one lot
number involved; one lot number can be associated with more than one
inventory transaction, and the mapping is not one-to-one.

The Total Quantity Issued shown in the table
is the total quantity that was issued to the work order requirement,
and may have been issued by many inventory transactions. The Iss Qty
shown at the bottom of the window is the total quantity that was issued
from the lot number, and may have been issued to many other work orders
besides the current one. Remember that the issue transactions being
displayed are only for the work order specified at the top of the
dialog.

3. Select a line and click
   the Detail button.

The Show Inventory Transactions dialog box
appears, showing all the inventory transactions associated with the
lot number for the transaction you selected.

You can now return to the instructions at
the top of this section and proceed down another level, if desired.
You can continue to drill-down through levels of traceable fabricated
parts in this way, until all inventory transactions shown are for
issues of purchased materials.

An Example of Forward and Backward Traceability

As an example of this, consider a traceable
fabricated part with Part ID F1, that you trace by individual serial
number. It requires a purchased subassembly with Part ID S1, that
is also traceable, by lot numbers, with a lot size of 10.

You ship a unit to a customer, who later
contacts you with a problem that turns out to be in the S1 subassembly.

You start up Part Trace Maintenance, and
enter F1 for the Part ID. All serial numbers for F1 appear.

You locate the line for the customers serial
number, as printed on the packlist, and select the line. You then
click the Show Labor Trans button. Most
likely, a single labor transaction appears for the completion of the
one serialized unit (if you were tracking by lots, there might be
more.) You can see who reported the labor, how much, and when.

You then click the Show
Inv Trans button to show all inventory transactions associated
with the unit. You locate the transaction for Receipt to inventory,
select it, and click the Detail button.
You can now see all the traceable parts issued to this unit. The line
for the S1 subassembly shows the lot number from which it came. You
select that line, and see that Iss Qty for this lot is 4, and the
Rec Qty is 6. From this questionable lot, 4 units went into work orders,
and 6 are still in stock.

You decide to test the remainder of the
lot (6 units) and discover problems with 3 other units. Now you want
to find out where the other 3 were used. You select the line for the
S1 assembly and click the Detail button.
Now all the inventory transactions for that lot appear. You can now
see from Issue transactions that all 3 were issued to other work orders
for part F1. You note these Work Order IDs, and return to the main
Part Trace Maintenance window.

Now use the Show Part Inventory Transactions
command to show all transactions for part F1. You find receipt transactions
for two of the work orders; the other is still in-process and can
be addressed. For one of the received work orders, you find no issue
transactions; it has not been shipped, and can be checked or repaired.
For the other receipt, you find an issue to a customer order. You
note the Order ID, and can contact the customer for a possible recall.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help