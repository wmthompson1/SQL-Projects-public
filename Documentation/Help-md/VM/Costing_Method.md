Costing Method




## Costing Method

Select Standard, Actual, or Average costing.

Standard - Standard costs are taken from the
part table and are usually updated once or twice a year by Reset Material
Requirement Costs This feature, found in Part Maintenance, is used to
correct and update costs for parts in existing quotes, work orders and
engineering masters.

Actual - The system will value to material
inventory at either the purchase order or invoice.

There are four costing methods available in VISUAL:

Actual Costing Actual Costing uses the source
of the raw material cost to define the value of all inventory in the system.
It uses the hourly labor rate of the employee that creates the labor ticket
and the Voucher value of any Services received. Actual costing uses your
First-In-First-Out (FIFO) rules to assign value when the inventory is
consumed.

Average Costing Average costing uses the
same cost sources as Actual Costing as inventory comes in. Average Costing
calculates the current running average of inventory for each part and
assigns that value when inventory is consumed.

If you use Actual or Average Costing methods, you must use By Part Location
as your FIFO Method / Inventory Grouping.

Standard Costing Standard Costing values
every inventory transaction at the Part Standard (from Part Maintenance
at the time of the transaction). VISUAL drops any difference between the
part standard value and the actual cost into variance accounts in the
general ledger.

If you use Standard Costing methods for your consigned inventory, you
can use By Part or By Part Location for your FIFO Method / Inventory Grouping.

Project Costing Project Costing is activated
by a license key and is described in the Aerospace and Defense / Project
User Guide.

| Standard Costing | Actual Costing |
| Purchase Material at Standard with Purchase Price Variances (PPV) | Raw Materials Valued at PO or A/P Invoice |
| Manufacturing Variances Upon Receipt from Work Order | Inventory Valued at FIFO or Purchased to a Job |
| Labor & Burden Cost Charged to the Work Order at Resource Standard | Charged at Actual Employee Rate  Burden Basis Options:  Resource Rate(s) VISUAL to use the rates in the reported shop resource to compute actual burden.  Operation Rate(s) VISUAL to use the burden rates in the work order operation to compute actual burden. |
| Service Costs at Standard | Service Costs at Actual Invoice Value |