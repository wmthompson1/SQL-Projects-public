Database Cost Setup




# Database Cost Setup

|  |  |
| --- | --- |
| IMPORTNT.gif | This database setup instruction is for the administrator of your company for the purpose of implementation. Administration must determine the global parameters for the costing method (Standard or Actual Costing) of the database before you begin. You must make this choice before implementing VISUAL. Your costing choice is set up using VISUAL Application Global Maintenance. |

1. Call up the Application
   Global Maintenance window from the Infor VISUAL Admin menu.

The Application Global Maintenance window
appears.

2. Select the Costing
   tab.
3. Select the costing method
   you want to implement; by clicking on the Standard
   or Actual option button.

Standard Costs

1. * Purchase Material at
     Standard with PPV (Purchase Price Variances)
   * Manufacturing Variances
     Upon Receipt from Work Order
   * Labor & Burden Cost
     Charged to the Work Order at Resource Standard
   * Service Costs at Standard

Actual Costs

1. * Raw Materials Valued
     at PO or A/P Invoice
   * Inventory Valued at
     FIFO or Purchased to a Job
   * Labor Charged at Actual
     Employee Rate
   * Burden Basis Options:

Resource Rates
= causes VISUAL to use the rates in the reported shop resource to
compute actual burden.

Operation Rates
= causes VISUAL to use the burden rates in the work order operation
to compute actual burden.

1. * Service Costs at Actual
     Invoice Value

Average Costs

1. * Raw Materials Valued
     at PO or A/P Invoice
   * The Perpetual Average
     of the Inventory = Total value by total quantity.
   * Labor Charged at Actual
     Employee Rate
   * Burden Basis Options:
   * Resource Rates = causes
     VISUAL to use the rates in the reported shop resource to compute
     actual burden.
   * Operation Rates = causes
     VISUAL to use the burden rates in the work order operation
     to compute actual burden.
   * Service Costs at Actual
     PO or Invoice Value

If you are using Actual or Average Costing,
select the Work in Process Costing (method
for valuing partial receipts) you are using; Projected or Actual.

IF Database is set
to Actual Cost, determine WIP Costing (Receipts) either Actual or
Projected

1. 1. 1. * Valuation Method
           for Partial Receipts

Actual Uses
Total Cost to Date

Projected Calculated
Value, Can Not Exceed Actual to Date per Cost Component

Final Valuation
at Completion of Work Order

1. 1. 1. * A "Projected"
           Cost to Value Partial Receipts is calculated.

Basis is Actual
Costs to Date and Remaining Cost to Complete

"Remaining
Cost"

Operations and
Material Requirements to be Completed Valued at Work Order Estimate

1. 1. 1. * Need to Enter
           Quantity Complete on Labor Tickets

If not VISUAL uses 100% of Operation
Value

Projected Cost Calculation
- Partial Receipts

VISUAL uses Component Level Costing;
Material, Labor, Burden or Service, assuming that with partial receipts,
NO component will be driven negative.

1. 1. 1. * Component Projected
           Cost / Work Order Qty = Unit Component Projected Cost
         * Unit Component
           Projected Cost X Qty Received = Total Component
         * Projected Value
           of Receipt
         * Total Component
           Projected Value < Component Actual Costs to Date,
           Use Component Projected Value
         * If > Component
           Actual Costs, Use Component Actual Costs

Database set to Standard Cost

1. * Valuation Method for
     Partial Receipts
   * If the Standard Cost
     of the Receipt is less than the Actuals charged to the W/O
     Qty is received at Standard and no Variance is calculated.
   * If the Standard Cost
     of the Receipt is greater than the Actual Cost charged to
     the W/O Qty is received at Standard and a Variance is calculated
     for the difference between the actual and standard cost of
     partial receipt.

4. Select the FIFO Method,
   by part or by part location.

This option will allow First In First Out
cost distribution By Part Locations. The prior method only offered
by Part ID, which ignored the locations and distributed costs using
FIFO layers created for each part in total.

5. Select the Source of
   Raw Material Cost, by purchase orders or by A/P invoices.

This option only applies when using Actual
costing, and controls the source of costs assigned to raw material
inventory using either Purchase Orders or
A/P Invoices.

If you choose Purchase Orders, then costs
will be taken from the purchase order at the time of material receipt.
This method will create a Purchase Price Variance. This option is
only preferable if you are not using Infor VISUAL Financials.

If you choose A/P Invoices, then costs will
be taken first from the purchase order, as an estimate, then updated
from the invoice for the purchase, when it is received. If you are
using Infor VISUAL Financials, you should select this option, as it
will be accessing the more accurate costs.

6. Select the Purchase
   Quote Type; Qty-break tables or Up-to-qty tables.

The Part Maintenance application allows
you to specify vendor price quotes for a part by different quantity
levels. There are two ways these items can be interpreted:

Quantity Break Tables:
If you select this option, the quantity levels are referred to as
"Quantity Breaks" and the default price is used up to Quantity
Break 1. Other Quantity Breaks will specify the prices used through
the final Quantity Break, which will be applied against any larger
quantities.

Up-to-Quantity Tables:
If you select this option, the quantity levels are referred to as
"Up-to-Quantities". Quantities are applied from the lowest
level with prices. The default price is applied against any larger
quantities.

7. Select the Labor Cost
   Basis; Determined by hours worked or Determined by quantity completed.

This option only applies when using Standard
costing, and controls how labor costs are calculated.

If you choose Hours Worked, labor is calculated
by multiplying the hours reported on a labor ticket by the standard
cost of the operation.

If you choose Quantity Produced, labor is
calculated by multiplying quantity completed for an operation by the
standard cost per unit for the operation. You can add cost to the
Hours field. When set to quantity produced the standard hours estimated
will be multiplied by the standard rates when the quantity is completed.

8. Select the Costing Between
   Levels; either Fold to material cost or Keep separate costs. This
   option allows you to keep the cost categories separate between
   levels.

There are four cost categories in VISUAL:
Material, Labor, Burden, and Service. Purchased materials only affect
the Material category, while internally fabricated parts may incur
costs in all four categories. This option controls how costs are passed
between levels when one fabricated part is used as a material requirement
in another. There are two options:

Fold to Material Cost:
If you choose this option, the Material, Labor, Burden and Service
cost of an internally manufactured intermediate are all summed into
the material cost when it is required in another fabricated part.
From a cost point of view, this makes a part you manufacture look
like a purchased part when it is required in another product, the
cost is all counted as material cost.

Keep Separate Costs:
If you choose this option, the Material, Labor, Burden and Service
cost of an internally manufactured intermediate part contribute to
those individual categories in parent assemblies. From a cost point
of view, this counts labor and burden associated with fabricating
the intermediate part of the labor and burden costs for the entire
product.

9. Select the Burden Basis:
   Determined by resource burden or Determined by operation burden.

This option only applies when using Actual
costing, and is best described as the overhead calculation used to
control the source of Burden to be applied to work orders.

The Resources
setting causes VISUAL to use the burden rates setup in shop resource
maintenance.

The Operations
setting causes VISUAL to use the burden rates in the work order operation
to compute actual burden.

10. Click Save
    to save your settings.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help