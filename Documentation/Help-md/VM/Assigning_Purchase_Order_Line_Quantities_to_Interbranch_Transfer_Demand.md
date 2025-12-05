Assigning Purchase Order Line Quantities to Interbranch Transfer Demand




# Assigning Purchase Order Line Quantities to Interbranch Transfer Demand

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

2. Click Insert
   to begin adding line item demand information.
3. From the Type list box,
   select WH.
4. Double-click <Demand
   Base ID> or <Seq #/Line #>
   to search for IBTs to which you can assign quantities from the
   current purchase order..

The Interbranch Transfer Demand dialog box
appears.

If no qualifying IBT line items appear,
configure a search by selecting or clearing the boxes in the Options
section and entering dates between which you want IBT lines searched
for. Click the Apply button to execute the
search.

5. Select the IBT line
   to which you want to allocate purchase order quantities and click
   the Ok button.

The IBT line item appears in the Assign
to Demand dialog box line item table.

6. Enter a value in the
   Allocate Quantity column. This value
   cannot be greater than the Available Quantity of the purchase
   order line or the Demand Unallocated Quantity
   of the IBT line.
7. Click Save
   to commit the allocation of purchase order quantities to the interbranch
   transfer.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_IBT_Demand_Allocation_Information_for_a_Purchase_Order_Line_Item.htm) Viewing IBT Demand Allocation Information
for a Purchase Order Line Item

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help