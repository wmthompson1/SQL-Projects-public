Specifying Information on the Defaults Tab




# Specifying Information on the Defaults Tab

Use the Defaults tab to specify requisition approval group names,
how purchase requisition approval tasks are generated, and requisition
rejection codes.

To specify this information:

1. Click the Defaults
   tab.
2. In each of the Approval
   Label fields, specify the label to display on the Approval tab
   of the Purchase Requisition Entry window.
3. To generate all purchase
   requisition approval tasks for groups simultaneously, select the
   Generate All Tasks Simultaneously check
   box. To generate approval tasks in sequential order, clear the
   check box. When you clear the check box, the first group must
   approve the purchase requisition before the second groups approval
   tasks are generated.
4. To require users to
   enter passwords for fields you have secured, select the Passwords Required for Secured Fields check
   box.
5. To create one batch
   per transaction when you post to the general ledger, select the
   Create Financial Batches with Only One Transaction.
   If you post multiple transactions to the general ledger at the
   same time, a batch is created for each transaction. Clear this
   check box to create one batch for all transactions in the posting.
6. In the AP/AR Cash Management
   section, specify the default bank accounts to use for this entity.
   You can override the defaults on individual transactions. Specify
   this information:

Cash Receipt Default
Bank Acct Click the browse button and select the default
account to use for cash receipts. You can select any bank account
associated with the current entity.

Cash Payment Default
Bank Acct Click the browse button and select the default
account to use for payments. You can select any bank account associated
with the current entity.

7. In the Customer Balance
   Method section, specify how to calculated the customers open
   balance. Click one of these options:

Orders, uninvoiced shipments
and unpaid invoices Click this option to calculate the customers
open balance as the total of open orders, uninvoiced shipments, and
unpaid invoices. An order line is considered open if the line status
is Released, Firmed, or On Hold. An order line is also considered
open if the line status is Inherit and the header status of the order
is Released, Firmed, or On Hold.

Uninvoiced shipments
and unpaid invoices Click this option to calculate the customers
open balance as the total of uninvoiced shipments and unpaid invoices.
Open customer order lines are excluded from the calculation.

Unpaid A/R Invoices
Click this option to calculate the customers open balance as the
total of unpaid accounts receivable invoices only.

8. Click Save.

## Specifying Task Rejection Codes

Before creating any purchase requisitions, add the rejection codes
you want to use to your database. Rejection codes help you classify
rejected purchase requisition tasks.

Purchase Requisition Entry and ECN Entry share a common Rejection
Code table. This feature is available from both the ECN tab in Site
Maintenance and the Default tab in Accounting Entity Maintenance.

1. Click Rejection
   Codes.
2. Click Insert.
3. Specify this information:

Code Specify
an identifier for the rejection code.

Description
Specify a description for this code.

4. Click Save.