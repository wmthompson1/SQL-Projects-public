For Issue of Inventory to a Work Order




# For Issue of Inventory to a Work Order

This applies when the Issuing/Shipping option of When
to Apply is set for the parts traceability profile.

There are two possibilities for a part that is now being issued,
which control the types of lines that are likely to appear in the
table.

Traceability Started at Receipt - If Receiving
is checked in the When to Apply section for the parts traceability
profile, then the lot numbers for these parts are probably assigned
already in Purchase Receipt Entry, or with an inventory receipt of
a work order.

If this is the case, then there are most likely lines in the table
showing existing lot numbers that are in inventory, assuming there
is enough inventory to issue.

Unissued Quantity appears for each lot number. These lot numbers
are your choices from which to issue materials.

Traceability Starts at Issue - If Receiving
is NOT checked in the When to Apply section for the parts traceability
profile, but does have Issuing/Shipping checked, then the lot numbers
for these parts are created when issuing.

You may use this method, for example, if you are serializing parts
as they are issued to work orders.

If this is the case, then there will not be lot numbers for existing
inventory. The system inserts enough lines to handle the quantity
being issued, in a way identical to that described in step 3 for Purchase
Receipt Entry.

There may also be lines for preassigned lot numbers. This means
that Part Trace Maintenance was used to create lot numbers ahead of
time, to be used as material is issued.

Whether lot numbers already exist, have been preassigned, or are
being created now, the system automatically fills in their Quantity
fields so as to distribute the total Quantity Issued across the lot
numbers.

You are not required to use these defaults; it is quite likely that
you are actually issuing from different lot numbers than those listed.
You can adjust the quantities by zeroing those for lot numbers that
arent being issued, and filling in the correct quantities of those
that are. You will be accessing lot numbers from the original containers
or parts, or from the trace labels that were attached earlier.

For perishable materials, you want to examine the Expiration Date
and use the oldest lots first.

You can keep track of how much of the total issue Quantity you have
accounted for by watching the Numbered Quantity field at the upper
right. This field is the total of all entries in the Quantity column.
You usually want this to equal Total Quantity.

You are allowed to have Numbered Quantity be greater than or less
than Total Quantity. When you press Close, you are warned, and given
the option to cancel or accept the override. If you choose to override,
the Quantity specified in the Inventory Transaction Entry screen is
automatically adjusted to the Numbered Quantity.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help