Manually Creating a Move Request




# Manually Creating a Move Request

1. Select Inventory,
   Move Request.
2. In the header, specify
   this information:

Site ID If you
are licensed to use multiple sites, select the site where the parts
are located. If you are licensed to use a single site, this field
is unavailable.

Move Request ID
Specify an ID for the move request, or leave the field blank to
generate an ID based on auto-numbering settings after you save the
move request.

Status Select
one of these statuses:

Pending Use
this status if the move request is not complete. You can also use
this status to indicate that the parts are being prepared for pickup.
For example, if you know the pick-up location of the parts, but are
unsure of the drop-off location, you can use the Pending status to
begin creating the move request. Pending move requests cannot be selected
for pick up or delivery in the Material Handler Queue.

Loading Use
this status to indicate that the parts are being prepared for pickup.
Move requests with a status of Loading cannot be selected for pick
up or delivery in the Material Handler Queue.

Ready for Pick Up
Use this status to indicate that the parts are ready to be moved.
Move requests with a status of Ready for Pick Up can be selected for
pick up in the Material Handler Queue.

You cannot select the Picked Up or Delivered
status for a new move request. These statuses are applied to move
requests based on actions in the Material Handler Queue.

You cannot select Cancelled for a new move
request.

WIP Delivery Type
Specify the type of delivery you are requesting.

If the parts in the move requests are raw
materials or sub-assemblies that will be used in a work order, or
otherwise will not be permanently stored, select Drop Only. After
a Drop Only move request is delivered, three inventory transactions
are created: an adjust out from the pickup location, an adjust in
to the delivery location, and an adjust out from the delivery location.

If the parts will become part of your WIP
inventory, select WIP Inventory. After a WIP Inventory move request
is delivered, two inventory transactions are created: an adjust out
from the pickup location and an adjust in to the delivery location.

Request Type
This field is read-only. Manual is displayed in this field for manual
requests.

Priority If
this request should take priority over other requests, select this
check box.

Request by Emp ID
Specify the ID of the employee who submitted the move request.

Equip Type Click
the drop-down arrow and select the piece of equipment that the material
handler should use to move the parts. Set up equipment types in the
Move Equipment Type dialog box. See [Move
Equipment Types](Move_Equipment_Types.md).

Weight Specify
the total weight of the parts that are being moved, including packaging.

Weight U/M Specify
the unit used to measure the weight that you specified.

Container ID
Specify the ID of the container that contains the parts.

Comments Specify
any additional information about the move request.

3. Specify where the parts
   are currently located. If you selected Ready for Pickup in the
   Status field, you must specify a pickup location. Specify information
   in one or more of these fields:

Resource If
the parts are located at a shop resource, specify the ID of the resource.

Department If
the parts are located in a department, specify the ID of the department.

Warehouse If
the parts are located in a warehouse, specify the ID of the warehouse.

WIP Location
If the parts are located in a WIP location, specify the ID of the
location. If you specified a warehouse in the Warehouse field, the
WIP Location browse table is filtered to show the locations in the
warehouse that you selected. Set up WIP locations in Warehouse Maintenance.
See [WIP Inventory Locations](WIP_Inventory_Locations.md).

Directions Use
this field to provide directions to the pick up location.

4. In the Requested Pickup
   date and Time fields, specify when the materials should be picked
   up.
5. In the Employee ID field,
   specify the ID of the employee who will move the materials.
6. In the Deliver To Location
   section, specify where to move the parts. Specify information
   in one or more of these fields:

Resource To
move the parts to a shop resource, specify the ID of the resource.

Department To
move the parts to a department, specify the ID of the department.

Warehouse To
move the parts to a warehouse, specify the ID of the warehouse.

WIP Location
To move the parts to a WIP location, specify the ID of the location.
If you specified a warehouse in the Warehouse field, the WIP Location
browse table is filtered to show the locations in the warehouse that
you selected. Set up WIP locations in Warehouse Maintenance. See [WIP Inventory Locations](WIP_Inventory_Locations.md).

Directions Use
this field to provide directions to the drop-off location.

7. Click the Insert
   button.
8. Specify the parts to
   move:
9. If the request
   is related to a work order, click the Work
   Order ID browse button and select the work order. Then,
   click the Part ID browse button and
   select the part. You can select the header-level part or a material
   requirement.
10. If the request
    is not related to a work order, click the Part
    ID browse button and select the part.
11. Specify the quantity:
12. For standard,
    non-dimensional inventory, specify the quantity to adjust in the
    Quantity field.
13. For dimensional
    inventory, specify the number of pieces and the dimensions of
    the pieces. The quantity is calculated.
14. Click Save.