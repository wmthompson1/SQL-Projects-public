Calculated Quantity Values for Piece Tracked Parts




# Calculated Quantity Values for Piece Tracked Parts

If you use piece tracked parts as material requirements, you can
choose how to determine the quantity in the Calculated Value field
on the Material card. The Calculated Value field is used to determine
the actual quantity of the material requirement and the cost of the
material in the work order. Specify your choice in Preferences Maintenance.
Your choice is particularly important if you specify a scrap percentage
or fixed quantity for materials.

To make your decision, it is important to understand how material
quantities are calculated for piece tracked parts. These calculations
are made:

1. The size of the material
   requirement piece is calculated. To calculate the size of each
   piece, the dimensions specified on the Material Requirements card
   are multiplied. If the usage unit of measure is different from
   the stock unit of measure, the dimensions are multiplied by the
   conversion factor:

Length \* Width \* Height \* Conversion Factor

2. After the size of the
   piece is determined, the total amount required for the work order
   is calculated:

Work Order or Leg Header Quantity \* ((1
+ Scrap %) \* Qty Per) + Fixed Quantity) \* Dimensions \* the conversion
factor between the usage unit of measure and the stock unit of measure

This is the quantity of material actually
used for the work order.

3. To determine the number
   of pieces needed to meet the requirement, the total quantity required
   for the work order is divided by the size of the material requirement
   and then rounded up to the next whole number:

Total amount required/piece size, rounded
the next whole number

The result of these calculations is inserted in the Calculated #
of Pcs field on the Planning tab. To determine the value in the Calculated
Piece Qty field, the Calculated # of Pcs is multiplied by the piece
size.

The value used for the Calculated Qty field is determined by the
CalcQtyByPieces preference setting in Preferences Maintenance:

* CalcQtyByPieces=Y
  If you choose this option, then the Calculated Value field is
  equal to the Calculated Piece Quantity. If you choose this option,
  then the whole number of pieces is the total requirement. This
  is the default option.
* CalcQtyByPieces=N
  If you choose this option, then the Calculated Value field is
  equal to the actual amount used for the work order.

## Example

Presume you have a work order with these parameters:

Work Order Header Qty: 5

Material Card Qty Per: 1

Scrap Percentage: 25%

Dimensions: 100 length \* 45 width

Usage U/M: Square Inches

Stock U/M: Square Feet

1. Calculate the size of
   the material requirement piece by multiplying the dimensions and
   the conversion factor between the usage u/m and stock u/m:

100 \*45 \* 0.006944 = 31.25

The size of the material requirement piece
is 31.25 square feet. When you purchase quantities for this work order,
the piece is purchased in multiples of 31.25.

2. Calculate the total
   required for the work order by multiplying the quantity on the
   work order header by the total amount required on the material
   requirement card. The value is converted to the stock unit of
   measure:

5 \* ((1 + 0.25) \* 1) + 0) \* (100 \* 45) \*
.006944 = 5 \* 1.25 \*4500 \* .006944 = 195.30

This is the quantity you actually use in
the work order.

3. Calculate the number
   of pieces required by dividing the total required for the work
   order by the size of the piece and rounding up to the next whole
   number:

195.30/31.25 = 6.25, rounded up to 7

On the Planning tab of the material requirement card, these values
are used:

Calculated # of Pieces 7

Calculated Piece Qty This value is equal
to the Calculated # of Pieces multiplied by the piece size:

7 \* 31.25 = 218.75

Calculated Qty The value used in this
field is determined by the CalcQtyByPieces preference in Preference
Maintenance. If the preference is set to Y, then this value in equal
to the Calculated Piece Qty. In this example, the value is 218.75.
If the preference is set to N, then this value is equal to the total
required for the work order. In this example, the value is 195.30.

## Specifying the CalcQtyByPieces Preference Setting

To specify the CalcQtyByPieces preference setting:

1. Select Admin,
   Preferences Maintenance.
2. Click the Insert
   button.
3. Specify this information:

Section Specify
Visual Mfg.

Entry Specify
CalcQtyByPieces.

Value To use
the calculated piece quantity as the calculated quantity, specify
Y. To use the total quantity actually used
in the work order, specify N.

4. Click Save.

Note: If you change your CalcQtyByPieces
preferences settings, you must recalculate quantities on work orders,
engineering masters, and quote masters that use piece-tracked parts.
When you recalculate quantities, posting candidate flags are set to
Yes. When you run costing, the work orders will be processed.

## Purchasing Piece Tracked Parts for Material Requirements

When you purchase a piece tracked part, the number of pieces you
order must be a whole number.  When
you use the Purchase this Material/Service function to purchase a
piece tracked part in the Manufacturing Window, the number of pieces
on the purchase order line is equal to the Calculated # of Pcs field
on the Planning tab of the Material card. The quantity is equal to
the Calculated Piece Qty on the Planning tab of the Material card.
If you use the CalcQtyByPieces = N setting in Preferences Maintenance,
the amount you purchase might exceed the amount needed to fulfill
the material requirement. You can return any unused pieces to your
inventory.