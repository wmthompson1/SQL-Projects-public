Active Parts and Functional Areas




# Active Parts and Functional Areas

To prevent a part from being used in a particular functional area,
clear the functional area check box. The tables in this section list
the disallowed action by functional area.

## Sales Functional Area Check Box

This table shows the actions that cannot be completed when the Sales
functional area check box is cleared:

|  |  |
| --- | --- |
| **Application** | **Restricted actions** |
| Estimating Window | * You cannot create   a quote for a disallowed part. * You cannot copy   an existing quote for a disallowed part. |
| Customer Order Entry  Order Management Window | * You   cannot create a customer order line for a part. * You   cannot create a customer order by copying a customer order   with a disallowed part * You   cannot generate an order from a quote that contains a   disallowed part. |
| Shipping Entry | * You   cannot ship orders that contain disallowed parts. * You   cannot process customer order returns for disallowed parts. |
| RMA Entry | * You   cannot process an RMA for a disallowed part. |
| APS import | * If   a disallowed part is referenced on a customer order file,   the file cannot be imported. |
| EDI | * The   part cannot be used in EDI transactions. |
| Equipment Maintenance | * If   the part is used on the header or as a material requirement   in the maintenance work order, then customer orders cannot   be created in Equipment Maintenance. |

## Purchasing Functional Area Check Box

This table shows
the actions that cannot be completed when the Purchasing
functional area check box is cleared:

|  |  |
| --- | --- |
| **Application** | **Restricted actions** |
| Vendor RFQ Entry | * You cannot create   a new vendor RFQ for a disallowed part. |
| Purchase Requisition Entry | * You cannot create   a new purchase requisition for a disallowed part. |
| Purchase Order Entry  Purchase Management Window | * You cannot create   a new purchase order line for a disallowed part. * You cannot generate   a purchase orders for RFQ lines that contain disallowed   parts. * You   cannot copy a purchase order that contains disallowed   parts. |
| Purchase Receipt Entry | * You cannot receive   a purchase order for a disallowed part. * You cannot return   a purchase order for a disallowed part. |
| APS import | * If   a disallowed part is referenced on a purchase order file,   the file cannot be imported. |
| Manufacturing Window | * You cannot use Purchase   this Part functionality for material requirement parts. |

## Work Order Functional Area Check Box

This table shows
the actions that cannot be completed when the Work
Order functional area check box is cleared:

|  |  |
| --- | --- |
| **Application** | **Restricted actions** |
| ECN Entry | * You cannot specify   the disallowed part in the ECN line item table. * You cannot copy   an existing ECN for a work order that contains a disallowed   part. |
| Equipment Maintenance | * If the disallowed   part is used on the header or as a material requirement   in the maintenance work order, then customer orders cannot   be created in Equipment Maintenance. |
| Manufacturing Window | * If a work order   contains a disallowed part, then work order status cannot   be changed. * You cannot add a   disallowed part as a material requirement or leg to a   work order, engineering master, or quote master. * You cannot import   a file that references a disallowed part. |
| Inventory Transaction Entry | * You   cannot use a disallowed part when creating a new material   requirement. |
| APS import | * If   a disallowed part is referenced on a work order file,   the file cannot be imported. |
| VDIU | * You cannot import   masters that use the disallowed part. Disallowed parts   cannot be used in the configurator interface. |
| Estimating Window | * You cannot create   a quote for a header part if a disallowed part is included   as a material requirement or leg. * You   cannot copy a quote for a header part if a disallowed   part is included as a material requirement or leg. |
| Customer Order Entry | * You   cannot generate a work order from a customer order if   the engineering master for the part in the customer order   line references a part that is disallowed in the work   order functional area. |