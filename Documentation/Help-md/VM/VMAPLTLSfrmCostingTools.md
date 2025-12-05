About the Costing Tools Window




# About the Costing Tools Window

Use Costing Tools to correct instances where summary records are
not supported by detail transactions. You can correct discrepancies
immediately or set them to be corrected the next time you run costing
utilities.

## Starting the Costing Tools Window

Select Admin, Costing
Tools.

## Concepts

This table shows links to the concepts behind the Costing Tools
Window.

| Concept | Description |
| [What are Costing Tools/Audits?](VMAPLTLSWhat.htm) | This topic describes the benefits of Costing Tools. |
| [Using Costing Tools](Using_Costing_Tools.htm) | This topic describes the auditing of costs. |
| [Costing Tools/Audit Overview](Costing_Tools_Audit_Overview.htm) | This topic lists the functions that are available in the Costing Tools window. |

## Tasks

This table shows the tasks that you can complete in the Allocation
Utilities window:

| Task | Description |
| [Costing Reports](Costing_Reports.htm) | Use this procedure to run costing reports. |
| [Recalculating Balances and Costs](Recalculating_Balances_and_Costs.htm) | Use this procedure to recalculate distributions, standard costs, inventory balances, and WIP balances. |

## Fields

Site ID

Specify the site whose transactions you are evaluating.

### Cost Analysis Tab

Cost to Check

Select the type of cost to check for inconsistencies.

Starting Order
ID and Ending Order ID

Use these fields to specify a range of transactions to check. To
check all transactions of the type that you selected in the Cost to
Check field, leave the Starting Order ID and Ending Order ID fields
blank.

Posting
Date

To run this cost analysis for a different posting date than the
current one, click the calendar button and select the date. You cannot
run costing analysis for closed or invalid posting dates.

Transactions

Select this check box to display columns for Total Transactions
and Total Prime Transaction in the table.

Burden

Select this check box to display burden costs in the table.

Detail

Select this check box to view detail amounts in the table. Exceptions
can occur when detail amounts do not match posted amounts.

Balance

If you selected WIP Balance in the Cost to Check field, this check
box is displayed. Select this check box to display WIP Balance values.

Exceptions Only

Select this check box to view only exceptions in the table.

Plus/Minus
%

If you selected the Exceptions Only check box, specify a variance
percentage. If the mismatch between the posted values and balance
or transaction amounts is above or below the percentage that you specify,
then the transaction is identified as an exception.

Plus/Minus Amount

If you selected the Exceptions Only check box, specify a variance
amount. If the mismatch between the posted values and balance or transaction
amounts is above or below the amount that you specify, then the transaction
is identified as an exception.

Costing Tools table

The table contains these columns:

Document ID

The source record of the transaction, such
as a purchase order or work order.

P/C

Indicates whether the transaction is a posting
candidate. Select a row and then click the Set Posting Candidate button
to indicate that the transaction will be costed the next time that
costing is run.

Total Transactions

The total value of the document. Select a
row and double-click the header to view more information.

Total Trans Detail

If you selected the Detail check box, this
column is displayed. The total value of the document is displayed.
Select a row and double-click the header to view the individual transactions
that contributed to the total. For example, if you are viewing WIP
costs, you can double-click the header to view the individual material
and labor transactions that contributed to the total.

Balance

If you selected WIP Balance in the Cost to
Check field, this column is displayed. This column shows the WIP balance.

Total Posted

For each document in the table, this column
shows the total that has been posted to the general ledger.

Remarks

If an exception has been identified, a description
of the exception is displayed.

### Project Cost Analysis Tab

If you are licensed to use Projects/A&D functionality, the Project
Cost Analysis tab is displayed. The tab contains these fields:

Project ID

Select the project to include in the analysis. To view information
for all projects, leave this field blank.

Version

If you specified a project ID, specify the version of the project
to view. This is the version number that was specified when the project
was created.

Cost to Check

Select the type of cost to check for inconsistencies.

Transactions

Select this check box to display columns for Total Transactions
and Total Prime Transaction in the table.

Detail

Select this check box to view detail amounts in the table. Exceptions
can occur when detail amounts do not match posted amounts.

Exceptions
Only

Select this check box to view only exceptions in the table.

Plus/Minus
%

If you selected the Exceptions Only check
box, specify a variance percentage. If the mismatch between the posted
values and balance or transaction amounts is above or below the percentage
that you specify, then the transaction is identified as an exception.

Plus/Minus
Amount

If you selected the Exceptions Only check
box, specify a variance amount. If the mismatch between the posted
values and balance or transaction amounts is above or below the amount
that you specify, then the transaction is identified as an exception.

Plus/Minus
Hours

For labor transactions, specify a variance amount. If the mismatch
between the posted values and labor amounts is above or below the
amount that you specify, then the transaction is identified as an
exception.

Starting
Order ID and Ending Order ID

Use these fields to specify a range of transactions to check. To
check all transactions of the type that you selected in the Cost to
Check field, leave the Starting Order ID and Ending Order ID fields
blank.

Posting
Date

To run this cost analysis for a different posting date than the
current one, click the calendar button and select the date. You cannot
run costing analysis for closed or invalid posting dates.

Material

If you selected Project Summary in the Cost to Check field, select
this check box to check material costs.

Adjustments

If you selected Project Summary in the Cost to Check field, select
this check box to check adjustments.

Labor

If you selected Project Summary in the Cost to Check field, select
this check box to check labor costs.

Payables

If you selected Project Summary in the Cost to Check field, select
this check box to check payments..

Issues

If you selected Project Summary in the Cost to Check field, select
this check box to check material issue costs.

General Journal

If you selected Project Summary in the Cost to Check field, select
this check box to check GJ transactions.

Project Cost Analysis
Table

The columns that are available in the Project Cost Analysis table
depend upon the information that you selected in the header. Columns
that include the word Detail in the column header are displayed only
if you select the Detail check box.

These columns are displayed when you are viewing purchases, AP transactions,
and GJ transactions:

Project ID

The ID of the project associated with the
document.

Document ID

The document that is the source of costs.

Source Type

The type of source represented by the document
ID.

P/C

Indicates whether the transaction is a posting
candidate. Select a row and then click the Set Posting Candidate button
to indicate that the transaction will be costed the next time that
costing is run.

Total Transactions

The total amount of all transactions associated
with the document. Double-click the column header to view information
such as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Trans Detail

The total amount of all transactions associated
with the document. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Total Prime Transactions

The total amount minus burden amounts. Double-click
the column header to view information such as the material cost, labor
cost, burden cost, WBS code associated with the cost, the rate ID,
and the period ID.

Total Trans Prime Detail

The total amount minus burden of all transactions
associated with the document. Double-click the column header to view
the individual sources of the amount.

Total Prime Posted

The total amount minus burden amounts that
has been posted to the general ledger. Double-click the column header
to view the individual postings made to the general ledger.

Total Burden Transactions

The total burden amount associated with the
document. Double-click the column header to view information such
as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Burden Trans Detail

The total burden amount associated with the
document. Double-click the column header to view the individual sources
of the amount.

Total Burden Posted

The total burden amount that has been posted
to the general ledger. Double-click the column header to view the
individual postings made to the general ledger.

Remarks

A description of the exception.

The Project Cost Analysis table contains these columns when you
are viewing WIP transactions:

Project ID

The ID of the project associated with the
document.

Document ID

The document that is the source of costs.

Source Type

The type of source represented by the document
ID.

P/C

Indicates whether the transaction is a posting
candidate. Select a row and then click the Set Posting Candidate button
to indicate that the transaction will be costed the next time that
costing is run.

Trans ID

The ID of the transaction.

Tran P/C

Indicates whether the individual transaction
is a posting candidate.

WBS Code

The WBS code associated with the transaction.

From WBS

Total Transactions

The total amount of all transactions associated
with the document. Double-click the column header to view information
such as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Trans Detail

The total amount of all transactions associated
with the document. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Total Trans Hours

The total number of labor hours associated
with the document. Double-click the column header to view information
such as the labor cost, burden cost, department ID, and cost category
ID.

Total Trans Detail Hours

The total number of labor hours associated
with the document. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Hours Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Total Prime Transactions

The total amount minus burden amounts. Double-click
the column header to view information such as the material cost, labor
cost, burden cost, WBS code associated with the cost, the rate ID,
and the period ID.

Total Trans Prime Detail

The total amount minus burden of all transactions
associated with the document. Double-click the column header to view
the individual sources of the amount.

Total Prime Posted

The total amount minus burden amounts that
has been posted to the general ledger. Double-click the column header
to view the individual postings made to the general ledger.

Total Burden Transactions

The total burden amount associated with the
document. Double-click the column header to view information such
as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Burden Trans Detail

The total burden amount associated with the
document. Double-click the column header to view the individual sources
of the amount.

Total Burden Posted

The total burden amount that has been posted
to the general ledger. Double-click the column header to view the
individual postings made to the general ledger.

Remarks

A description of the exception.

The table contains these columns when you are viewing adjustments:

Project ID

The ID of the project associated with the
document.

Document ID

The document that is the source of costs.

P/C

Indicates whether the transaction is a posting
candidate. Select a row and then click the Set Posting Candidate button
to indicate that the transaction will be costed the next time that
costing is run.

Trans ID

The ID of the transaction.

Transfer Trans ID

WBS Code

The WBS code associated with the transaction.

From WBS

Total Transactions

The total amount of all transactions associated
with the document. Double-click the column header to view information
such as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Trans Detail

The total amount of all transactions associated
with the document. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Total Prime Transactions

The total amount minus burden amounts. Double-click
the column header to view information such as the material cost, labor
cost, burden cost, WBS code associated with the cost, the rate ID,
and the period ID.

Total Trans Prime Detail

The total amount minus burden of all transactions
associated with the document. Double-click the column header to view
the individual sources of the amount.

Total Prime Posted

The total amount minus burden amounts that
has been posted to the general ledger. Double-click the column header
to view the individual postings made to the general ledger.

Total Burden Transactions

The total burden amount associated with the
document. Double-click the column header to view information such
as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Burden Trans Detail

The total burden amount associated with the
document. Double-click the column header to view the individual sources
of the amount.

Total Burden Posted

The total burden amount that has been posted
to the general ledger. Double-click the column header to view the
individual postings made to the general ledger.

Remarks

A description of the exception.

The table contains these columns when you are viewing project summary
information:

Project ID

The ID of the project associated with the
journal.

Description

The journal that generated the costs.

Department ID

The Department ID associated with the cost.

Cost Category ID

The category of the cost.

WBS Code

The WBS code associated with the cost.

From WBS

Proj Ref Sub ID

The Sub ID associated with the cost.

Proj Ref Seq No

The sequence number associated with the cost.

Project Summary Amount

The total summary amount.

Total Trans Detail

The total amount of all transactions associated
with the journal. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Total Trans Hours

The total number of labor hours associated
with the journal. Double-click the column header to view information
such as the labor cost, burden cost, department ID, and cost category
ID.

Total Trans Detail Hours

The total number of labor hours associated
with the journal. Double-click the column header to view the individual
sources of the amount, such as the amount for each burden category.

Total Hours Posted

The total amount that has been posted to the
general ledger. Double-click the column header to view the individual
postings made to the general ledger.

Proj Summary Prime Amount

The total amount minus burden amounts.

Total Trans Prime Detail

The total amount minus burden of all transactions
associated with the document. Double-click the column header to view
the individual sources of the amount.

Total Prime Posted

The total amount minus burden amounts that
has been posted to the general ledger. Double-click the column header
to view the individual postings made to the general ledger.

Total Burden Transactions

The total burden amount associated with the
document. Double-click the column header to view information such
as the material cost, labor cost, burden cost, WBS code associated
with the cost, the rate ID, and the period ID.

Total Burden Trans Detail

The total burden amount associated with the
document. Double-click the column header to view the individual sources
of the amount.

Total Burden Posted

The total burden amount that has been posted
to the general ledger. Double-click the column header to view the
individual postings made to the general ledger.

Remarks

A description of the exception.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Tools.htm) User-defined Help