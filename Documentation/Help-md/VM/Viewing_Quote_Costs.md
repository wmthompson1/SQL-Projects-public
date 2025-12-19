Viewing Quote Costs




# Viewing Quote Costs

After you have accurately defined the source of costs,
you are ready to prepare the quote price information. Automatic price
calculation is based on marking up estimates of your actual cost.

## To view estimated actual cost information:

1. Select the appropriate
   line item from the line item table in the Estimating Window.
2. Click the Costs
   button, or select View Quote Costs from
   the File menu.

The Quote Costs dialog box appears. The
dialog may take a few seconds to appear, depending on the number of
quoted quantities and the size of the master, because actual costs
are being calculated.

The dialog box has one column for each different
quantity quoted. Only five quantities can appear at once; use the
radio buttons at the bottom of the window to select the range of quantities
to view.

## The following cost data appears for each quantity:

Material - Total material cost, including
unit cost x quantities required, plus any fixed cost.

If Costing Between Levels, in Application Global Maintenance, is
set to Fold To Material Cost, this includes the cost of all purchased
and fabricated materials used. If Keep Costs Separate is selected,
this includes material purchase costs only.

The Costing Between Levels option controls how costs are "imploded"
into their Part Maintenance entries. If this option is changed, you
must re-implode or otherwise recalculate costs before the effects
of the change will show. See Application Global Maintenance for details.

If the Use Qty Breaks on Purchases During Recalc box is checked
(this is the default), then quantity breaks for the preferred or specified
vendor are used in determining unit prices for purchased parts.

If you specify a Minimum Cost for a non-inventory material requirement
by using Quantity Break Costs in the Manufacturing Window, the total
cost for that material will not be lower than the minimum cost.

Labor - Total setup and run labor cost
for all operations. If Costing Between Levels has been set to Keep
Costs Separate, this includes setup and run labor for any fabricated
materials that are required.

Burden - Total burden. This includes setup
burden, run burden, and any issue burden associated with material
handling (this is defined in Part Maintenance). If Costing Between
Levels has been set to Keep Costs Separate, this includes burdens
for any fabricated materials that are required.

For operations specifying hours/load or loads/hour, Load Size is
used to compute the (integer) number of loads needed to complete the
operation. For example, if the load size is 100 and the quantity required
at this operation is 101, the time to complete two loads is used to
compute the estimated labor and burden costs.

Service - Total service cost for all service
operations, including (Run Cost) x (Quantity) plus any fixed charge
specified. If Costing Between Levels has been set to Keep Costs Separate,
this includes service costs for any fabricated materials that are
required.

Total Cost - Material + Labor + Burden
+ Service.

Unit Cost - An effective unit cost obtained
by dividing Total Cost by the quantity for the column.

The rest of the items rely on price data specified in the Prices
dialog box.

Total Price - Unit Price (as specified
below) times the quantity for the column, giving the total price quoted
for the quantity.

Unit Price - Quoted Unit Price.

Total Gross Margin - Total Price - Total
Cost. This gives margin without accounting for GSA expenses.

Unit Gross Margin - Total Gross Margin
divided by the quantity for the column.

Total Net Margin - Total Price - (Total
Cost + GSA Expense). GSA expense is computed by applying the GSA markups
specified in the Prices dialog to the total cost. This gives true
profit margin by accounting for cost of goods sold and selling expenses.

Unit Net Margin - Total Net Margin divided
by the quantity for the column.

You can choose to view costs without accounting for quantity breaks
by un-checking the Use Quantity Breaks on Purchases During Recalc.
This allows you to inspect how the other fixed and variable costs
interact without regard for quantity breaks. Press Recalc to recompute
the costs.

Engineering masters are not consulted to multiple levels. The cost
estimates shown in the operation and materials on the quote or engineering
master are used. When this master has material requirements for fabricated
parts, quantity breaks that may apply to the masters for those parts
are not consulted; instead, the standard unit cost will be used. Likewise,
rollups of labor, burden, and service costs from one level to the
next are not recalculated interactively for different quantities.
Note that this can only result in cost estimates that may be higher
than the actual costs. This occurs if you purchase and manufacture
those fabricated parts specifically to meet the order, thereby taking
advantage of second-level price breaks and fixed costs.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.md) User-defined Help