Viewing Expected/Committed Part Information




# Viewing Expected/Committed Part Information

With the Part Information child window open, double-click
the Part Info icon, double click the Part Availability icon, double-click the Part ID, and then double-click a warehouse from
the warehouses that appear. Committed and Expected part information
appears. Select a category.

If you select Committed, the following detail information appears
in the right pane. Committed parts are parts in customer orders (CO),
customer order delivery schedules (CD), and material requirements
(RQ). VISUAL represents In Stock committed orders with a solid green
icon. Committed orders with a status of In Stock are ready for shipment;
a sufficient quantity exists to fill the order. VISUAL represents
Future committed order with an empty green icon.

Committed Orders with a status of Future are not ready for shipment
yet; supply for these orders is coming from a incomplete work order
or an un-received purchase order.

Demand ID - The ID of the customer order.
VISUAL considers quantities in customer orders committed quantities.

Order Date - The date of the customer
order.

Customer ID - The customers ID. You can
only view committed part information for the current customer.

Customer Priority - The customers Order
Fill Rate. Choose an Order Fill Rate for a customer in Customer Maintenance.
An Order Fill Rate is a number between 0 and 100 that indicates the
minimum percentage of the Quantity Ordered the customer will accept.
For example, an order fill rate of 100 for a customer order line for
1,000 parts, indicates that the full order quantity must be allocated
before the customer will accept the order; an order fill rate of 80
for a C/O line of 1,000, indicates that 80% of the Order Quantity
must be allocated before the customer will accept the order. Minimum
Fill Rates for C/O lines appear in the Customer Order Entry line item
table in the Min Fill Rates column.

Order Type - The type of order. Possible
types are CO, CD, and RQ.

Stock Status - The stock status of the
customer order. If the part is in stock, the status is In Stock; if
the part is not in stock the status is Out of Stock.

Order Quantity - The quantity of the customer
order.

Received - The quantity of the part received
into the warehouse.

Allocated - The quantity allocated to
the customer order from inventory supply, a purchase order, a purchase
order delivery schedule, or a work order.

Unallocated Quantity - The quantity of
the customer order line for which youve yet to acquire supply.

For Expected orders, the following detail information appears in
the right pane. VISUAL uses a solid blue icon to represent expected
orders. Expected orders are work orders (WO), purchase orders (PO),
and purchase order delivery schedules (PD), and interbranch transfers
(WH). All Expected orders have a status of Future.

Supply ID - The ID of the purchase order
or work order. VISUAL considers quantities in purchase orders and
work orders expected quantities.

Order Date - The date of the purchase/work
order.

Order Type - The type of order, either
Work Order (WO) or Purchase Order (PO).

Stock Status - The stock status of the
purchase/customer order. If the part is in stock, the status is In
Stock; if the part is expected sometime in the future, the status
is Future.

Order Quantity - The quantity of the purchase/work
order.

Received - The quantity of the order you
have received into the warehouse.

Allocated - The quantity of the purchase/work
order allocated to supply.

Unallocated Quantity - The quantity of
the purchase/work order line which you have yet to allocate to supply.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Expected_Committed_Part_Information_for_Customer_Orders.md) Customer Orders

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Expected_Committed_Part_Information_for_Interbranch_Transfers.md) Interbranch Transfers

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Expected_Committed_Part_Information_for_Work_Order_Material_Requirements.md) Work Order Material Requirements