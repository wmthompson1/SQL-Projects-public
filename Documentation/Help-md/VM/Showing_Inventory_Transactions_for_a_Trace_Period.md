Showing Inventory Transactions for a Trace Period




# Showing Inventory Transactions for a Trace Period

With the exception of Labor Ticket Entry, all transactions
where you enter trace information create inventory transactions. When
you are using one of these applications, the focus is on the transaction,
for example, shipping. When you perform the transaction, you provide
some auxiliary traceability information.

With Part Trace Maintenance, the focus is on the trace record. You
can select a trace record, and view all the inventory transactions
that are associated with the record.

1. Select any line.
2. Click Show
   Inv Trans button or select Show Trace
   Inventory Transactions from the Info menu.

A table window appears, with one line for
each associated inventory transaction.

The dialog box displays the following information
for each transaction:

Transaction #
- The Transaction ID of the associated transaction. You could enter
this number in Inventory Transaction Entry to call up the transaction.

Quantity - The
quantity of this lot number that was part of this transaction.

Quantity Traced
- The total transaction quantity. This may not be the same as the
Quantity given above. For example, if parts are traced by serial number,
and a quantity of 10 were shipped, the Quantity Traced for the transaction
shows 10, and each of the 10 serial numbers shipped show a Quantity
of 1.

Type - The type
of inventory transaction:

|  |  |
| --- | --- |
| Transaction | Created By |
| Issue | Inv. Trans. Ent. Issue, or Shipping Entry |
| Iss/Rtn | Inv. Trans. Ent. Issue/Return, or Shipping Entry Return |
| Receipt | Inv. Trans. Ent. Receipt, or Purchase Receipt Entry |
| Rec/Rtn | Inv. Trans. Ent. Receipt/Return, or Purchase Receipt Entry Return |
| Adjust/In | Inv. Trans. Ent. Adjust/In, or Physical Inventory Count |
| Adjust/Out | Inv. Trans. Ent. Adjust/Out, or Physical Inventory Count |

Work Order ID
- The Base ID/Lot ID, Operation Sequence Number, and Piece Number
for an associated work order. A work order may be involved in an Issue,
Issue/Return, Receipt, or Receipt/Return.

Purchase Order ID
- For a Receipt or Receipt/Return created by Purchase Receipt Entry,
this is the Order ID of the Purchase Order that was received or returned
against.

Customer Order ID
- For an Issue or Issue/Return created by Shipping Entry, this is
the Order ID of the Customer Order that was shipped or returned.

Transaction Date
- Date assigned by the application when creating the transaction.
Could be inventory transaction date, actual ship date, or receive
date.

Warehouse ID/Location
ID - Warehouse and location from where the parts move.

3. Click the Close
   button to close the Traceable Parts Inventory Transactions dialog
   box and return to the Part Trace Maintenance window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help