Adding Material Requirements



 


 
 
 
 
 
 
  
 
  
 
 
 
 
 
 
 
 
  
 
 
  
 
 
 
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
 
  
 
  
 

# Adding Material Requirements

After you have defined an operation, you can add material
requirements to it. These specify required materials at the specified
operation. If the same material is required at multiple points in
the production process, you must create one material requirement for
each operation where the material is needed. Material required can
be a purchased inventory part, a fabricated part, or a special non-inventory
part.

To add a material requirement:

1. Select an operation
   to which you want to add the material requirement.

All Infor VISUAL material requirements are
associated with a specific operation. This allows material planning
to plan supply based on the required date of the operation, rather
than the whole work order.

Select the operation to which you want to
add the requirement. You can also select any other existing material
requirement on the same operation.

2. Select Add
   Material from the Edit menu. You can also press CTRL-M.

The Material window for the new material
requirement appears.

Notice the two radio buttons Material
and Leg/Detail. The Material button is selected
by default. You should leave this selection as is if you choose
Leg/Detail, you will create a leg instead of a material requirement.

3. Adjust the Piece Number,
   if necessary.

VISUAL automatically assigns piece numbers
to material requirements on the same operation and gives them increments
of 10. These have less significance than operation sequence numbers,
because the order of material requirements within an operation usually
doesnt matter. You can, however, adjust this number, and also renumber
them to place the parts in order by Part ID. You can do this using
Renumber Piece Numbers by Part ID after you define the materials.
This function is described later.

4. Enter a Part ID or select
   a Part ID from the Part ID table.

If the new material has a Consumable Part
ID, the Costs, Vendor, and Quotes tabs are inactive in the Material
window. However, because you cannot enter consumable parts into inventory,
and because VISUAL expenses them at the time of receipt, the Issued
Qty field is active only if the new material has a Consumable Part
ID. After you have entered the appropriate information for a new material,
the card that appears is violet, the same color as a tool or fixture
card.

You cannot add a new material on the fly
and classify it as a consumable. When the New Part Information dialog
box appears, "Consumable" is not a choice. You can only
classify a part as consumable in Part Maintenance. Because consumables
serve no purpose in material planning, scheduling or costing, consumables
appear only so that you can view them and place them on picklists.
VISUAL expenses consumables upon receipt, so a consumable materials
quantity at any one time is not important.

If the Part ID does not exist, VISUAL asks
you if you would like to create a new part here.

If you click Yes,
the New Part dialog box appears.

Enter a Description for the part, whether
it is Purchased, Fabricated, and/or Detail Only. This allows you to
continue the process without the interruption of using Part Maintenance.
You must return to Part Maintenance at some point, however, to define
the other information for the part.

If you specify a part ID that is already
used, you are asked to confirm that you want to add the part. Click
Yes to add the part. Click No to select a different part. If you always
click Yes in this message, you can suppress the message in Preferences
Maintenance. See Suppressing the Part ID Already Used Message.

If this is a requirement for a non-inventory
part, leave the Part ID blank. For this type of part, you should always
provide Specifications to describe the part. The unit of measure for
a non-inventory part is implicit. Because there is no part master,
VISUAL assumes the quantities to be in the default unit for the part.
If you want to specify a unit of measure, use the Usage Unit of Measure
field as described below.

Price break information for non-inventory
parts is set up in Vendor Parts Supplied in Part Maintenance.

5. To assign the part to
   the warehouse specified in the Header card, select the Inherit
   Demand Warehouse check box. Clear the check box if you
   do not want to assign the part to the warehouse specified in the
   Header Card (for example, if you use universal planning for the
   part).

If you selected the Do Not Inherit Demand
Warehouse for the part in Part Maintenance, you cannot select the
Inherit Demand Warehouse check box on the Material card.

6. Enter the quantity of
   the material that is required per unit of in the Qty Per field.

Use the Qty Per (Start Qty) radio button
to specify Quantity Per based on the amount needed per incoming material.
Use the Quantity Per (End Qty) field to specify Quantity Per based
on the amount needed per unit of outgoing material (the End Quantity).

7. Enter any fixed material
   requirement quantity in the Fixed Qty field.

A fixed material quantity is a quantity
of material required one time, regardless of work order quantity.
This could be fixed scrap caused by setup or test, or could be any
material required to produce the parent part.

8. If there is a known
   scrap percentage, enter it in the Scrap % field.

VISUAL adds this percentage to the base
quantity required to make up for the loss.

9. Enter dimensions for
   the material in the Dimensions field.

Dimensions specify a formula for use in
determining quantity required. VISUAL factors dimensions into the
Quantity Per in calculating the total quantity required to meet the
requirement.

This formula can contain only constants.
For example, if an area of sheet metal is required to produce a part
two feet by four feet in dimension, you can specify 2\*2. The advantage
is that the formula for determining the requirement is explicitly
stated. If dimensions change, you can change the formula rather than
redoing the calculations to get a new quantity per.

You can use the following basic operators
when specifying formulas:

 + Addition

 - Subtraction

 \* Multiplication

 / Division

 \*\*  Raise to a Power

You can use parentheses for grouping. You
can develop any complexity of formula. Dimensions are actually specified
in a language called SAL, which is the language in which Infor VISUAL
is written. A rich selection of mathematical functions is available
for use.

When variables are included in a formula,
each variable name must be enclosed in square brackets. For example,
[LENGTH]\*[WIDTH].

Consider this example:

Sheet steel is formed into tubes of a variable
diameter and length. You want the material requirement for the raw
material to be expressed in square feet. Additionally, the sheet steel
is available in square footage up to six feet wide and to any length.
You have set up the conversion of one foot for six square feet for
the part, so you specify a Usage Unit of Measure of Square Feet.

You can set up variables called DIAMETER
and LENGTH in the work order header. These are set for each work order
to control those parameters. The total square footage required is
the length times the circumference of the tube. The circumference
of a circle is given by Pi x Diameter, where Pi is a constant. Therefore,
the following dimensions express the quantity needed:

[LENGTH]\*[DIAMETER]\*SalNumberPi()

SalNumberPi is a function that returns the
mathematical constant Pi.

If Qty Per for this material requirement
is 2, then VISUAL multiplies this dimension by 2 to determine the
total material requirement.

10. Enter the unit of measure
    in which the material is used in the Usage U/M field. You can
    click the Usage U/M button and select
    a unit of measure from the table.

By default, VISUAL uses the Stock Unit of
Measure for a part to interpret the Quantity Per and Fixed Quantity
values. You can specify a different unit of measure for these quantities.
For non-inventory materials, you must use this field to specify the
unit of measure for the part.

When you use this override, a conversion
factor must have been defined between the Stock and Usage units. This
could have been done in Unit of Measure Maintenance, or specifically
for the part. For example, a global conversion would specify 100 centimeters
to one meter. Alternatively, sheet steel can be purchased by the foot,
in rolls six feet wide. You may wish to specify usage in square feet.
In this case, you cant set a global conversion of feet to square
feet, but you can set one for that specific part. For the sheet steel,
one foot equals six square feet.

11. If you selected a piece
    tracked part in the Part ID field, specify the dimensions for
    one piece in the Length, Width, and Height fields. If a particular
    dimension is not required, the field is not available. Specify
    the dimensions in the unit of measure displayed in the Usage U/M
    field. If you use a piece tracked part for the material requirement,
    you cannot specify a usage unit of measure. You must use the usage
    unit of measure specified for the part in Part Maintenance.
12. Click the Specifications
    tab.

The Specifications information appears.

13. Enter any information
    or specifications regarding this requirement in the Specifications
    window. If this is a non-inventory part requirement, it is important
    that you enter some description in this field this provides
    the only description for the part.
14. If there is a drawing
    associated with this requirement, enter the Drawing Number, Revision,
    Effective Date, and Discontinue Date in the appropriate fields.

You can use the Calendar
button to select effective and discontinue dates.

15. Click the Save
    button to save the information.

|  |  |
| --- | --- |
| POSTIT.gif | If you want to quickly add a material with minimal details, clear the Material Edit Form option on the Views menu.  When you add a material, a list of parts appears, select the part you want to use for the material.  VISUAL creates an material requirement with the next sequential number using only the information from the part record.  If you have opened the Material child window, you can use the Show/Hide Edit Material Form toolbar buttons to hide or show the Material window. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Overriding_Material_Costs.md)
Overriding Material Costs

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Vendor_Information.md) Specifying Vendor Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Embedding_a_Picture_Object.md)
Embedding a Picture/Object

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Quantity_Break_Costs.md) Setting Quantity Break Costs

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Planning_Leadtime_Information.md) Specifying Planning/Leadtime Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_Material_User_Defined_Field_Labels.md) Material Requirement User Defined Field
Labels

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Reference_Designators.md) Specifying Reference Designators

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Alternate_Parts.md)
Specifying Alternate Parts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help