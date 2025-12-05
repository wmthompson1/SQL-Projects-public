Setting Up Unit of Measure Conversion for Specific Parts




# Setting Up Unit of Measure Conversion for Specific Parts

You can setup unit of measure conversions that are
specific to a part. For example, a global unit of measure conversion
might specify 12 inches = 1 foot something that applies to all uses
of this unit. There is no need to set up these for each part.

However, consider barstock that you purchase in pounds, but use
in feet. In this case, the conversion factor depends upon the density
of the material, and the width and thickness of the bars. You cant
set up a conversion between pounds and feet in the global table.

If you are licensed to use multiple sites, this information is maintained
at the tenant level.

To set the conversion for the part:

1. Select Inventory,
   Part Maintenance.
2. In the Part ID field,
   specify the part for which you are setting up conversions.
3. Select Maintain,
   Unit of Measure Conversion.
4. Select the to unit of
   measure from the upper table.
5. Select the from unit
   of measure from the lower table.
6. Specify the calculation
   to be performed to convert your selected units of measure. For
   example, if you were converting centimeters to inches, you would
   select IN from the upper table, CM from the lower table, and specify
   2.54 in the Conversion Factor field.
7. Click Save.

If a conversion factor is specified for a part, then that conversion
factor is used when necessary in transactions. If no conversion factor
is specified for the part, then the global unit of measure conversion
is used.

## Copying Conversions to Other Parts

If you have set up conversions for a part, you can copy them to
other parts.

To copy conversions:

1. With the appropriate
   part and conversion open in the Unit of Measure Conversions dialog
   box, click Copy to Other Part.
2. Click the Part ID browse
   button and select the part to which to copy the conversion from
   the list.
3. Click OK.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help