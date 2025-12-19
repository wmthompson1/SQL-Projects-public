Viewing Work Order Demand Allocation Information




# Viewing Work Order Demand Allocation Information

You can view what quantity of a work order you have
allocated to demand and which quantities you still have available
to allocate.

With the work order for which you want to view demand allocation
information displaying in the Inventory transaction window, select
Allocate Demand to this Work Order from the Edit menu.

The Assign to Demand dialog box appears.

The line item table contains the following information:

Type - The Type ID of the demand link.
Possible types include: CD (Customer Order Delivery Schedule); CO
(Customer Order); I (Inventory); RQ (Work Order Material Requirement);
and WH (Interbranch Transfer)

Demand Base ID - The ID of the above type.
For example, if this demand link is to a customer order, the ID of
the customer order appears here.

Lot ID - If the demand link is to a material
requirement (Type RQ), the Lot ID of the work order to which this
material requirement belongs appears here.

Split ID - If the demand link is to a
material requirement (Type RQ), the Split ID of the work order to
which this material requirement belongs appears here.

Sub ID - If the demand link is to a material
requirement (Type RQ), the Sub ID of the work order to which this
material requirement belongs appears here.

<Seq #/Line #> - If the demand link
type is a material requirement, the sequence # of the material in
the work; if the demand link type is a customer order delivery schedule
(CD), a customer order (CO), or a interbranch transfer (WH), the line
as it appear in the appropriate order.

Piece # - If the demand link is a customer
order delivery schedule, the number of the delivery schedule line
in the delivery schedule.

Demand Required Date - The required date
of the demand source. See Demand Base ID.

Allocate Quantity - The quantity that
you have allocated to the demand source.

Demand Unallocated Quantity - The portion
of the Demand Quantity to which you have yet to allocate supply.

Demand Quantity - The quantity of the
Demand Base ID. If the Demand Base ID is a customer order, the quantity
of the customer order.

Supplied Quantity - The portion of the
Demand Base ID that you have shipped.

Link Allocated Quantity - For this line,
the quantity you have allocated to the Demand Base ID.

Link Received Quantity - For this line,
the quantity that the Demand Base ID has received.

Link Issued Quantity - For this line,
the quantity you have issued to the Demand Base ID.

Demand Part ID - The ID of the part you
have allocated to the Demand Base ID.

Substitute Part - If the part has a substitute
part, VISUAL selects this check box.

New Part Warehouse - VISUAL selects this
check box if this warehouse is a new part warehouse.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help