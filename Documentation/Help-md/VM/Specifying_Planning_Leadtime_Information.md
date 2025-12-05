Specifying Planning/Leadtime Information




# Specifying Planning/Leadtime Information

|  |  |
| --- | --- |
| POSTIT.gif | Before reading this section, be aware that the column PLANNING\_LEADTIME in the REQUIREMENT table is different from the column PLANNING \_LEADTIME in the PART table. The VISUAL Concurrent Scheduler uses the column PLANNING\_LEADTIME in the REQUIREMENT table exclusively during material checks. |

Use the Planning Leadtime field to override a parts planning leadtime
at the requirement level. The scheduler uses the planning leadtime
override at the material requirement level during material checks.

Also, you can enter planning leadtimes for non-part requirements.
The scheduler uses the planning leadtime override at the material
requirement level during material checks.

Because this field is an override field, VISUAL does not populate
the field with the materials default planning leadtime from Part
Maintenance. The VISUAL Concurrent Scheduler uses the default planning
leadtime from Part Maintenance if this field is null at the requirement
level.

1. Click the Planning
   tab.
2. Enter information into
   the following fields as follows:

Planning Lead-time
The lead-time is the number of days required to replenish parts
(manufacture time, delivery days, etc.) The scheduler uses this information
when it tries to schedule material availability.

Location ID -
If appropriate, select an auto-issue Location ID from the list box.
This is the warehouse location from which you want to auto-issue this
material.

The warehouse location must carry this part.
Use [Warehouse Maintenance](Adding_a_Part_to_a_Location.htm)
to add parts to warehouse locations. Also, only auto-issue locations
are eligible for selection.

The following read-only fields also appear
in the window.

Required Date
- The required date is the date on which the VISUAL Concurrent Scheduler
determines the material requirement is required. Before you run the
scheduler, VISUAL fills the field with the work orders Release Date.

Several factors influence how VISUAL arrives
at the date. If you specify that the VISUAL Concurrent Scheduler forward
schedule the work order from release date or that the release date
is hard, you may receive a different date than if you permit the normal
backwards scheduling scenarios to run.

Calculated Quantity
- The quantity of the material needed to fulfill the material requirement
is displayed. You must change the status of the work order to Released
before quantities are recalculated and this value is displayed.

For non-piece tracked parts, the calculated
quantity is the Work Order or Leg Header Quantity \* ((1 + Scrap %)
\* Qty Per) + Fixed Quantity) \* Dimensions. If the Usage U/M is different
from the Stock U/M, the quantity is converted to the Stock U/M. This
value is rounded up to the next whole number.

If the material requirement is for a piece
tracked part, then the calculation made for this field depends upon
the CalcQtyByPieces setting in Preferences Maintenance. If this setting
is set to Y, then the calculated quantity is equal to the Calculated
Piece Qty. If this setting is set to N, then  the calculated
quantity is equal to the actual quantity used in the work order. See
[Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.htm).

Issued Quantity
- The quantity of the material you have issued thus far to satisfy
the requirement. When the Issued Quantity matches the Calculated Quantity,
you have fully met the material requirement.

Allocated Quantity
- The quantity you have issued to the material requirement from any
one or multiple sources of supply. Types of supply include (CP) Coproducts,
(I) Inventory, (PD) Purchase Order Delivery Schedules, (PO) Purchase
Orders, (WH) Interbranch Transfers, and (WO) Work Orders.

Use the Edit menu option [Allocate
Supply to this Material](Allocating_Supply_to_Work_Order_Material_Requirement_Demand_.htm) to allocate quantities to a work order
material requirement.

Fulfilled Quantity
- After you have allocated a quantity to a material requirement, you
must, depending on which supply type you specified - issue/receive
the quantity from the source of supply (the 6 supply types above)
to the material requirement. Before supply arrives and is available
for use on the work order, it is considered allocated; upon reception/issue,
it becomes a fulfilled quantity.

After a requirement receives the allocated
quantity, VISUAL populates the Fulfilled Quantity field with the appropriate
amount. For example, if you allocate an un-received purchase order
line with a quantity of 200 to a work order material requirement,
the Planning tab would display an Allocated Quantity of 200, but a
Fulfilled Quantity of 0; after you receive the purchase order into
the appropriate warehouse using Purchase Receipt Entry, the Fulfilled
Quantity on the Planning tab would then display 200, as the allocated
quantity - the conditional source of supply until now - is real, in
the warehouse and fulfilling its purpose of supplying the requirement.

Calculated # of Pcs
A value is displayed in this field only if this requirement is a
piece tracked part. To determine the value in this field, the total
amount of part needed to meet this requirement is divided by the size
of one material piece. The value is rounded up to the next whole number
and inserted in this field. If you place a purchase order for this
requirement, the value in this field is inserted in the # Pieces column
on the purchase order line. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.htm).

Calculated Piece Qty
A value is displayed in this field only if this requirement is a
piece tracked part. To determine the value in this field, the Calculated
# of Pcs is multiplied by the size of one material piece. If you place
a purchase order for this requirement, this value is inserted in the
Quantity field on the purchase order line. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.htm).

3. Click the Save
   button to commit location lead-time information to this material
   requirement.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help