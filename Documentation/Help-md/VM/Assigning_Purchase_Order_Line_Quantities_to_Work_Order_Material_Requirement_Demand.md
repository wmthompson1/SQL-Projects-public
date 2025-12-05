Assigning Purchase Order Line Quantities to Work Order Material Requirement Demand




# Assigning Purchase Order Line Quantities to Work Order Material Requirement Demand

1. Highlight the purchase
   order line from which you want to assign order quantities to demand
   and select Assign to Demand from the
   Edit menu.

The Assign to Demand dialog box appears.

The following read-only information appears
in the dialog box header section.

Order ID/Line #
- The Order ID of the current purchase order; the number of the purchase
order line as it appears in the purchase order.

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

2. From the Type list box,
   select RQ.
3. Double-click <Demand
   Base ID> to search for work order material requirements
   to which you can assign purchase order line quantities.

The dialog box that appears contains all
the work orders currently in your database. Besides this list being
perhaps too long to scroll through, selection is arbitrary at this
point because you may select a work order that has a different Part
ID or Warehouse ID than the current purchase order line, and these
two IDs must be the same in both in order to establish a demand link.

To avoid selecting work orders at random,
double-click <Seq #/Line #> to view
only those work orders in your database with the required Part ID
and Warehouse ID.

4. Highlight the work order
   that contains the material requirement to which you want to allocate
   purchase order line quantities and click the Ok
   button.

The work order appears in the Assign to
Demand dialog box line item table.

5. Double-click <Seq
   #/Line #> to search for eligible material requirements
   within the work order.

The Work Order Material Requirement Demand
dialog box appears.

Select the Requirements
with Unallocated Demand Only box if you want only work order
material requirements to which you have not already fully allocated
supply searched for.

Select the Requirements
for the Same Part Only box if you want only those material
requirements with the same Part ID as the purchase order line searched
for.

Enter dates in the Starting
Date and Ending Date fields for the
search. Select how you want the results of its search sorted.

6. Click Apply
   to execute the search.
7. Depending on how you
   configured the search, all qualifying material requirements appear
   in the line item table.

Select the appropriate line and click Ok.

The work order material requirement appears
in the Assign to Demand dialog box line item table.

8. In the Allocate
   Quantity column, enter what portion of the purchase orders
   Available Quantity you want to assign
   to this work order material requirement.
9. Click Save
   to commit the allocation of purchase order line supply to work
   order material requirement demand.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Work_Order_Material_Requirement_Demand_Allocation_Information_for_a_Purchase_Order_Line_Item.htm) Viewing Work Order Material Requirement
Demand Allocation Information for a Purchase Order Line Item

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help