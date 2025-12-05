Product Code G/L Interface Account Table Overrides




# Product Code G/L Interface Account Table Overrides

Accounts by Product Code

The accounts used by the Costing Utility program can be a function
of the Product Code Table from Part Maintenance. Here you can specify
the accounts to be used by a parts product code unless an override
account was specified elsewhere. If no product code is specified in
the part, then the appropriate override account is used.

You can specify the following the types of accounts here:

Revenue Account - The default account
for use when shipments are invoiced. You can override this account
at the Customer Order Line. The default account is from the General
Ledger Interface Accounts Table. (Default Accounts Receivable Sales
Revenue).

Adjustment - The default to be used when
making inventory adjustments. You can override this account when entering
inventory adjustments in Inventory Transaction Entry. If not specified
here, VISUAL uses the adjustment account from the General Ledger Interface
table.

Inventory - The Raw Material or Finished
Goods accounts for use when receiving, issuing, returning, or adjusting
inventory for a specified product code. If not specified here, VISUAL
uses the account numbers specified in the Part Master and then the
default from the General Ledger Interface Accounts table.

Work In Process - The default Work In
Process accounts for this product code. You can override this account
at the Quote / Engineering Master / Work Order levels. If not specified
here or in the work order, VISUAL uses the default account in the
General Ledger Interface Accounts table.

Variance - The Purchase Price Variance
Account for purchased parts or the Manufacturing Variance Account
for fabricated parts. These accounts are only used in standard costing.
The variance account is used for purchased parts in an actual cost
system if costs are captured at Purchase Order price rather than invoice
value. This variance is taken when the Accounts Payable invoice is
matched to the Purchase Order Receiver in Accounts Payable Invoice
Entry.

Cost of Goods Sold - The Cost of Goods
Sold account used for the specified product code. You can override
this accounts at the Customer Order line item in Customer Order Entry.
If not specified here or in Order Entry, VISUAL uses the default COGS
accounts in the General Ledger Interface Accounts table.

Account Override Sequence Summary

Inventory

|  |  |  |
| --- | --- | --- |
| Raw & Finished Goods | Work in Process | Cost of Goods Sold |
| 1. Part Master File | 1. Work Order | 1. Customer Order Line |
| 2. Product Code Table | 2. Product Code Table | 2. Product Code Table |
| 3. G/L Interface Table | 3. G/L Interface Table | 3. G/L Interface Table |

Purchase Price Variance

|  |  |  |
| --- | --- | --- |
| Manufacturing Variance | Inventory Adjustments | Revenue |
| 1. Product Code Table | 1. Inventory Transaction | 1. Customer Order Line |
| 2. G/L Interface Table | 2. Product Code Table | 2. Product Code Table |
| 3. G/L Interface Table |  | 3. G/L Interface Table |

|  |  |
| --- | --- |
| Absorbed Labor and Burden | Indirect Labor Expense |
| 1. Shop Resource | 1. Labor Ticket Entry |
| 2. G/L Interface Table | 2. Indirect Code |
|  | 3. G/L Interface Table |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help