Allocating Supply to a Customer Order Line in the VISUAL Order Management Customer Order Entry Window




# Allocating Supply to a Customer Order Line in the VISUAL Order Management Customer Order Entry Window

Allocation Depends on Two Settings:

Customer Order fulfillment depends on a customers disbursement
fill rate and minimum fill rate.

A customers disbursement fill rate dictates the percentage of available
stock in the selected warehouse to which the customer has access.
Set this value, a number between 0-100, in Customer Maintenance by
selecting the appropriate Priority Code for the customer. Within priority
codes is the "fill rate" value. This "fill rate"
appears in the Disbursement Fill rate column in Customer Maintenance
under the Order Management tab.

Establish Priority Codes in Accounting Entity Maintenance's Order
Mgmt tab.

A customers minimum fill rate dictates the percentage of the order
quantity that you - the supplier - must at least account for before
you can accept the customer order. Set this value, a number between
0-100, in Customer Maintenance in the Order Fill Rate field under
the Order Management tab.

How you account for this minimum is the question.

For every customer order line, if there is sufficient quantity in
the customers primary warehouse, the needed supply to the customer
order line is automatically assigned, or, hard allocated.

For example, if you enter an order line quantity of 500, and you
have sufficient supply - say 50,000 on hand parts, of which 20,000
are available - in your primary warehouse, the part from the warehouse
is automatically assigned to the customer order line. If an insufficient
quantity is found in your primary warehouse, it does not automatically
assign supply. At this point, you can use a substitute part or a cross-selling
part in the focus parts place; you can also assign supply from another
source.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Allocated_Quantities_for_a_Customer_Order_Line.md) Viewing Allocated Quantities for a Customer
Order Line

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.md) User-defined Help