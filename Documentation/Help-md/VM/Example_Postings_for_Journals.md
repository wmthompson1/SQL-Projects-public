Example Postings for Journals




# Example Postings for Journals

The account used is based on how you elect to implement
your system. You can use a lowest level G/L interface account or specify
the accounts to use at the Part, Work Order, or Product code level.
This should be decided early on in the implementation of the system.

The following transaction templates are used for each journal type:

## Quick TOC

- [Work Order Journals](#work-order-journals)
- [Finished Goods Receipts Journals](#finished-goods-receipts-journals)
- [Sales (Shipments) Journals](#sales-shipments-journals)
- [Inventory Adjustments Journals](#inventory-adjustments-journals)
- [Indirect Labor Journals](#indirect-labor-journals)
- [Purchase Receipt Journals](#purchase-receipt-journals)


## Work Order Journals

First attempts to use work order WIP accounts, then the Product
Code WIP accounts, and then default WIP accounts from the General
Ledger Interface table.

First attempts to use the Product Code table, then the part accounts,
then default inventory accounts from the General Ledger Interface
table.

First attempts to use shop resource labor and burden accounts, then
default labor and burdenaccounts from the General Ledger Interface
table.

## Finished Goods Receipts Journals

Use the Product Code accounts, the part accounts, then default inventory
accounts from the General Ledger Interface table.

First attempts to use work order WIP accounts, then the Product
Code accounts, then default WIP accounts from the Interface table.

Manufacturing variance account from the Product Code Interface table,
then the General Ledger Account Interface (standard cost only).

## Sales (Shipments) Journals

First attempts to use line item COGS accounts from the Customer
Order Entry, then the Product Code COGS Account, then default COGS
accounts from the General Ledger Interface table.

First attempts to use the Product Code Account, then the part accounts,
then default inventory accounts from the General Ledger interface
table.

## Inventory Adjustments Journals

First attempts to use the Product Code Accounts, then the part accounts,
then default inventory accounts from the General Ledger.

First attempts to use the account specified by the user in the Inventory
Transaction, then the default Adjustment Account from the Product
Code table, the default Inventory Adjustment Account from the Interface
table.

## Indirect Labor Journals

First attempts to use the account specified by the user in the Labor
transaction, then default indirect labor account from the General
Ledger Interface table.

Uses the Factory Payroll Account from the General Ledger Interface
table.

## Purchase Receipt Journals

Use the Product Code Account table, then part inventory account
if the line item expense account is left blank. If the PO line item
account, the Product Code Part Inventory or the part inventory accounts
are blank, the Default Inventory account in the G/L Interface is used.

The PO accrual account from the G/L Interface is used for all PO
receipts. This account is credited when the A/P Invoice is matched
to the Purchase Order Receipt.

When a Purchase Order line item is linked to job requirement(s),
the journal posts the receipt and the WIP journal posts the automatic
issue that occurs when the PO is received.

## Work Order Journals

For debit transactions, first attempts to use work order WIP accounts,
then the Product Code WIP accounts, and then default WIP accounts
from the General Ledger Interface table.

For credit transactions, first attempts to use shop resource absorption
account, then default absorption accounts from the General Ledger
Interface table.

## Finished Goods Receipts Journals

For debit transactions, use the part accounts, then the Product
Code accounts, then default inventory accounts from the General Ledger
Interface table.

For credit transactions, first attempts to use work order WIP accounts,
then the Product Code accounts, then default WIP accounts from the
Interface table.

Manufacturing variance account from the Product Code Interface table,
then the General Ledger Account Interface (standard cost only).

## Sales (Shipments) Journals

For debit transactions, first attempts to use line item COGS accounts
from the Customer Order Entry, then the Product Code COGS Account,
then default COGS accounts from the General Ledger Interface table.

For credit transactions, first attempts to use the part accounts,
then the Product Code Account, then default inventory accounts from
the General Ledger interface table.

## Inventory Adjustment Journals

For debit transactions, first attempts to use the part accounts,
then the Product Code accounts, then default inventory accounts from
the General Ledger.

For credit transactions, first attempts to use the account specified
by the user in the Inventory Transaction, then the default Adjustment
Account from the Product Code table, and then the default Inventory
Adjustment Account from the Interface table.

## Indirect Labor Journals

For debit transactions, first attempts to use the account specified
by the user in the Labor transaction, then default indirect labor
account from the General Ledger Interface table.

Uses the Factory Payroll Account from the General Ledger Interface
table.

Note that each template attempts to apply a specific account, usually
an overridden account entered by the user for the specific order or
the Product Code table, and then falls back on the interface account
as the default. Thus, the user must setup the interface in the event
that an account is not overridden.

|  |  |
| --- | --- |
| IMPORTNT.gif | If you override one account in the specific category but leave the other accounts blank, the system still defaults in the non overridden categories to the interface table accounts. If you want to be sure that you always get the result you expected, override all four accounts, even if it is the same account in each category. |

In entries that end with s in the templates above, signifying more
than one account, the system may produce more than one transaction
based on the users specified account numbers. Thus, the system makes
every attempt to eliminate duplicate accounts on either side of the
transaction.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help