Viewing Customer Order Status




# Viewing Customer Order Status

Just as Material Availability provides complete information
on the supply side of a work order, Customer Order Status provides
comprehensive information on customers orders that are linked to this
work order. This linkage may have occurred through Customer Order
Entry, or by placing a work order through Material Planning Window.
One or more customer orders could be linked to the current work order.

To view customer order status information, select Customer
Order Status from the Info menu.

The Customer Order Status dialog box appears.

## The following information appears in the dialog box:

Total Production Ordered - The Desired
Quantity of the work order, irrespective of linked customer orders.

Total Production Received - The total
quantity of the work order received to finished goods, irrespective
of customer shipments.

Total Order Quantity - The total quantity
of all customer order line items linked to this work order.

Total Shipped Quantity - The total quantity
of all linked line items that has been shipped against the orders.

The table contains one line for each customer order line linked
to the work order. Most of the important information from the order
line is shown:

Order ID, Line # - The Order ID and line
number from the customer order.

Customer ID - The customer ordering the
material.

Misc Ref. - The reference description
from the order line. Usually shows part description.

Customer Part ID - The customers reference
for the part, if available.

Order Quantity - Order Quantity from the
order line item.

Shipped Quantity - The quantity shipped
against this line item.

Status - The status of the customer order
line:

Released is displayed if one of these conditions is met:

* The customer order line
  has a status of Released
* The customer order header
  has a status of Released and the customer order line has a status
  of Inherit.

Firmed is displayed if one of these conditions is met:

* The customer order line
  has a status of Firmed
* The customer order header
  has a status of Firmed and the customer order line has a status
  of Inherit.

On hold is displayed if one of these conditions is met:

* The customer order line
  has a status of On Hold
* The customer order header
  has a status of On Hold and the customer order line has a status
  of Inherit.

Closed is displayed if one of these conditions is met:

* The customer order line
  has a status of Closed
* The customer order header
  has a status of Closed and the customer order line has a status
  of Inherit.

Cancelled is displayed if one of these conditions is met:

* The customer order line
  has a status of Cancelled
* The customer order header
  has a status of Cancelled and the customer order line has a status
  of Inherit.

Ship On - The Desired Ship Date for the
order line.

Shipped Date - Actual Ship Date from the
packlist for the shipped line.

Promise Date - The date on which you promised
to deliver the customer order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help