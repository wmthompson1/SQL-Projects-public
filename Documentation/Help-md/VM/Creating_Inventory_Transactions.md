Creating Inventory Transactions




# Creating Inventory Transactions

Shipping Entry automatically creates inventory transactions
based on the shipment or return performed. You can view these transactions
using Inventory Transaction Entry.

Shipment from Inventory

If a line item part did not have a linked work order, then an inventory
Issue transaction for the Part ID, Ship Quantity, Warehouse/Location,
and Ship Date is created to issue the parts to the customer order.

Return to Inventory

If the line item part did not have a linked work order, then an
inventory Issue Return transaction for the Part ID, Ship Quantity,
Warehouse/Location, and Return Date is created.

Shipment of Work Order

If a line item had a linked work order, whether for an inventory
part or a custom part, then two inventory transactions are created.
The first is a Receipt transaction to receive the line item work order
into finished goods. The work order is closed, if needed. The second
is an Issue transaction to issue the materials out to the customer
order.

For an inventory part, receipt and issue are done to and from a
warehouse and location.

When a work order is linked one-to-one with a customer order line
(i.e., the quantities are the same), you cannot manually receive a
work order into finished goods; Shipping Entry does this automatically.
If the work order quantity is greater than that needed to fill the
order, then this operation can be done manually.

## Return of Work Order

Again, two transactions are created. An Issue Return transaction
is created to bring the material back into the warehouse, and a Receipt
Return is created to move the work order back into work-in-process.

## Shipment/Return of Miscellaneous Items

No inventory transactions are created for miscellaneous customer
order items.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help