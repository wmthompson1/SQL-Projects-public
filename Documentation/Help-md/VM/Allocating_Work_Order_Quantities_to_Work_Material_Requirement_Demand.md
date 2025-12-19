Allocating Work Order Quantities to Work Order Material Requirement Demand




# Allocating Work Order Quantities to Work Order Material Requirement Demand

1. In the Manufacturing
   window, point to the red material requirement card to which you
   want to allocate supply.
2. From the Edit menu,
   select Allocate Supply to this Material/Service.
   The Supply Links dialog box appears.

The following information appears in the
header section. Use these fields as a quick reference when establishing
supply links to work order material requirements.

Quantity Required
- The quantity of the material requirement.

Quantity Issued
- The quantity of the material requirement that you have issued from
inventory. If this quantity is equal to the Quantity Required, further
supply is unnecessary. In this case, all of the material's requirements
have been met - the only requirement being quantity.

Quantity Allocated
- The quantity that you have allocated from the supplying sources
towards meeting this material requirement. If this quantity is equal
to the Quantity Required, further supply is unnecessary.

Quantity Fulfilled
- The quantity of the material requirement that has been fulfilled
by supply.

Quantity Unallocated
- The quantity of this material requirement to which you have yet
to allocate supply.

Part ID - The
Part ID of this material requirement.

Part Description
- The description of this part, also the material requirement.

Stock U/M - The
stock unit of measure of the part.

Warehouse ID -
The Warehouse ID of the material requirement; also, the warehouse
in which you house it; also the point from where you are issuing it.

Required Date
- The date before which or on which you need the material requirement.

3. Click the Insert
   button to begin establishing supply links.
4. From the Type
   list box, select WO.
5. Double-click <Supply
   Base ID> to view a list of all the work orders in your
   database. The Work Orders dialog box appears. Select only those
   work orders with a Part ID that is the same as the work order
   material requirement to which you are currently assigning supply
   quantities.
6. Select an appropriate
   work order and click the Ok button.
   The work order line appears in the Supply Links dialog box line
   item table.
7. In the Allocate Quantity
   column, enter the quantity that you want to allocate from the
   work order quantity to the current work order material requirement
   quantity.

This quantity cannot be greater than the
Quantity Unallocated of the material requirement
or the Supply Quantity >of the work order
line. If you attempt to enter a quantity here that will result in
the over-allocation of supply to the material requirement (A number
greater than the Quantity Unallocated) or the use of more Supply Quantity
than is available (A number greater than the Supply Quantity), you
are warned that this is not possible.

8. Click the Save
   button to commit the link of supply from the work order to the
   current work order material requirement.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help