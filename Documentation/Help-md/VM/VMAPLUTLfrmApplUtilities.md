About the Costing Utilities Window




# About the Costing Utilities Window

Use the Costing Utilities window to manually update
inventory costs and to manually prepare manufacturing journals at
the end of each month.

## Starting the Costing Tools Window

Select Eng/Mfg, Costing
Utilities or Ledger, Costing Utilities.

## Concepts

This table shows links to the concepts behind the Costing Utilities
Window.

| Concept | Description |
| [What is Costing Utilities?](VMAPLUTLWhat.md) | This topic describes the benefits of Costing Utilities. |
| [Using Costing Utilities](Using_Costing_Utilities.md) | This topic provides an overview of the actions that occur when you run costing utilities. |
| [Manufacturing Costs](Manufacturing_Costs.md) | This topic describes the types of manufacturing costs. |
| [Account Assignments](Account_Assignments.md) | This topic describes how costs are recorded to G/L accounts. |
| [Receipt Transaction Costing (Work Orders)](Receipt_Transaction_Costing_Work_Orders.md) | This topic describes the actions that occur when you update receipt transaction costs. |
| [Inventory Transaction Costing](Inventory_Transaction_Costing.md) | This topic describes the actions that occur when you update inventory transaction costs. |
| [Manufacturing Journals](Manufacturing_Journals.md) | This topic describes the manufacturing journals that are prepared with Costing Utilities. actions that occur when you update receipt transaction costs. |

## Tasks

This table shows the tasks that you can complete in the Costing
Utilities window:

| Task | Description |
| [Running Costing Utilities Manually](Running_Costing_Utilities_Manually.md) | This topic describes how to run costing utilities manually. |
| [Prepare Manufacturing Journals](Prepare_Manufacturing_Journals.md) | This topic describes how to prepare manufacturing journals for posting. |
| [Printing Costing Reports](Printing_Costing_Reports.md) | This topic describes how to print costing reports. |

## Fields

Site ID

Specify the site whose transactions you are costing.

Receipt
transaction costing (Work Orders)

Select this check box to update work order receipt costs with the
most recent receipt transaction data. Actual cost transactions are
updated for Closed orders and partial receipts are updated based upon
WIP costing method.

Standard Costs are used to determine Finished Goods Variances.

To keep your costing values up to date, run the Costing Utilities
with this setting often. You do not have to generate distributions
until you are ready to post to your ledgers.

Inventory
transaction costing

Select this check box to update inventory costs with the most recent
transaction data. If you use the Standard costing method, this option
is not displayed.

To keep your costing values up to date, run the Costing Utilities
with this setting often. You do not have to generate distributions
until you are ready to post to your ledgers.

Setup button

Click this button to specify the settings to use when you prepare
inventory costs.

Default
posting date for journals

Specify a date in the period for which you are preparing manufacturing
journals. The date is adjusted to the last day in the period.

Prepare
Purchase Journal transactions

Select this check box to prepare the purchase journal. The purchase
journal contains a listing of the summary transactions created by
the Costing Utilities. These summary transactions are the results
of processing inventory transactions of purchase orders and receipts
of services from the vendor that are linked to a Purchase Order. These
are receipts or returns of each part.

Prepare
WIP/FG Journal transactions

Select this check box to prepare the WIP journal and the finished
goods journal. The Work In Process Journal contains a listing of the
summary transactions created by the Costing Utilities as a result
of processing inventory transactions and labor tickets to work orders.
These are issues (or returns) of materials and posting of labor to
work orders during the period. The Finish Goods Journal contains a
listing of the summary transactions created by the Costing Utilities
as a result of processing inventory transactions of work orders. These
are receipts (or returns) of manufactured parts from the floor to
finished goods inventory. This journal is work order based and not
transaction based.

Prepare
Shipments Journal transactions

Select this check box to prepare the shipments journal. The Shipments
Journal contains a listing of the summary transactions created by
the Costing  Utilities as a result of processing inventory transactions
of customer orders. These are shipments (or returns) for parts sold
to customers. This is a customer order based sub-ledger and is not
transactional.

Prepare
Part Adjustment Journal transactions

Select this check box to prepare the part adjustment journal. This
journal contains a listing of the summary transactions created by
the Costing Utilities as a result of processing inventory transactions
of parts that adjusted inventory quantity on hand. This journal also
includes transactions created from inter branch transfers and other
actions that result in an adjust in or adjust out inventory transaction.

Prepare
Indirect Tx Journal transactions

Select this check box to prepare indirect labor journals. The Indirect
Labor journal contains a listing of the summary transactions created
by the Costing Utilities as a result of processing labor tickets which
are not for a specific work order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help