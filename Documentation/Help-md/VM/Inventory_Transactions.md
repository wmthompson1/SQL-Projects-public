Inventory Transactions




# Inventory Transactions

Purchase Receipt Entry automatically creates inventory
transactions based on the type of transaction, receipt or return performed.
These are equivalent to transactions that are otherwise entered in
Inventory Transaction Entry.

If you are licensed to use multiple sites, the inventory
transactions are created in the same site as the purchase receipt.

## Receipt to Inventory

If a material was purchased to inventory, Purchase Receipt Entry
creates an inventory receipt transaction for the Part ID, Quantity,
Warehouse/Location, and Receipt Date specified. If the material was
purchased in a unit of measure different from the stock unit of measure,
an automatic conversion takes place.

## Receipt to Work Order

If a material purchase is linked to a work order, Purchase Receipt
Entry creates two inventory transactions. The first transaction is
a receipt to inventory, as specified above. The second transaction
immediately issues the material to the linked work order for the quantity
required in the material requirement, or for the received quantity,
whichever is lower.

If multiple work orders are linked to the line item, multiple issue
transactions will automatically be created. These will be created
in Work Order Base ID sequence until all work orders have been issued
to, or no more received material remains.

In the case of over-receipt of a non-inventory part, all material
will be issued to the work order, regardless of the requirement quantity.

## Return to Vendor

For material returned to the vendor, VISUAL automatically creates
a Receipt Return transaction for the return quantity, warehouse location,
and return date. If the material was originally purchased to a work
order, VISUAL also creates a Return Issue transaction.

## Received Services

Receipt of a service does not create an inventory transaction. Instead,
it creates a Service Receipt. This updates Quantity Completed for
the service operation in the work order, and captures other data as
well.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.md) User-defined Help