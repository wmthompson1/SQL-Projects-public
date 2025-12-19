Manufacturing Cost Flow Overview




# Manufacturing Cost Flow Overview

VISUAL implements actual costs for work orders as
a function of inventory and labor transactions placed against those
work orders. All costs ultimately come from these two window controls.

When you first create a work order, it has no transactions. As inventory
is issued and labor is posted to the work order, the work order is
given actual cost. Depending on the costing method you have chosen
for your system, the values used in these transactions are either
based on part and resource standards or actuals. Purchase orders,
when received, effectively have an actual cost also. Similarly, Customer
orders, when shipped, have actuals associated with them. Just as work
orders can be shown to have an actual cost by totaling the issues
and labor against it, so can a purchase order and customer order by
totaling the receipts and shipments, respectively, against them.

The Costing Utilities prepare inventory and labor transactions to
be permanently Costed and Posted to the General Ledger. Not all costing
actions can be carried out on-line (i.e. during normal system interaction).
A few actions must be performed in batch mode. The Costing Utilities
program is designed to perform those batch functions. The functions
performed are:

* Receipt Transaction Costing
  (Work Orders)
* Inventory Transaction Costing
* Prepare Purchase Journal
  Transactions
* Prepare WIP / FG Journal
  Transactions
* Prepare Shipments Journal
  Transactions
* Prepare Part Adjustment
  Journal Transactions
* Prepare Indirect Tx Journal
  Transactions

## Purchase Receipts

Frequently run, daily or every other day Receipt Transaction Costing
and Inventory Transaction Costing. As purchase order receipts become
invoiced and entered, the Inventory Transaction Costing function takes
the invoice cost information and costs the transactions that are being
held because of missing cost information (received Purchase Order
not yet invoiced). The Receipt Transaction Costing function checks
open work orders and their receipts to "see" if all receipts
can be costed. For example, when an invoice is matched to its receipt,
that receipt can now be costed and any issue from that receipt (FIFO)
can be costed. The costed issue has now affected the cost of a Work
Order or Customer Shipment. In the case of the Work Order, the receipt
of the finished product can now be valued with its final cost. The
Receipt Transaction Costing function performs this step.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help