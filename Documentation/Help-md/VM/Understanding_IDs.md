Understanding IDs




# Understanding IDs

Every record has an ID. The ID is a unique name for
the record and is the key to calling it up. In the majority of cases,
the ID is labeled with a name similar to the window name. Part ID,
Customer ID, Vendor ID, and Quote ID are examples of ID labels. For
some records, transaction IDs are assigned, for example, Labor Tickets
and Inventory Transactions. In a few records, such as work orders,
the IDs are built from multiple components, which together define
the unique ID.

For example, Customer Order Entry uses three unique IDs:

Our Order ID The ID you assign to the
specific customer order

Customer ID The unique ID of the customer,
which you have already established in Customer Maintenance

Customer PO The Purchase Order ID that
your customer wants you to reference on the order.

A browse button indicates that you can click it to search your database
for possible selections.

It is important to understand that all IDs are text strings. For
this reason, you cannot enter 23 to refer to Order ID 0023 because
the leading zeros are part of the ID.

## Understanding Master and Work Order IDs

Engineering Master, Quote Master, and Work Order IDs all consist
of four components: Base ID, Sub ID, Lot ID, and Split ID.

Base ID For engineering masters, the
Base ID must be the same as the Part ID.

For quote masters, the Base ID always matches its Quote ID.

For work orders, the Base ID is sometimes called the Job ID.

Lot ID/Eng ID For engineering masters,
this field is the Engineering ID, allowing multiple revisions of the
same master.

For quote masters, this field uniquely identifies the quote master
from others attached to the same quote.

For work orders, the Lot ID identifies a specific lot within a larger
work order specified by Base ID. This allows all of the lots to have
the same Base ID.

Split ID Split IDs uniquely identify
child lots of split work orders allowing all splits to have the same
Base ID/Lot ID as the parent order. This field allows a manual split.
For engineering masters, this field should always be zero.

Sub ID Sub IDs uniquely identify legs
within the work order.

Masters and work orders can have several subassembly legs, each
representing the independent production of a subassembly required
by the parent operation. The primary leg is always Sub ID zero.

Master or Work Order identifiers usually appear in the following
format:

40002-1/2.3

Base ID 40002

Sub ID 1 and is separated from the Base
ID by a -

Lot ID 2 and separated from the Sub
ID by a /

Split ID 3 and is separated from the
Lot ID by a .

If a Split ID or Sub ID is 0, it usually is not displayed.