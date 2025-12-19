Running G/L Account Transaction Queries




# Running G/L Account Transaction Queries

Use the G/L Account Transaction inquiry after closing your accounting
period to view all transactions for your projects.

## Running G/L Account Transactions Queries

To run G/L Account Transactions queries:

1. To access the G/L Transactions
   Query, from the Project Summary window, select Info, Inquiry /
   Print G/L Transactions.  The Inquiry / Print G/L Transactions
   window appears.
2. Do
   one of these steps:
3. If you are
   printing the report for a single site, click the Standard
   tab. If you are licensed to use multiple sites, click the Site
   ID arrow and select the site to include in the report.
4. If you are
   printing the report for multiple sites, click the Advanced
   tab. Click the Site ID(s) arrow and select the sites to include
   in the report. Click the Currency ID arrow and select the currency
   to use for the report.

3. Select the information
   you would like to view in the report in the Filters box. Your
   options are:

By Date Range
Select By Date Range to enter a time period
for which you want to view information. Enter dates in the Starting
Date and Ending Date fields, or click the Calendar
button to select a date from the calendar. To view all dates, leave
the Date fields blank.

If you select Project,
WBS, Dept or Project, Batch
Type in the Sequence box (see step 3), you can further narrow
your results by selecting starting and ending project IDs in the Project
ID fields. Click the /powse button to select
project IDs from a list. To view all projects, leave the Project ID
fields blank.

By Batch Number
Select By Batch Number to view the report
by posting batch number. Enter batch numbers in the Starting Batch
ID and Ending Batch ID fields, or click the browse button to select
batch IDs. To view all batch IDs, leave the Batch ID fields blank.

By Project Info Filters
Select By Project Info Filters to limit the information to transactions
associated with projects that match the criteria you determine in
the Project Info box. When you select By Project Info Filters, the
Project Info box becomes active. Click the [Project
Info](VMPRJSUMfrmProjectSummary.md) button and select the project criteria. If you select By
Project Filters, the Starting Date and Ending Date fields become active.
In the Starting Date field, enter the first date of the period you
would like to view. In the Ending Date field, enter the last day of
the period you would like to view. The dates are adjusted to the last
date of the period.

4. In the Sequence box,
   select the sort order for the report. The options available to
   you in the Filters box vary depending on your selection in the
   Sequence box:

G/L Account ID, Batch
Type Select this option to sort the report by G/L Account
ID first, then by Batch Type.

Project, WBS, Dept
Select this option to sort the report first by Project ID, then
by WBS code, then by Department. If you select this option and have
chosen to view a report, only a detailed report is available.

Project, Batch Type
Select this option to sort the report first by Project ID, then
by Batch Type.

Batch Type Select
this option to sort the report by Batch Type.

Batch ID, Project
Select this option to sort the report first by Batch ID, then by
Project. This option is only available if you select By
Batch Number in the Filters box. If you select this option
and have chosen to output a report, only a detailed report is available.

Batch ID, G/L Account
ID Select this option to sort the report first by Batch ID,
then by G/L Account ID. This option is only available if you select
By Batch Number in the Filters box. If you
select this option, only a detailed report is available.

5. In the Transaction Type
   box, select the type of transaction you would like to view in
   the report. Your choices are:

* Purchases
* Labor
* Adjustments
* Project Transfers
* Accounts Payable
* General Journal

6. Select Print
   All to view all transaction types in the report.
7. In the Transactions
   box, select from the following:

Print Unposted Txs
Select this option to view only those transactions that have not
yet posted to the General Ledger. This option is not available if
you selected to view the report by Batch ID.

Print Posted Txs
Select this option to view only posted transactions. This option
is selected automatically if you choose to view the report by Batch
ID.

Print Both Select
this option to view both posted and unposted transactions. This option
is not available if you selected to view the report by Batch ID.

8. To further define your
   report, select or clear check boxes as follows:

Current User Only
Select the Current User Only check box to view transactions that
the current user inputted. To view all transactions from all users,
clear this check box.

Include Rev Recg
Select this check box to include revenue recognition transactions
in the report. Clear the check box to omit revenue recognition transactions
from the report.

Include Rev Recg WIP
Only Select this check box to view revenue recognition for
work in process projects only. Clear this check box to include all
revenue recognition transactions. This check box is only available
if you select the Include Rev Recg check box.

9. In the Mode box, select
   Inquiry Only to view the results of
   your query in the table. Select Report Only
   to output a report.
10. If you select Report Only in the Mode box, select the type
    of report you would like to view. See Report Contents, below,
    for more on the information that each type of report produces.

* Detail
* Summary
* Summary w/subtotals

11. Select how you would
    like to output the report by clicking the View arrow. Your choices
    are:

View Select
this option to view the report on your computer screen.

Print Select
this option to print your report. If you choose this option, click
the Print Setup button to select the printer
you want to use.

File Select
this option to output the report to a file. The report is exported
to a comma delimited file, enabling you to import the file into Microsoft
Excel or other spreadsheet program that supports the import of comma
delimited text.

Email Select
this option to email the report.

To view a summary report, select the Summary check box. To view a detailed report,
leave the Summary check box blank.

12. Click Ok.

If you selected Report
Only in the Mode box, the report is outputted. The criteria
you chose in the Print G/L Transactions window appear at the top of
the report.

If you selected Inquiry
Only in the Mode box, the information based on the criteria
you chose appears in the table.

If a plus sign appears in the Sum column,
you can double click the row header to view more detailed information.
You can continue to drill down to individual transactions.

## Report Contents

Refer to the following descriptions of the contents of the various
reports to determine which report you would like to run.

### Date Range Reports Sequenced by G/L Account, Batch Type

The detailed report displays each transaction by source type. Included
are the G/L Account ID, the G/L Account Description, the Source code,
the Site ID, the Batch ID, and credit and debit amounts. Transactions
are subtotaled by source type, and a grand total is printed at the
end of the report.

The summary report displays a total for each source type. A grand
total is printed at the bottom of the report. The summary with subtotals
report displays a subtotal for each batch ID within a G/L account.

### Date Range Reports Sequenced by Project, WBS, Dept

The detailed version of this report contains the same information
as the report sequenced by G/L Account, but the transactions are listed
by Project/WBS/Department/Cost Category. Subtotals and grand totals
are provided.

There is no summary report for Accounting Period Reports Sequenced
by Project, G/L Account.

### Date Range Reports Sequenced by Project, Batch Type

The detailed report displays transactions for each Project/Source
Type combination. Each transaction listed includes the G/L Account
ID, the G/L Account Description, the Source Code, the Site ID, the
Batch ID, and Credit and Debit amounts. Subtotals are provided for
each Project/Source Type combination, and a grand total of all transactions
is provided.

In the summary version, each project is listed with its corresponding
source types. The total debits and credits for each source type is
displayed. A subtotal is figured for each project, and a grand total
is computed at the end the report.

### Batch ID Reports Sequenced by G/L Account ID, Batch Type

The detailed report is subdivided into G/L Account IDs. All transactions
for each G/L account ID are listed. The transaction lines include
the Source Type, Source ID, Project, WBS, Department, Cost Category,
Site ID, Batch ID, and credit and debit amounts. Transactions are
subtotaled by G/L account, and a grand total is printed at the end
of the report.

The summary report displays a total for each G/L account. A grand
total is printed at the bottom of the report.

The summary report with subtotals displays a subtotal for each Batch
Type within each G/L Account.

### Batch ID Reports Sequenced by Project, WBS, Department

The detailed version of this report contains the same information
as the report sequenced by G/L Account, but the transactions are listed
by Project/WBS/Department/Cost Category. Subtotals and grand totals
are provided.

There is no summary report for Accounting Period Reports Sequenced
by Project, G/L Account.

### Batch ID Reports Sequenced by Project, Batch Type

The detailed report displays transactions for each Project/Batch
Type combination. Each transaction listed includes the G/L Account
ID, the G/L Account Description, the Source Code, the Site ID, the
Batch ID, and Credit and Debit amounts. Subtotals are provided for
each Project/Source Type combination, and a grand total of all transactions
is provided.

In the summary version, each project is listed with the total debit
and credit amounts. In the summary version with subtotals report,
each project is listed with its corresponding batch types. The total
debits and credits for each batch type is displayed. A subtotal is
figured for each project, and a grand total is computed at the end
the report.

### Batch ID Reports Sequenced by Batch Type

In the detailed report, all the transactions for each batch type
are listed. For each transaction, the G/L Account ID, G/L Account
Description, Source Code, Site ID, Batch ID, Debit amount, and Credit
amount are listed. The report shows a subtotal for each source type,
and a grand total is printed at the end of the report.

The summary report shows the transaction total for each batch type
along with a grand total at the end of the report. There is no summary
with subtotals report.

### Batch ID Reports Sequenced by Batch ID, Project

The detailed report is /poken into Batch IDs with a description
of the Batch ID and the date the batch was posted. Transactions in
each batch are listed by Project name/WBS/Department/Cost Category.
The Source ID, G/L Account ID, Transaction Type, Site ID, Debit, and
Credit amounts are listed for each transaction. The report is subtotaled
by batch, and a grand total for all batches is printed at the end
of the report.

There is no summary or summary with subtotals version of this report.

### Batch ID Reports Sequenced by Batch ID, G/L Account ID

The detailed report is /poken into Batch IDs with a description
of the Batch ID and the date the batch was posted. Each transaction
in the batch is listed by G/L Account ID. The transaction type, source
ID, Project name, WBS code, Department, Cost Category, Site ID, Debit,
and Credit amounts are also listed. The report is subtotaled by batch,
and a grand total for all batches is printed at the end of the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Summary.md) User-defined Help