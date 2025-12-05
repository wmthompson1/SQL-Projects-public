Obsolete Parts




# Obsolete Parts

This table shows how obsolete parts can impact the way you use VISUAL
applications:

|  |  |  |
| --- | --- | --- |
| **Application** | **Disallowed actions** | **Allowed actions** |
| Estimating Window | * You cannot create a   quote for an obsolete part or for a part that includes an   obsolete part in its quote master. |  |
| Customer Order Entry | * You cannot use obsolete   parts on order lines if the status of the order is firmed,   released, or on hold. * You   cannot generate a work order for an obsolete part. | * You can add an obsolete   part to a new purchase order that has a status of Closed or   Cancelled/Void. |
| Shipping Entry | * You cannot ship orders   that contain obsolete parts. * You   cannot process customer order returns for obsolete parts. |  |
| RMA Entry | * You cannot create an   RMA for an obsolete part. |  |
| Vendor RFQ | * You   cannot add an obsolete part to an RFQ that has a status of   Released or Firmed. | * You   can add an obsolete part to a new vendor RFQ that has a status   of Closed or Cancelled/Void. |
| Purchase Requisition Entry | * You cannot create a   new purchase requisition for an obsolete part if the requisition   has a status of Released or Firmed. | * You can add an obsolete   part to a new purchase requisition that has a status of Closed   or Cancelled/Void. |
| Purchase Order Entry | * You cannot create a   new purchase order line for an obsolete part if the purchase   order has a status of Released or Firmed. * You cannot generate   a purchase orders for RFQ lines that contain obsolete parts. * You cannot copy a purchase   order that contains an obsolete part. | * You can add an obsolete   part to a new purchase order that has a status of Closed or   Cancelled/Void. |
| Purchase Receipt Entry | * You cannot receive a   purchase order for an obsolete part. * You   cannot return a purchase order for an obsolete part. |  |
| Manufacturing Window | * Obsolete parts cannot   be added to new or existing work orders, engineering masters   and quote masters. VISUAL disallows the selection or entry   of an obsolete part in the header, leg, material requirement,   or coproduct. * If a work order contains   an obsolete part, then work order status cannot be changed   to Released, Firmed, or Unreleased. * You   cannot use Purchase this Part functionality on obsolete parts. | * You   can change the status of a work order that references obsolete   parts to Cancelled or Closed. |
| ECN Entry | * You cannot specify the   part in the ECN line item table. * You cannot copy an existing   ECN that contains the part. |  |
| Material Planning Window | * You cannot create a   new planned order for an obsolete part. * You cannot place a purchase   order for an obsolete part. |  |
| VDIU | * You cannot import quote   masters or work orders that use obsolete parts. Obsolete parts   cannot be used in the configurator interface. * You cannot create quote   masters or work orders on the fly if they use obsolete parts. |  |
| Inventory Transaction Entry | * You cannot use an obsolete   part when creating a new material requirement. * You cannot create or   delete any inventory transactions against an obsolete part.   You cannot create receipts, issues, adjustments in, and adjustments   out. * Obsolete   parts cannot be auto-issued to work orders. |  |
| Physical Inventory Count | * Obsolete parts and their   associated warehouse locations are ignored when generating   tags. * The   use of an obsolete Part ID is not allowed when entering or   reentering counts. |  |
| Interbranch Transfers | * You   cannot use obsolete parts in IBTs unless the status of the   IBT is Closed or Cancelled/Void |  |
| APS Import | * If   an obsolete part is referenced on a work order, purchase order,   customer order file, the file cannot be uploaded. |  |