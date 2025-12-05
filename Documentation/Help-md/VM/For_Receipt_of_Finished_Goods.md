For Receipt of Finished Goods




# For Receipt of Finished Goods

This covers traceability for receipt of work orders
into inventory. This applies when the Receiving option is checked
in When to Apply section for the parts traceability profile.

There are two possibilities for the part now being received, which
control the types of lines that are likely to appear in the table.

Traceability Started at Labor Ticket Entry
- If When to Apply for the parts traceability profile had Labor Ticket
Entry checked, then the lot numbers for these parts should have already
been assigned when completed quantities were reported through Labor
Ticket Entry.

If this is the case, there are lines in the table showing existing
lot numbers that have been reported against.

Unreceived Quantity is shown for each lot number, and indicates
the remainder of the lot number that has not yet been received. These
lot numbers are your choices to which you receive materials.

Traceability Starts at Receipt - If When
to Apply for the parts traceability profile did NOT have Labor Ticket
Entry checked, but does have Receiving checked, then the lot numbers
for these parts are created at this point, when receiving.

If this is the case, then the system inserts enough lines to handle
the quantity being received, in a way identical to that described
in [Purchase Receipt Entry](VMRCVENTWhat.htm).

There may also be lines for preassigned lot numbers. This means
that Part Trace Maintenance was used to create lot numbers ahead of
time, to be used as material is received.

Along with the newly created lines, the system automatically fills
in their Quantity fields to distribute the total Quantity Received
across the lot numbers.

You are not required to use these defaults. If you wish to modify
quantities received on a lot number, change the Quantity fields as
necessary. If you want to receive to more lot numbers, click the Insert button as necessary to create new rows.
If you need to receive to less lot numbers, select the unwanted lines
and click the Delete button. Use the Reset button to reset the screen to the original
default lines and quantities.

You can keep track of how much of the total receipt Quantity you
have accounted for by watching the Numbered Quantity field at the
upper right. This field is the total of all entries in the Quantity
column. You usually want this to equal Total Quantity.

You are allowed to have Numbered Quantity be greater than or less
than Total Quantity. When you click the Close button, VISUAL warns
and gives you the option to cancel or accept the override. If you
choose to override, VISUAL automatically adjusts the receipt Quantity
for the transaction to the Numbered Quantity. For example, if you
enter 100 for the Quantity in Inventory Transaction Entry, then enter
traceability and realize you are only receiving 95, you can choose
to override, and VISUAL adjusts the Quantity down to 95 for you.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help