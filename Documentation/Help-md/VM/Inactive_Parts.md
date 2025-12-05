Inactive Parts




# Inactive Parts

This table shows the actions that you can and cannot complete when
a part is inactive.

|  |  |  |
| --- | --- | --- |
| **Application** | **Restricted actions** | **Allowed actions** |
| Estimating Window | * You cannot create   a quote for an inactive part or for a part that includes   an inactive part in its quote master. |  |
| Customer Order Entry | * You cannot create   a customer order line for an inactive part if the order   header or line status is Released, Firmed, or On Hold. * You cannot create   a customer order by copying a customer order with an inactive   part * You cannot generate   an order from a quote that contains an inactive part. * You   cannot generate a work order for an inactive part. | * You   can add an inactive part to a new customer order if the   order has a status of Closed or Cancelled/Void. |
| Shipping Entry | * You   cannot process customer order returns for inactive parts. | * You   can ship orders that contain inactive parts. |
| EDI | * The part cannot   be used in inbound CPO EDI transactions. |  |
| Vendor RFQ Entry | * You   cannot create a new vendor RFQ for an inactive part. |  |
| Purchase Requisition Entry | * You cannot create   a new purchase requisition for an inactive part if the   requisition has a status of Released or Firmed. | * You can add an inactive   part to a new purchase requisition that has a status of   Closed or Cancelled/Void. |
| Purchase Order Entry  Purchase Management Window | * You cannot create   a new purchase order line for an inactive part if the   purchase order has a status of Released or Firmed. * You cannot generate   a purchase orders for RFQ lines that contain an inactive   part. * You cannot copy   a purchase order that contains an obsolete part. | * You   can add inactive parts to a purchase order if the purchase   order has a status of Closed/ or Cancelled/Void. |
| Purchase Receipt Entry | * You cannot return   a purchase order for an inactive part. | * You can receive   a purchase order for an inactive part. |
| ECN Entry | * You cannot specify   the part in the ECN line item table. * You cannot copy   an existing ECN that contains the pa |  |
| Equipment Maintenance | * If the part is used   on the header or as a material requirement in the maintenance   work order, then customer orders cannot be created in   Equipment Maintenance. |  |
| Inventory Transaction Entry | * You   cannot create an adjust in transaction for an inactive   part. |  |
| Manufacturing Window | * Inactive parts cannot   be added to new or existing work orders or quote masters.   You cannot specify an inactive part in the header, leg,   material requirement, or coproduct. * If a work order   contains an inactive part, then the work order status   cannot be changed to Released, Firmed, or Unreleased. * You cannot use Purchase   this Part functionality on inactive parts. | * You can add inactive   parts to engineering masters. * You   can change the status of a work order that references   inactive parts to Cancelled or Closed. |
| Material Planning Window | * You cannot create   a new planned order for an inactive part. * You cannot place   a purchase order for an inactive part. * You cannot create   a work order for an inactive part or create a work order   where an inactive part is used as a material requirement   or leg. * You   cannot firm or release a planned order for an inactive   part. |  |
| APS import | * If   an inactive part is referenced on a work order, customer   order, or purchase order file, the file cannot be imported. |  |
| VDIU | * You cannot import   quote masters or work orders that use inactive parts.   Inactive parts cannot be used in the configurator interface. * You cannot create   quote masters or work orders on the fly if they use inactive   parts. | * You can import engineering   masters that include inactive parts. * You   can create engineering masters that include inactive parts   on the fly. |