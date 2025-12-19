What is Costing Utilities?




# What is Costing Utilities?

VISUAL implements actual costing for work orders as
a function of inventory and labor transactions placed against those
work orders. All costs ultimately come from these two tables. When
a work order is first created, it has no transactions. As inventory
is issued and labor is posted to the work order, the work order is
given actual cost. Depending on the costing method the system is set
to, the values used in these transactions are either based on part
and resource standards or actuals.

Purchase orders, when received, effectively have an actual cost
too. Similarly, customer orders, when shipped, have actuals associated
with them. Just as a work order can be shown to have an actual cost
by totaling the issues and labor against it, so can a purchase order
and customer order by totaling the receipts and shipments, respectively,
against them.

The Costing Utilities function is used to prepare inventory and
labor transactions to be permanently costed and posted to the General
Ledger. Not all costing actions can be carried out on-line (i.e. during
normal system interaction). A few actions must be performed in batch
mode. The Costing Utilities program is designed to perform those batch
functions. The functions performed are:

* Receipt Transaction Costing
  (Work Orders)
* Inventory Transaction Costing
* Prepare Purchase Journal
  Transactions
* Prepare WIP/FG Journal Transactions
* Prepare Shipments Journal
  Transactions
* Prepare Part Adjustment
  Journal Transactions
* Prepare Indirect Tx Journal
  Transaction

It is recommended that you run Receipt Transaction Costing and Inventory
Transaction Costing daily or every other day. As purchase order receipts
become invoiced and entered, the Inventory Transaction Costing function
will take the invoice cost information and cost the transactions that
are being held because of missing cost information (received Purchase
Order not yet invoiced). The Receipt Transaction Costing function
will check open Work Orders and their receipts to see if all receipts
can be costed. For example, when an invoice is matched to its receipt,
that receipt can now be costed and any issue from that receipt (FIFO)
can be costed. The costed issue has now affected the cost of a Work
Order or Customer Shipment. In the case of the Work Order, the receipt
of finished product can now be valued with its final cost. The Receipt
Transaction Costing function performs this step. In the case of a
shipment, the actual COGS value can be determined

The functions available from the main window are listed below. In
an actual costing environment, Receipt Transaction Costing and Inventory
Transaction Costing (the first two choices) should be run daily. In
either environment, all others must be run prior to the end of any
financial period so that the journals created can be posted to the
ledger before the period closes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Manufacturing_Costs.md)
Manufacturing Costs

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Account_Assignments.md)
Account Assignments

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Manufacturing_Journals.md)
Manufacturing Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Database_Setup.md)
Database Setup

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help