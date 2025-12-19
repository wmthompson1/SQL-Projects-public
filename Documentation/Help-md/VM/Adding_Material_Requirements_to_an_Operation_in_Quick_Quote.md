Adding Material Requirements to an Operation in Quick Quote




# Adding Material Requirements to an Operation in Quick Quote

1. Select Sales,
   Estimating Window.
2. Open the master in Quick
   Quote.
3. Select the desired operation
   by clicking its row header.

The material table lists the materials associated
with the currently selected operation.

2. Click the Insert
   button located directly below the material table.
3. Specify this information:

PC # Specify
a number for this material requirement. By default, numbers are inserted
in increments of 10. You can specify a different number.

Part ID Specify
the ID of the material requirement. The unit of measure and description
of the part is inserted in the Part Stock U/M - Description field.

Bid Rate Category
If a bid rate category is defined for this part, then the category
ID is displayed. To specify a different bid rate, click the Bid Rate
Category browse button and select a different bid rate. Bid rate categories
are primarily used in conjunction with developing quotes outside of
VISUAL. You can use bid rate categories to establish costs based on
standards that you set up instead of based on the cost specified for
the part in VISUAL.

Qty Per Specify
the quantity required per unit to complete the operation.

Fixed Qty If
a fixed quantity of the material is required in addition to the quantity
per unit, specify the quantity.

Scrap% If you
lose a certain percentage of this material during the operation, specify
the percentage lost. The scrap percentage is applied to the Qty Per
value. If you specify a scrap rate, then the total quantity of material
required to complete the operation is greater than the amount you
specify in the Qty Per field. The quantity required is inserted in
the Calculated Qty field on the Planning tab. The material costs are
calculated based on the value in the Calculated Qty field.

If you specify scrap values, this formula
is used to calculate the quantity of materials required:

Header card quantity \* ((1 + Scrap%/100) \*
Material Card Quantity Per) + Fixed Scrap

Material unit cost
Specify the material cost for one unit of this part. For purchased
parts, this value is typically the total material cost. For fabricated
parts, use this field to specify the cost of material used in the
part.

Fixed Unit Cost
Specify the fixed cost the vendor charges for tis part. The fixed
charge is a one-time cost charged by the vendor for this part.

Burden/unit
Specify the per unit cost you incur for overhead.

Burden % Specify
the percentage of the total material cost you incur for overhead.

Drawing ID Specify
the ID of the drawing that depicts this material.

Rev Specify
the revision level of the drawing ID.

Text Specify
specification information for this material.

2. Click Save
   under the material table.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.md) User-defined Help