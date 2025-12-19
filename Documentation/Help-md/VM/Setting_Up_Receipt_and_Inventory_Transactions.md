Setting Up Receipt and Inventory Transactions




# Setting Up Receipt and Inventory Transactions

Click the Setup button in
the Costing Utilities window to call up the Setup dialog box.

The Setup dialog box for Receipt and Inventory Transactions has
two functions.

The first option allows you to assume that all operations and requirements
for a work order are closed if the work order is closed (fully received
to stock), regardless of the complete status of the individual requirements
and operations. All material issues to the work order however, must
have a final cost.

For example, a work order may require 100 pieces of an item per
the estimate. If 90 pieces have been issued and fully costed, this
option assumes that the job can be final costed. This box is checked
by default. If you want the system to consider a fully received work
order open, if any requirements are incomplete, remove the check mark
from this box.

The next option allows the Receipt and Inventory Transaction costings
to continue to run until you have performed all updates to transactions.
This box is checked by default. The system is able to capture all
activity for a change in a Transaction in one step rather than having
to run this multiple times.

For example, in actual costing, if an issue to a work order is fully
costed by matching the Accounts Payable Invoice with the Purchase
Order Receiver, the work order that received the material is considered
for full cost. If the work order is closed, the receipt of the work
order is fully costed and therefore, any issue (shipment or issue
to a higher level work order) of the received work order, can now
be costed. If this box is not checked, the receipt is not fully costed,
and therefore, the issue of the fabricated item to a higher level
work order is not costed.

A single pass (box not checked) first values receipts, and then
the issues from those receipts. Because some receipts first require
that issues are valued, a single pass does not always cost everything
that can be valued. You should leave this option checked. The only
time it is not necessary to leave this option checked is if all Bills
of Material for the product you fabricate are single level, and, very
few returns are made in the system. Check this when costing inventory
at months end. When the No Updates Performed message appears, all
activity to date has been costed. Under normal circumstances, you
should leave both of these options checked.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help