Costing and Co-products




# Costing and Co-products

Whenever you create a new receipt, VISUAL assigns
the part standard as the cost. If VISUAL is set to standard, this
cost is permanent and does not change. Each individual part in the
co-product list provides its own standard.

If actual costing is in use, VISUAL eventually recalculates the
cost of each work order, and ultimately each receipt, assigning the
actual cost as the receipt cost. This is done by the [Costing
Utilities](VMAPLUTLWhat.htm).

For single-part work orders this is a process of summing the cost
of the work order, calculating a unit cost, multiplying the unit cost
by the receipt quantity, and saving the result in the receipt.

For multi-part work orders, the process is different. Each of the
co-products may have a different unit cost. This unit cost is related
to the cost of the entire order.

VISUAL begins by calculating a total cost for the order. Each part,
including the main part, has some part of the total cost assigned
to it. Each co-product has a percentage associated with it. This percentage
(divided by 100) multiplied by the total cost is the total cost of
the co-product. This total is divided by the co-product quantity to
compute a unit cost for the co-product. VISUAL then uses this unit
cost to compute the receipt cost.

The main part has an implied percent of cost. VISUAL calculates
this percentage by subtracting the sum of the percents of the co-products
from 100. The remaining steps are the same as for the co-products.

VISUAL does not cost each co-product to the financials separately;
therefore, independent product line costing are not possible for co-products.
This is because the work order itself is costed to the ledger not
its individual transactions. The product line of the work order is
applied, not the product line of the parts themselves. All parts of
a multi-part work order are assumed to be part of the same product
line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help