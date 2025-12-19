Working with Partial Shipments of Internal Orders




# Working with Partial Shipments of Internal Orders

When you ship an internal order, the internal vendor site may not
have the entire quantity in stock. As a result, the internal customer
order may be back ordered.

When you send a partial shipment for an internal order, you have
the same options as you have when you are shipping an order to an
external customer. You can close the line short, you can use the original
customer order to process subsequent shipments, or you can create
a new customer order for the back-ordered quantities.

If you decide to create a new internal customer order for the back-ordered
quantities, the formal link between the purchase order and the sales
order is broken. This link is broken in the original purchase order,
original sales order, and in the new back order. The link is broken
to allow you maximum flexibility in processing the back order and
the original order. You can link the orders through the manual internal
buy/sell process. See [Creating
internal orders manually](Creating_Internal_Orders_Manually.md).

When you receive a partial shipment of an internal order, you have
the same options as when you receive a partial shipment of an external
order. You can leave the purchase order open, create a separate back
order, or close the purchase order short.

If you receive less than the shipped quantity and you are closing
the purchase order short, you are warned that quantities are still
in transit. You can change the quantity on the receipt to match the
quantity shipped, or you can continue to receive less than the shipped
quantity.

This table shows the effects of selecting each combination of options
when you ship and receive less than the quantity ordered:

| **Action taken during shipment** | **Internal link broken?** | **Action taken during receipt** | **Results** | **Next Steps** |
| Customer order closed short | No | Leave purchase order open, back order lines | The customer order is closed. The line is closed short. The internal link remains.    In the purchase order, the partial quantity is shown as received. The internal link remains. | To ship the remaining quantity, create a new internal customer order and use the original Purchase Order ID in the Customer PO ID field. When you receive the warning message about the purchase order being used on another order, click Yes. |
| Customer order closed short | No | Create separate purchase order backorder | The customer order is closed. The line is closed short. The Internal link remains.    In the original purchase order, the partial quantity is shown as received. The internal link remains. No formal internal link is made. | Link the backorder Purchase Order to a new sales order using the manual process. |
| Customer order closed short | No | Close purchase order short | Both the customer order and the purchase order are closed short. | No further actions required. |
| Leave sales order open, backorder sales order lines | No | Leave purchase order open, backorder lines | Original sales order remains open.    Original purchase order remains open. | Complete the shipment using the original sales order. |
| Leave sales order open, backorder sales order lines | No | Create separate purchase order backorder | Original sales order remains open.    Original purchase order is closed. Internal link remains on original purchase order.    Backorder purchase order is created. The original customer order ID is inserted into the Sales Order ID field on the backorder purchase order. | Complete the shipment using the original sales order and receive the shipment to the purchase order backorder. |
| Leave sales order open, backorder sales order lines | Depends on selection during Purchase Receipt Entry | Close purchase order short | When you save the purchase receipt, you can:     * Close the internal   sales order. * Leave the internal   sales order open, but remove the Internal link. You can   then close the sales order manually.     Original purchase order is closed. | To complete the shipment, create a new internal purchase order using the manual process. Ship the remaining quantity from the original sales order.    If you do not want to complete the shipment, no further actions are required if you selected the Close the internal sales order option. If you selected the Leave internal sales order open option, then manually close the sales order. |
| Create separate sales order backorder | Yes | Leave purchase order open, backorder lines | Original sales order is closed. Internal link removed. Sales back order created.    Original purchase order is open. Internal link removed. | Ship remaining balance using backorder sales order.    Receive remaining quantity to the original purchase order. |
| Create separate sales order backorder | Yes | Create separate purchase order backorder | Original sales order is closed. Internal link removed. Sales backorder created.    Original purchase order is closed. Internal link removed. Purchase backorder created. | Insert backorder Purchase Order ID in the Customer Purchase Order ID field on the backorder customer order.    Insert back order customer order ID in the Customer Order ID field on the backorder purchase order.    Ship remainder from the backorder sales order.    Receive remainder from the backorder purchase order. |
| Create separate sales order backorder | Yes | Close purchase order short | Original sales order is closed. Internal link removed. Sales backorder created.    Original purchase order is closed. Internal link removed. | To receive the remaining quantity, create a new internal purchase order using the manual process. Specify the Use the backorder customer order ID on the purchase order.    If you do not want to receive the remaining quantity, cancel the backorder customer order. |