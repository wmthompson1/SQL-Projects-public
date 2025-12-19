Traceability in Applications




# Traceability in Applications

Part Traceability creates a trace record for each
lot number, serial number, or other grouping of the part. This trace
record is created and updated as the parts flow through your plant.
The following information is associated with a trace record:

Trace ID - The actual lot number, serial
number, etc.

Quantity Assigned - If preassigning numbers,
this is the quantity set aside for this lot number. This value is
assigned using Pre-Assign Numbers in Part Trace Maintenance, and can
be modified using that application, if needed.

Quantity Received - When receiving purchased
materials using Purchase Receipt Entry, or intermediates, or finished
goods using Inventory Transaction Entry, this records the quantity
received of this lot number, serial number, etc.

Quantity Issued - When issuing raw materials
to a work order using Inventory Transaction Entry, or to a customer
order using Shipping Entry, this records the quantity of this lot
number that is issued.

Quantity Reported - When reporting completed
quantities through Labor Ticket Entry, this records the quantity completed
of this lot number.

Properties - When a trace record is initialized,
these record various characteristics of the lot or serial number that
may vary from group to group.

Comments - Comments can be entered or
modified at all points in the flow where traceability is recorded.

Expiration Date - For perishable materials,
this tracks the expiration date of the lot or serial number.

As you proceed with these transactions, trace records are cross-referenced
to inventory and labor transactions. You can chain through these references
using Part Trace Maintenance, and also print reports based on them.

Part Traceability affects the behavior of five VISUAL applications:
Purchase Receipt Entry, Inventory Transaction Entry, Labor Ticket
Entry, Shipping Entry, and Physical Inventory. Most aspects of its
use are identical between all of these applications with the exception
of Physical Inventory. For the others, this section first discuss
these common characteristics, then address the details of use in each.
This section assumes you are familiar with the other Infor VISUAL
applications.

When Part Traceability is installed, and at least one traceability
profile is defined, extra push buttons appear in some applications.
A Part Traceability button appears at the bottom right of the screen
in all four applications, and also in the Return dialog boxes for
purchase receipts and shipments. Additionally, a Print Trace Labels,
or Print Labels, button appears to the left of the Part Traceability
button in all applications except Labor Ticket Entry.

In all cases, the general part traceability procedure
is:

1. Enter the receipt or
   return, inventory transaction, shipment or return, or labor ticket
   in the normal way.
2. If no traceable parts
   are involved in an inventory or labor ticket transaction then
   the Part Traceability button is disabled, and VISUAL processes
   the transaction in the normal way.

For Purchase Receipt Entry and Shipping
Entry, the Part Traceability button is always enabled, but only applies
to line items for traceable parts. If there are no line items for
traceable parts, the button cannot be used, and the transaction is
again processed in the normal way.

3. If the transaction or
   line items DO refer to traceable parts, you should first enter
   all data to complete the transaction or transaction line items
   in the normal way, then click the Part Traceability button to
   call up the Traceability dialog box. If the application has line
   items, you must first select the line item with the traceable
   part before clicking on the Part Traceability button. You must
   do this process for each traceable part.
4. The Traceability dialog
   box has a line item table that generally contains one line for
   each lot, serial number, or other trace ID of the part that might
   be involved in this transaction.
5. The general idea of
   traceability is as follows:

A transaction, whether it is one of receipt,
inventory, shipment, or other, specifies a Part ID, a Quantity, and
a warehouse location. When a part is not traceable, that information
is sufficient to complete the transaction, because on-hand quantities
are maintained by location. With traceability, however, you must additionally
specify how the Quantity portion is distributed among lot numbers.

For example, if receiving a quantity, which
lot number or numbers are being received? If issuing to a work order,
which lot number or numbers is the quantity issued from?

The procedure is as follows:

1. Assign
   Lot Numbers.

For some transactions, such as purchased
material receipt, a new lot number must be assigned to create a new
lot, serial number, etc. For most transactions, the user has the capability
to create new lot numbers, if needed.

When new lot numbers are required, the system
automatically inserts enough lines for all the new numbers needed,
based on maximum lot size. If you need to create more numbers, you
can use the Insert button.

If the traceability profile for the part
specifies auto-numbering, the lot number defaults to <Auto>.
This indicates that a number is automatically assigned when you complete
the transaction. If user numbering is allowed, you can override this
entry and enter a lot number. If only user numbering is specified,
enter a lot number.

2. Assign
   Quantities.

When the Traceability dialog box first appears,
the Total Quantity for the transaction appears at the top right of
the screen. This is the quantity you entered to issue, receive, return,
or ship.

The Numbered Quantity appears just below
the Total Quantity. This shows how much of the Total Quantity you
have currently assigned to a lot number by specifying the Quantity
for that lot number. The Numbered Quantity columns should equal the
Total Quantity; you would then have specified how the total quantity
is distributed among lots. Usually, the system automatically makes
entries in the Quantities columns to make this distribution.

As an example, consider using Purchase Receipt
Entry to return 50 units of a traceable part. You specify the return
in the normal way, and then press Part Traceability in the Return
dialog box. The Traceability table lists all lots of the part that
have unissued quantities. Those that have been issued to a work order
would have to be returned to inventory before using the Purchase Receipt
Entry to return parts to vendor. The Total Quantity shown would be
50, because you are returning a total of 50 units. If the first three
lots listed have unissued quantities of 10, 25, and 100, then the
system automatically fills in the Quantity for those lines to 10,
25, and 15 the 50 is distributed over the three lots. If you are
returning from different lots, you can redistribute the quantity as
needed.

3. Enter
   Properties and Comments.

At a transaction where a new lot number
is created, you can enter the alpha and numeric properties for the
new lot, serial number, or other trace ID. For all properties marked
as required in the Traceability Profile for the part, an entry must
be made.

If the Fill Property Columns Automatically
If Blank box is checked, all blank property fields for new rows are
filled with the first value entered in a row. For example, if there
are three new rows, and you enter 10.5 in a property column for the
first row, this value cascades into all other rows for that property.
This is useful when properties for received items are often the same.

You can enter and modify Comments whenever
you enter traceability information for a lot number.

6. When you are finished
   entering traceability information, click the Close
   button.

You return to the application window.

Now that you have entered traceability,
you can complete the transaction by clicking on Save.
If you find you need to change it before completing the transaction,
you are allowed to re-edit traceability information by pressing Part
Traceability again.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_Purchase_Receipt_Entry.md) Traceability in Purchase Receipt Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_Inventory_Transaction_Entry.md) Traceability in Inventory Transaction
Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_Labor_Ticket_Entry.md) Traceability in Labor Ticket Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_Shipping_Entry.md) Traceability in Shipping Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_the_Service_Planning_Window.md) Traceability in Service Planning

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_the_Material_Planning_Window.md) Traceability in the Material Planning
Window

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Traceability_in_Physical_Inventory.md) Traceability in Physical Inventory Count

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help