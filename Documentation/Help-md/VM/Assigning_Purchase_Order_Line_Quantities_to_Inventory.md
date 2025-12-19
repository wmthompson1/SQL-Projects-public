Assigning Purchase Order Line Quantities to Inventory




# Assigning Purchase Order Line Quantities to Inventory

1. Highlight the purchase
   order line from which you want to assign order quantities to demand
   and select Assign to Demand from the
   Edit menu.

The Assign to Demand dialog box appears.

The following read-only information appears
in the dialog box header section.

Order
ID/Line # - The Order ID of the current purchase order;
the number of the purchase order line as it appears in the purchase
order.

Order Qty - The
quantity of the specified part in the purchase order line. Also, the
quantity available to you to assign to demand.

Received Qty -
The quantity of the purchase order line item that you have received.
Unless you are reopening this purchase order after receiving partial
quantities at an earlier time, this value should be zero.

Allocated Qty
- The portion of the Order Quantity/Available Quantity that you have
allocated to demand.

Fulfilled Qty
- The quantity that has been fulfilled from the supplying source.

Available Qty
- The quantity of the purchase order that you have yet to allocate
to demand sources. Before you begin to establish demand links, this
value is equal to the Order Quantity of the purchase order line.

Part ID - The
ID of the part in the current purchase order line.

Warehouse ID -
The ID of the warehouse for the current purchase order line. Any demand
link you establish must also have this Warehouse ID. If you attempt
to establish a link to a potential demand link does not have this
same Warehouse ID, you cannot continue.

Desired Receive Date
- The date by which you want to receive the current purchase order
line.

Promised Date
- The date by which the vendor promised delivery of the current purchase
order line.

Purchase U/M -
If the part is a purchased part, the unit of measure you set in Part
Maintenance.

2. Click Insert
   to begin adding line item demand information.
3. From the Type list box,
   select I.
4. Double-click <Demand
   Base ID> to view a list of the warehouses that currently
   carry the purchase order Part ID.

The Warehouses for Part dialog box appears.

The line item table also contains the following
columns:

Available Quantity
- Quantities of parts that are currently available at the warehouse
or one of its locations for allocation or shipment. Allocation to
orders decreases this quantity, acknowledgment of a receipt increases
this quantity, and adjustments to stock may either increase or decrease
this value.

Committed Quantity
- Quantities of parts that you have committed through allocation or
order fulfillment. As this value increases, the Available
Quantity decreases. Though these parts may still be in the
warehouse, they are "committed" as supply.

Expected Quantity
- Quantities of parts that you expect to receive from incoming purchase
orders, work orders, and interbranch transfers.

Expected Committed Quantity
- Quantities of parts that you expect to receive from incoming purchase
orders, work orders, and interbranch transfers and then commit through
allocation.

5. Highlight the warehouse
   to which you want to allocate the purchase order line quantity
   and click the Ok button.

The selected warehouse information appears
in the Assign to Demand dialog box line item table.

6. In the Allocate
   Quantity column, enter what quantity of parts you want
   to assign from the purchase order line to the warehouse. This
   value cannot be greater than the Available
   Quantity of the purchase order line.
7. Click Save
   to commit the allocation of the purchase order quantity to inventory.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Inventory_Demand_Allocation_Information_for_a_Purchase_Order_Line_Item.md) Viewing Inventory Demand Allocation
Information for a Purchase Order Line Item

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.md) User-defined Help