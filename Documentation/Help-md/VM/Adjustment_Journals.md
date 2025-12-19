Adjustment Journals




# Adjustment Journals

This journal contains a listing of the summary transactions
created by the Costing Utilities as a result of processing inventory
transactions of parts that adjusted inventory quantity on hand. This
journal also includes transactions created from inter branch transfers
and other actions that result in an adjust in or adjust out inventory
transaction.

You must value incoming adjustments (increases in quantity on hand)
when costing at actual. Use the current standard from the Part Master
or override the value manually when the transaction is created. This
action provides a cost per unit and therefore a total cost for every
incoming adjustment transaction. All adjustments into inventory created
using the VISUAL Physical Inventory module are made at standard. Therefore,
it is extremely important that all item masters contain a standard
if you use the physical inventory module.

Adjustments that are outgoing (decreases in quantity on hand) must
be valued by the same inventory costing method used to distribute
costs from receipts to issues (Costing Utilities, Inventory Transaction
Costing). You cannot set the dollar value of an outgoing adjustment.

This journal totals the value of each such transaction and posts
it to the financials via this subsidiary ledger. This journal is transactional.
That is, each transaction results in a separate distribution to the
appropriate accounts.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help