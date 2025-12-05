Working with Order Statuses




# Working with Order Statuses

When you create a customer order, you specify an order status on
the header and on the order lines.

You can use these statuses:

Released The order is eligible for fulfillment.

Firmed The order is not yet eligible
for fulfillment, but is expected to be released.

On Hold The order has been placed on
hold and is not currently eligible for fulfillment.

Cancelled/Void The order has been rescinded
by you or the customer.

Closed The order is complete.

Inherit This status can be used on order
lines only. An order line with a status this status inherits the status
of the header.

Use the status on the header to manage lines that have a status
of Inherit. When a line has a status of Inherit, the line inherits
the status that you specify on the header. For example, if a line
has a status of Inherit and the header has a status of Released, then
the line is considered to be Released.

To manage each order line individually, assign the line a status
that is not inherit. When an order line has a specific status, such
as On Hold, then the status on the order header is ignored.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Changing_the_Status_of_the_Order_Header.htm) Changing the Status of the Order Header

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Shipments_and_Line_Statuses.htm)
Shipments and Line Statuses