What is the Inventory Valuation Report?




# What is the Inventory Valuation Report?

This report provides a breakdown and total value for
all parts in your inventory. For each Part ID, the following information
is shown:

Description

On-Hand Quantity

Material Cost

Labor Cost

Burden Cost

Service Cost

Total Value = Material + Labor + Burden + Service

Total value is also shown for entire inventory.

When printing by Part ID w/Cost Layer Detail, each of the inventory
transactions that make up the cost layers for a part will be listed,
with the following information:

Inventory Transaction ID

Transaction Type and Associated Work Order ID, if any

Material Cost

Labor Cost

Burden Cost

Service Cost

Quantity of Transaction

Total Value

## Options

## Use Part Standard Unit Cost Instead of FIFO Actual

If using actual costing, received materials are valued at FIFO based
on the invoice or purchase order amount. Depending upon your use of
the report, you may wish to value inventory based on the standard
cost as defined in Part Maintenance, rather than actual costs.

## Show Parts with Non-Zero Amounts Only

If you have many part masters for which you arent currently carrying
inventory, you may want to use this option to reduce the size of the
report.

## Cost Layer Detail Options

These options apply to the Part ID w/Cost Layer Detail option. If
choosing this option, you must use the FIFO Actual values. These options
can only be used if you are using the actual costing method. You have
three choices:

Show All Parts in Range
- All parts will be reported regardless of zero or negative cost layers.

Show Parts with Zero
Cost Layers Only - The report will only be printed for parts
that have one or more cost layers with a zero value. This option helps
you track down any parts that may not have been valued correctly.
This could happen, for example, if you adjusted parts into inventory
and forgot to provide the appropriate cost.

Show Parts with Negative
Balance Cost Layers - The report will only be printed for parts
that have one or more cost layers with a negative value.

## Sequencing

This report can be sequenced by Part ID, Product Code, or Commodity
Code. For all sequences, you can choose a range of Part IDs to report
on.

## QRP Files

|  |  |
| --- | --- |
| By Part ID | VMPIVRPT.QRP |
| By Part ID with Detail | VMPIVRP3.QRP |
| By Product Code | VMPIVRP1.QRP |
| By Commodity Code | VMPIVRP2.QRP |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMPIVRPTfrmPrintInventoryValueReport.htm) Printing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Valuation_Report.htm) User-defined Help