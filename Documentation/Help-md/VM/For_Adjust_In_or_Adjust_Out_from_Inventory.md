For Adjust In or Adjust Out from Inventory




# For Adjust In or Adjust Out from Inventory

This covers traceability for adjustment of on-hand
balances for a traceable part. This applies when the Adjustments option
is checked in When to Apply section for the parts traceability profile

For Adjust/Out transactions, all lot numbers for the Part ID are
listed. The Unissued Quantity for each lot number appears in the left
most columns.

For Adjust/In transactions, the default is to create a new lot number
to handle the adjustment, so VISUAL inserts a new lot number line.
Existing lot numbers do not appear. If you want to adjust in to an
existing lot number, use the Insert button to insert a new line, and
enter the lot number desired. Unreceived Quantity for each lot number
is shown in the left most columns.

The system automatically fills in Quantity fields so as to distribute
the total adjustment across the lot numbers in the table.

For Adjust/Out transactions, the Unissued Quantity appears. This
represents the maximum amount that you would probably want to adjust
out against the lot number; any remainder that was originally received
has already been issued to a work order or customer order.

For Adjust/In transactions, the Unreceived Quantity appears. This
value only applies to lot numbers that were preassigned. When accounting
for extra pieces, this allows you to see which preassigned lot numbers
have not received their originally preassigned quantity. You can,
however, adjust in to any new or existing lot number.

If you want to modify adjustment quantities, change the Quantity
fields as needed.

You can keep track of how much of the total adjustment Quantity
you have accounted for by watching the Numbered Quantity field at
the upper right. This field is the total of all entries in the Quantity
column. You usually want this to equal Total Quantity.

You are allowed to have Numbered Quantity be greater than or less
than Total Quantity. When you click Close,
VISUAL warns you and gives you the option to cancel or accept the
override. If you choose to override, VISUAL automatically changes
the adjustment Quantity for the transaction to the Numbered Quantity.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help