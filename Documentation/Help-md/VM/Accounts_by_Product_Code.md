Accounts by Product Code




# Accounts by Product Code

The accounts used by the Costing Utility program can
be a function of the Product Code Table from Part Maintenance. Here
you can specify the accounts to be used by a parts product code unless
an override account was specified elsewhere. If no product code is
specified in the part, then the appropriate override account is used.

You can specify these accounts:

Revenue Account The default account
for use when shipments are invoiced. You can override this account
at the Customer Order Line. The default account is from the General
Ledger Interface table. (Default Accounts Receivable Sales Revenue).

Adjustment The default to be used when
making inventory adjustments. You can override this account when entering
inventory adjustments in Inventory Transaction Entry. If not specified
here, the adjustment account from the General Ledger Interface Table
is used.

Inventory The Raw Material or Finished
Goods accounts for use when receiving issuing, returning, or adjusting
inventory for a specified part code. If not specified here, the system
uses the account numbers specified in the Part Master and then the
default from the General Ledger Interface Table.

Work In Process The default Work In
Process accounts for this product code. You can override this account
at the Quote/Engineering Master/Work Order. If not specified here
or in the work order, the default account in the General Ledger Interface
Table is used.

Variance The Purchase Price Variance
account for purchased parts or the Manufacturing variance account
for Fabricated parts. These accounts are only used in standard costing.
The variance account is used for purchased parts in an actual cost
system if costs are captured at Purchase Order price rather than invoice
value. This variance is taken when the Accounts Payable invoice is
matched to the Purchase Order Receiver in Accounts Payable Invoice
Entry.

Cost of Goods Sold The Cost of Goods
Sold account used for the specified product code. You can override
this accounts at the Customer Order line item in Customer Order Entry.
If not specified here or in Order Entry, the default COGS accounts
in the General Ledger Interface Table is used.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help