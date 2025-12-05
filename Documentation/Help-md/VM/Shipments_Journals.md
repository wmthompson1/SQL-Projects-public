Shipments Journals




# Shipments Journals

The Shipments Journal contains a listing of the summary
transactions created by the Costing Utilities as a result of processing
inventory transactions of customer orders. These are shipments (or
returns) for parts sold to customers. This is a customer order based
sub-ledger and is not transactional.

## Shipping Journals in Actual WIP Costing

If you selected Actual as your WIP costing method and a partial
shipment of a customer order linked to a work order is made, the system
books to cost of goods sold the total cost accumulated to date on
the work order. A second shipment will be at the cost accumulated
between the previous shipment and this one. When the final shipment
is made and the work order closed, if there is any difference between
the total cost of the work order and the costs already transacted,
the system creates adjustment distributions for this difference.

Because of this methodology, if partial shipments occur across accounting
periods, there is the potential that cost of goods sold in a particular
period may be under or over stated.

In actual costing it is possible that cost variances for a job are
posted in a period for which no shipment was made.

For example, if an order with a total value of $4,000 ships in February,
this value is posted to the Cost of Goods Sold account(s). If an invoice
for material used on the job comes in on March 15, any difference
in cost (Purchase value vs. Invoice) is posted to the current periods
Cost of Goods Sold.

## Shipping Journals in Projected WIP Costing

If you selected Projected as your WIP costing method and a partial
shipment of a customer order linked to a work order is made, the system
values that transaction at the estimated unit cost based on the work
order at that time when a partial quantity is moved from WIP to finished
goods.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help