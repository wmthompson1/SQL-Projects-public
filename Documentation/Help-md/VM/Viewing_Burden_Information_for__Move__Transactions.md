Viewing Burden Information for "Move" Transactions




# Viewing Burden Information for "Move" Transactions

Certain transactions use a single burden category to report burden
costs. These transactions are called move transactions. These move
transactions report burden in a single category:

* Transfer from commercial
  inventory to project inventory
* Transfer from project inventory
  to different project inventory
* Transfer from project inventory
  to commercial inventory
* Adjust out of project inventory
  for purchase parts
* Adjust out project inventory
  for fabricated parts
* WIP issue commercial inventory
  to project work orders
* WIP issue project inventory
  to different project work order
* WIP issue project inventory
  to different WBS in the same project (WBS transfers flagged)
* WIP issue returns transferred
  to another project.
* Finished goods receipts
  transferred to another project.
* Purchase receipt returns
  for project inventory
* Any cost updates for these
  transaction that may have taken place in a previous period

Additional transactions can be classified as move transactions,
but these other transactions do not create burden.

When you view burden information for move transactions, the Burden
Details dialog shows the actual burden transactions posted to your
general ledger. Where possible, the individual burden amounts that
made up the actual amounts are also listed. These individual burden
amounts are identified as SUPPLY transactions in the table. To identify
the supply burden transactions, the INV\_TRANS\_DIST and BURDEN\_DIST\_DETAIL
tables are examined to find the cost layers linked to the actual burden
amounts.

Depending on the move transaction, the total of the supply transactions
may not match the burden amount actually posted. In certain cases,
such as transfers of finished goods and WIP issue returns, cost layers
of the supply burden transactions do not generate a burden transaction.
For these move layers, the ID of the work order that produced the
goods is provided for your further analysis.

To analyze the transactions:

1. In the Print G/L Transactions
   dialog box, specify this information:

Mode Specify
Inquiry Only.

Transaction Type
Specify Project Transfers to view only project transfer and WIP
issue transactions. Specify Move Transactions to view project transfers,
WIP issues, adjust out transactions, and purchase receipt returns.

Sequence Specify
the sequence for the inquiry. To ease the identification of burden
line items, select either Proj, WBS, Seq, Dept, Burden Category, G/L
Account ID or Proj, WBS, Seq, Dept, G/L Account ID, Burden Category.

2. Complete the remaining
   header information as necessary.
3. Click Ok.
4. You can view burden
   details for an individual burden transaction row or for a summary
   row. To view details, double-click the row. To view details for
   a summary row, you must first expand the row to display all child
   transactions. Otherwise, double-clicking on the header row expands
   the child transactions instead of opening the burden summary information.

The header of the Burden Distributions dialog
box shows the type of information you are viewing. If you are viewing
information for a summary row, then Summary is inserted in the header.
If you are viewing information for a detail row, then Detail is inserted.

The Burden Distributions dialog box shows
the same information as the standard [Burden
Detail](Viewing_Burden_Information.md) dialog box. This information is also shown:

Inv Tx Qty The
total quantity of materials for the supplying inventory transaction
is displayed.

Sup Debit Amount
The total burden debit amount for the supplying inventory transaction.

Sup Credit Amount
The total burden credit amount for the supplying inventory transaction.

Dist Debit Amount
The moved burden debit amount reported in the BURDEN\_DIST\_DETAIL
table.

Dist Credit Amount
The moved credit amount reported in the BURDEN\_DIST\_DETAIL table.

Dist Qty The
move quantity for the supply layer for the actual transaction.

Dist-In Trans ID
The ID of the transaction that supplies the quantity for the actual
transaction.

Work Order ID
For finished goods and WIP Issue return transfers, the ID of the
work order for the supply layer.

Row Type For
the transactions that were formally posted to your general ledger,
ACTUAL is displayed. For the transactions that fed into the total
actual burden amounts, SUPPLY is displayed.

5. To filter the information
   in the table, specify this information:

Burden Category ID
To view transactions for a particular burden category ID, specify
the ID in this field.

Row Type To
view the actual burden postings only, specify ACTUAL. To view the
cost layers that supplied the values for the actual burden postings,
specify SUPPLY. To view all transaction, specify \*\* All \*\*.

6. To change the currency
   of the amounts in the table, specify the currency to use in the
   Currency ID field. If you are viewing transactions for a single
   site, you can use any currency assigned to the sites parent entity.
   If you are viewing transactions for multiple sites, you can select
   only currencies common to each sites parent entity.