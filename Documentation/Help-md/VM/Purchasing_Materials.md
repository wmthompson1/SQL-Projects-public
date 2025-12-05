Purchasing Materials for Work Orders




# Purchasing Materials for Work Orders

You can purchase a material from the Manufacturing Window.

1. Open the Purchase Material
   dialog box by either:

* Selecting
  the material requirement from the Manufacturing Window and choose
  Purchase This Material/Service from
  the Edit menu.
* Placing a
  PO in the Material Availability window by selecting a requirement
  line and choosing Purchase This Material/Service from the Edit
  menu.

The Purchase Material dialog box appears.
The Work Order ID, Operation Sequence Number, Piece Number, and Net
Quantity Required of the material appear in the table at the upper
left.

2. This information about
   quantities is displayed next to the table:

Reqd Qty This
is the quantity needed to fulfill the material requirement. For non-piece
tracked parts, this quantity is equal to the Calculated Quantity field
on the Planning tab of the Material Card. For piece tracked parts,
this quantity is equal to the Calculated Piece Qty field on the Planning
tab of the Material Card. This is true for piece tracked parts even
if you use the actual quantity used calculation for the Calculated
Quantity field. See [Calculated
Quantity Values for Piece Tracked Parts](Calculated_Quantity_Values_for_Piece_Tracked_Parts.htm).

Addl Qty This
field is available only if you are purchasing a non-piece tracked
part. Specify the additional quantity you require in the Addl Qty
field. Order Quantity is equal to Required Quantity + Additional Quantity.

Reqd Pcs This
field is used only if you are purchasing a piece-tracked part. This
is the total number of whole pieces needed to fulfill the material
requirement. This value is equal to the Calculated # of Pcs field
on the Planning tab of the Material card.

3. Specify requirement
   linking.

You may wish to link the purchase directly
to the material requirement. This marks the purchase for the job,
and enables automatic issuing of the material when it is received.

The Link to Each Requirement check box is
checked by default. If you do not wish to link the purchase to this
job, uncheck this box.

If you are unsure of which purchase orders
may already be linked, you can select the work order requirement from
the upper table, and any existing linked POs for this requirement
are listed in the table at the bottom of the screen. Additionally,
the Total Quantity Required and Total Quantity Issued for the requirement
appear. This allows you to assess what quantities have already been
purchased to the job, and which are still needed.

4. Click the Order
   button to place the order.

Purchase Order Entry is automatically started.
The preferred vendor for the part or the Vendor ID specified in the
requirement is used for the PO. If you are linking to the requirement,
one PO line item is created for the requirement, and an additional
line item is created for any additional quantity ordered. If you are
not linking to the requirement, then a single line item is created.
Receive Date for all items default to the Required Date for the material
requirement.

You can edit any or all of the information
in this order. To place the order press Save.
To cancel without placing the order, Close
the Purchase Order Entry window.

You can build a purchase order for multiple
requirements purchased from the same vendor. After making the first
purchase, leave the Purchase Order Entry window open. Each time you
use Purchase This Material/Service, VISUAL adds a line to the current
purchase order, rather than creating a new one. When finished, Click
the Save button and use the Clear option
to ready the Purchase Order Entry screen for any other orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help