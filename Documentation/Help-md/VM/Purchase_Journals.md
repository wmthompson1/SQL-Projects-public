Purchase Journals




# Purchase Journals

Purchase Journals use the site on the Purchase Order
line to determine which site owns the purchase transaction costs.
Since you can enter a purchase order for multiple sites, this ensures
that the correct site owns the costs associated with its purchasing
activity.

The Purchase Journal contains a listing of the summary transactions
created by the Costing Utilities. These summary transactions are the
results of processing inventory transactions of purchase orders and
Receipts of Services from the vendor that are linked to a Purchase
Order. These are receipts (or returns) of each part.

Each purchase order received (or returned) during the period is
examined for its current value by summing the inventory receipts attached
to the purchase order. These receipts are summarized by G/L account
number for each PO. In other words, if three lines on a PO were received
at $100 each and the debiting G/L account was the same, a subledger
distribution for this PO would be made for $300. However, if each
debiting account was different, three subledger distributions would
be made for $100 each. Any existing distributions which have been
posted for the period are deducted. The resulting distribution is
then saved for the purchase order.

The purchase journals taken together for a given period represent
the total purchase receipts for all types of purchases of manufacturing
material and expense items for that period.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help