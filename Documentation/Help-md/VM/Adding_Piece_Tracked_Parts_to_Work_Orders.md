Adding Piece Tracked Parts to Work Orders




# Adding Piece Tracked Parts as Material Requirements

To add a piece-tracked part as a material requirement:

1. Select Eng/Mfg,
   Manufacturing Window.
2. Open the work order.
3. Follow the standard
   procedure for adding a material card. See [Adding
   Material Requirements](VMMFGWINfrmMaterial.md). In the Part ID field, specify the ID
   for a piece tracked part.
4. On the Quantities tab,
   specify this information:

Qty Per Specify
the quantity required to make one unit of finished product. Use the
Qty Per (Start Qty) button to specify Quantity Per based on the amount
needed per incoming material. Use the Quantity Per (End Qty) button
to specify Quantity Per based on the amount needed per unit of outgoing
master (the End Quantity).

Fixed Qty Specify
the fixed material requirement quantity. A fixed material quantity
is a quantity of material required one time, regardless of work order
quantity. This could be fixed scrap caused by setup or test, or could
be any material required to produce the parent part.

Scrap % Specify
the percentage of material lost to scrap. This percentage is added
to the base quantity required to make up for the loss.

Length, Width, and Height
Specify the dimensions of one piece of this material requirement.
If a particular dimension is not required, the field is not available.
Specify the dimensions in the unit of measure displayed in the Usage
U/M field.

5. On the Planning tab,
   review this information:

Required Date
The required date is the date on which the Concurrent Scheduler
determines the material requirement is required. Before you run the
scheduler, the field is filled with the work orders Release Date.

Several factors influence how the date is
determined. If you specify that the Concurrent Scheduler forward schedule
the work order from release date or that the release date is hard,
you may receive a different date than if you permit the normal backwards
scheduling scenarios to run.

Calculated Quantity
The quantity of the material required according to the work order
is displayed. You must change the status of the work order to Released
before quantities are recalculated and this value is displayed.

For piece tracked parts, the calculation
made for this field depends upon the CalcQtyByPieces setting in Preferences
Maintenance. If this setting is set to Y, then the calculated quantity
is equal to the Calculated Piece Qty. If this setting is set to N,
then  the calculated quantity is equal to the actual quantity
used in the work order. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.md).

Issued Quantity
The quantity of the material you have issued thus far to satisfy
the requirement. When the Issued Quantity matches the Calculated Quantity,
you have fully met the material requirement.

Allocated Quantity
The quantity you have issued to the material requirement from any
one or multiple sources of supply. Types of supply include (CP) Coproducts,
(I) Inventory, (PD) Purchase Order Delivery Schedules, (PO) Purchase
Orders, (WH) Interbranch Transfers, and (WO) Work Orders.

Fulfilled Quantity
After you have allocated a quantity to a material requirement, you
must, depending on which supply type you specified, issue/receive
the quantity from the source of supply (the 6 supply types above)
to the material requirement. Before supply arrives and is available
for use on the work order, it is considered allocated; upon reception/issue,
it becomes a fulfilled quantity.

After a requirement receives the allocated
quantity, the Fulfilled Quantity field is populated with the appropriate
amount. For example, if you allocate an unreceived purchase order
line with a quantity of 200 to a work order material requirement,
the Planning tab would display an Allocated Quantity of 200, but a
Fulfilled Quantity of 0. After you receive the purchase order into
the appropriate warehouse using Purchase Receipt Entry, the Fulfilled
Quantity on the Planning tab would then display 200, as the allocated
quantitythe conditional source of supply until nowis real, in the
warehouse and fulfilling its purpose of supplying the requirement.

Calculated # of Pcs
A value is displayed in this field only if this requirement is a
piece tracked part. To determine the value in this field, the total
amount of part needed to meet this requirement is divided by the size
of one material piece. The value is rounded up to the next whole number
and inserted in this field. If you place a purchase order for this
requirement, the value in this field is inserted in the # Pieces column
on the purchase order line. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.md).

Calculated Piece Qty
A value is displayed in this field only if this requirement is a
piece tracked part. To determine the value in this field, the Calculated
# of Pcs is multiplied by the size of one material piece. If you place
a purchase order for this requirement, this value is inserted in the
Quantity field on the purchase order line. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.md).

6. Complete the information
   on the Material card.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Dimensional_Inventory.md) User-defined Help