Using the Order Management Window Current




# Using the Order Management Window Current Customer Order Window

The Current Customer Order window contains the customer
order with which you are currently working. The primary purpose of
the six other Order Management window child windows is to serve the
needs of the current customer order. By using the other windows, you
can augment the typical order process by adding and editing information
and assigning quantities from other sources on the fly by dragging
n dropping and performing right mouse button operations.

To access this window from the VISUAL Order Management Customer
Order Entry window:

With an order open, select Current Customer Order
from the Tools menu.

To access this window from the Order Management window:

With an order open in the VISUAL Order Management Customer Order
Entry window, maximize the Order Management window and select Current Customer Order from the Tools menu.

The Current Customer Order window appears.

The following columns appear in the right pane of the window:

Line Number - The order line as it appears
in relation to the other lines, if any, in the order.

Part ID - The Part ID of the order line.

Status - The status of the order: A (active) or C (closed).

Order Quantity - The quantity of the part
on the order line.

Available Quantity - The quantity of on
hand stock that is available at the point of the order, but not necessarily
to the customer.

Customer Available Quantity- The quantity
of on hand stock that is available to the customer at the point of
the order. VISUAL determines this by the customers priority code
and disbursement fill rate. The disbursement fill rate, a number between
1 and 100, is the percent of available stock to which a customer has
access in order to meet order fulfillment requirements. If a customers
disbursement fill rate is 50, they have access to 50% of available
stock at the time of order fulfillment; if it is 100, they have access
to 100% of available stock at the time of order fulfillment. Establish
these values in Application Global Maintenance; set these per customer
in Customer Maintenance.

Allocated Quantity - The quantity that
you have allocated to the order line in order to fulfill its supply
requirements. If you immediately fill an order for 3,000 from inventory
stock, allocated quantity in this case equals 3,000.

Minimum Fill Quantity - The minimum of
the total order quantity that you must supply before VISUAL lets you
save the order. VISUAL determines this by a customer Order Fill Rate
- an number between 1 and 100 equal to the percent of the order line
quantity that you must fulfill. If a customer Order Fill rate is 22,
then you must fill 22% of the order quantity as the minimum requirement.
Establish these values in Application Global Maintenance; set these
per customer in Customer Maintenance.

Shipped Quantity - The quantity of the
order to the current date that you have shipped to the customer

Last Shipped Date - The date on which
you last shipped an order to the customer

Amount Ordered - The dollar amount of
the order line.

Amount Shipped - The dollar amount of
what you have shipped from the order line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Current_Customer_Order_Information.md) Viewing Current Customer Order Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Sources_of_Supply_for_the_Current_Customer_Order.md) Viewing Sources of Supply for the Current
Customer Order

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.md) User-defined Help