Finished Goods Journals




# Finished Goods Journals

The Finished Goods Journals record summary transactions created by the Costing Utilities when work in process is received into finished goods inventory. These distributions summarize the movement of value from WIP into Finished Goods and prepare amounts for posting to the General Ledger.

## Quick TOC

- [Overview](#overview)
- [Receipt Processing & Distribution Creation](#receipt-processing--distribution-creation)
- [Actual vs Projected Costing Behavior](#actual-vs-projected-costing-behavior)
- [Manufacturing Variances and Adjustments](#manufacturing-variances-and-adjustments)
- [GL Posting / Account Selection Rules](#gl-posting--account-selection-rules)
- [Examples & User-defined Help](#examples--user-defined-help)

## Overview

Finished Goods distributions are generated when items are moved from work in process to finished goods. These distributions reflect the accumulated material, labor, burden, and service costs that are transferred into finished goods inventory value.

## Receipt Processing & Distribution Creation

When finished goods are received from a work order, the Costing Utilities summarize all costs on the work order and create distributions that debit Finished Goods inventory and credit WIP or other appropriate accounts depending on your interface configuration.

## Actual vs Projected Costing Behavior

Under Actual costing, the finished goods receipt will use the accumulated actual costs from the work order. Under Projected costing, receipts may use the estimated unit costs in effect at the time of the movement.

## Manufacturing Variances and Adjustments

If there are differences between expected (standard or projected) and actual costs, the Costing Utilities may generate variance distributions. Variance handling depends on the costing method and the configuration of product-code and interface accounts.

## GL Posting / Account Selection Rules

Account selection for finished goods receipts follows the priority: product-code accounts → part accounts → default inventory accounts from the GL Interface table. Credit/debit behavior follows the templates described in the Example Postings documentation.

## Examples & User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help

The Finish Goods Journal contains a listing of the
summary transactions created by the Costing Utilities as a result
of processing inventory transactions of work orders. These are receipts
(or returns) of manufactured parts from the floor to finished goods
inventory. This journal is work order based and not transactional.

## Finished Goods Journals in Actual WIP Costing

If you selected Actual as your WIP costing method, the system values
that transaction at the total accumulated cost on the work order at
that time when a partial quantity is moved from WIP to finished goods.
If another partial quantity moves to stock, the system values that
transaction with the costs accumulated between the previous transaction
and this one. This continues until the work order is completed and
closed. When the work order is closed, the Costing Utilities evaluate
the total cost of the work order versus completed transactions and
creates adjustment distributions for any differences.

## Finished Goods Journals in Projected WIP Costing

If you selected Projected as your WIP costing method, the system
values that transaction at the estimated unit cost based on the work
order at that time when a partial quantity is moved from WIP to finished
goods.

## Costing Considerations for Finished Goods Returns

If you use FIFO by Part Location as the FIFO method, review the
following information to ensure that work order receipts and returns
are processed as anticipated.

FIFO locations are not maintained for finished goods returns. To
make sure that FIFO layers are matched for finished goods return transactions,
it is highly recommended that you use one warehouse location per work
order for work order receipts and potential finished goods returns.
You do not need to use one warehouse location for all of your work
orders. You should just make sure that for any given work order, you
use the same location for work order receipts as you do for  finished
goods returns.

If business needs dictate that you need to use a different warehouse
location for receipts and returns, you should review and physically
adjust locations after you create  finished goods returns. If
you receive a quantity from a work order to one location, transfer
the quantity to a second location, then return the quantity to the
work order, the relationship between the adjust out  FIFO layers
will be lost. The distribution for the transfer to the second location
and the original receipt will be separated. The receipt return is
directly distributed to the original receipt.

If you do need to use different warehouse locations for work order
receipts and returns, you can use the following reports to analyze
the transactions:

Inventory Transaction Report Use this
report to view when work order returns have been made. Sort the report
by Work Order and Type of Receipt to identify receipts. Negative amounts
indicate returns.

You can also use this report, sorted by Warehouse/Location/Part,
to analyze part location quantity. The layer costs are expressed as
current value, not as the value as of a particular point in time.

Costing Tools You can use the Cost Distribution
Analysis tool and FIFO/Average Costing Analysis tool to view distributions.

Inventory Balance Report Use this report
to view costed values of transactions as of a period end. The total
of this report will reconcile, but if you use separate locations for
work order receipts and returns, the amounts reported by location
will not reconcile.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_DBR_Maintenance.htm) User-defined Help