Receipt Transaction Costing (Work Orders)




# Receipt Transaction Costing (Work Orders)

A work order gathers actual cost from labor ticket
postings or inventory transactions throughout its life; however, most
of the time its final actual cost is unknown. At some point in the
life of the work order, it becomes closed because it has been fully
received or shipped. Once this happens, the Receipt Transaction Costing
function permanently costs receipts for the work order. When the permanent
cost is established, the outgoing transactions can be costed (Issues
of Work Order Receipts).

Run Receipt Transaction Costing if you are using either actual or
standard costing.

In actual costing, this option evaluates the total order to see
if all inventory transactions and operations have been completed and
final costed. If so, this selection assigns a permanent cost to the
receipt and marks the work order as closed. If the work order is reopened
at a later date, this option reevaluates the work order for any cost
changes and updates the receipt as needed. Hence, the issues from
that receipt are also updated.

In standard costing, this option determines the Manufacturing Variance
that is taken when a work order is closed. All receipts in a standard
cost system are valued at standard as soon as they are created. Once
the order has been completed, a variance must be taken for any deviation
from standard. This is accomplished by this option.

Receipt Transaction Costing performs the following:

* Examines newly created labor
  transactions and inventory transactions of any permanently costed
  work order to see if changes have occurred since the work order
  became permanently costed. If you have added any new transactions,
  the corresponding work order is no longer permanently costed and
  is now reconsidered for costing.
* Examines each work order
  that is not permanently costed and determines if the work order
  is costable. A work order can be permanently costed if the following
  is true:
* The order is fully received
  or marked closed.
* The operations of the order
  are fully reported or marked completed.
* The material requirements
  of the order are fully issued or marked completed.
* The material issue transactions
  of the order are fully costed. Invoices have been received and
  matched to receipts consumed by this work order.

If the work order being examined is costable, take its actual cost,
determine the unit cost for each cost category and save the result
in each inventory receipt of the work order. Mark the work order as
costed permanently (by setting COSTED\_DATE to the current system date/time
in the Work Order table).

* The first option allows
  you to assume that all operations and requirements for a work
  order are closed if the work order is closed (fully received to
  stock), regardless of the complete status of the individual requirements
  and operations. All material issues to the work order however,
  must have a final cost. For example, a work order may require
  100 pieces of an item per the estimate. If 90 pieces have been
  issued and fully costed, this option assumes that the job can
  be final costed.
* The second option allows
  the Receipt and Inventory Transaction costing to continue to run
  until you have performed all updates to transactions. This box
  is checked by default. VISUAL is able to capture all activity
  for a change in a Transaction in one step rather than having to
  run this multiple times. For example, in actual costing, if an
  issue to a work order is fully costed by matching the Accounts
  Payable Invoice with the Purchase Order Receiver, the work order
  that received the material is considered for full cost. If the
  work order is closed, the receipt of the work order is fully costed
  and therefore, any issue (shipment or issue to a higher level
  work order) of the received work order, can now be costed. If
  this box is not checked, the receipt is not fully costed, and
  therefore, the issue of the fabricated item to a higher level
  work order is not costed.

A single pass (box not checked) first values receipts, and then
the issues from those receipts. Because some receipts first require
that issues are valued, a single pass does not always cost everything
that can be valued. You should leave this option checked. The only
time it is not necessary to leave this option checked is if all Bills
of Materials for the product you fabricate are single level, and,
very few returns are made. Check this when costing inventory at months
end. When the No Updates Performed message appears, all activity to
date has been costed. Under normal circumstances, you should leave
both of these options checked.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Receipt_and_Inventory_Transactions.md) Setting Up Receipt and Inventory Transactions

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help