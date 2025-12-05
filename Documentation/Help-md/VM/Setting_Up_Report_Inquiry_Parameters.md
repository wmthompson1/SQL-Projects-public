Setting Up Report / Inquiry Parameters




# Setting Up Report / Inquiry Parameters

To set up the parameters for your report or inquiry:

1. In the Filters box,
   select how you would like to limit the information for the report.
   Your choices are:

By Date Range
Select By Date Range to limit the information
to transactions that occurred on certain dates.

If you choose By Date Range, the Starting
Date and Ending Date fields become available. In the Starting Date
field, enter the first date of the period you would like to view.
In the Ending Date field, enter the last day of the period you would
like to view. VISUAL adjusts the dates to the last date of the period.

If you choose By Date Range, the Starting
and Ending Account ID fields become active. Use the Starting and Ending
Account ID fields to limit the information in the report to certain
accounts. In the Starting Account ID field, enter the first account
ID you would like to view in the report. In the Ending Account ID
field, enter the last account ID you would like to view in the report.
VISUAL displays the accounts you specify and all accounts that fall
in between.

By Batch Number
Select By Batch Number to limit the information
to transactions posted in particular batches.

If you select By Batch Number, the Starting
Batch ID and Ending Batch ID fields become available. In the Starting
Batch ID field, enter the first Batch ID you would like to view, or
click the Starting Batch ID button to choose
a Batch ID from a table. In the Ending Batch ID field, enter the last
Batch ID you would like to view, or click the Ending
Batch ID button to choose a Batch ID from a table. To view
a single Batch ID, enter the same ID in the Starting and Ending Batch
ID fields. To view all Batch IDs, leave the Batch ID fields blank.

By Project Info Filters
Select By Project Info Filters to limit
the information to transactions associated with projects that match
the criteria you determine in the Project Info box.

When you select By Project Info Filters,
the Project Info box becomes active. Click the Project
Info button and select the project criteria.

If you select By Project Filters, the Starting
Date and Ending Date fields become active. In the Starting Date field,
enter the first date of the period you would like to view. In the
Ending Date field, enter the last day of the period you would like
to view. VISUAL adjusts the dates to the last date of the period.

If you select By Project Filters but do
not specify any parameters in the Project Info box, VISUAL will not
output the report / inquiry.

2. In the Sequence box,
   select the sort order for the report / inquiry. Your choices are:

G/L Account ID, Batch
Type Select this option to sort the report by G/L Account
ID first, then by Batch Type.

Project, WBS, Dept
Select this option to sort the report first by Project ID, then
by WBS code, then by Department. If you select this option and have
chosen to view a report, only a detailed report is available.

Project, Batch Type
Select this option to sort the report first by Project ID, then
by Batch Type. This option is not available if you are running the
report or inquiry by Project Info Filters.

Batch Type Select
this option to sort the report by Batch Type. This option is not available
if you are running the report or inquiry by Project Info Filters.

Burden Cat ID, G/L Acct
ID Select this option to sort the report by Burden Category
ID/G/L Account ID combination.

G/L Acct ID, Burden Cat
ID Select this option to sort the report by G/L Account ID/Burden
Category ID combination.

Proj, WBS, Seq, Dept,
Burden Category Select this option to sort first by project
ID, then by WBS code, then by project sequence ID, then by burden
category, and then by G/L Account ID. This sort option is particularly
useful in analyzing move transactions. Note that the label in the
drop-down menu is truncated.

Proj, WBS, Seq, Dept,
G/L Account ID Select this option to sort first by project
ID, then by WBS code, then by project sequence ID, then by G/L Acct
ID, and then by Burden Category. This sort option is particularly
useful in analyzing move transactions. Note that the label in the
drop-down menu is truncated.

3. In the Transaction Type
   box, select the type of transaction you would like to view in
   the report. Your choices are:
4. Purchases
5. Labor
6. Adjustments
7. Project Transfers
   (includes Project Transfers and WIP Issues)
8. Move Transactions
   (includes Project Transfers, WIP issues, Adjust Outs, and Receipt
   Returns)
9. Accounts Payable
10. General Journal

Select Print All to view all transaction
types.

4. In the Transactions
   box, select from the following:

Print Unposted Txs
- Select this option to view only those transactions that have not
yet posted to the General Ledger. This option is not available if
you selected to view the report by Batch ID.

Print Posted Txs
- Select this option to view only posted transactions. This option
is selected automatically if you choose to view the report by Batch
ID.

Print Both - Select
this option to view both posted and unposted transactions. This option
is not available if you selected to view the report by Batch ID.

5. To further define your
   report, select or clear check boxes as follows:

Current User Only
- Select the Current User Only check box to view transactions that
the current user inputted. To view all transactions from all users,
clear this check box.

Include Rev Recg
- Select this check box to include revenue recognition transactions
in the report. Clear the check box to omit revenue recognition transactions
from the report.

Include Rev Recg WIP
Only - Select this check box to view revenue recognition for
work in process projects only. Clear this check box to include all
revenue recognition transactions. This check box is only available
if you select the Include Rev Recg check box.