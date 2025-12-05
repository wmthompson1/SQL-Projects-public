Recalculating Costs




# Recalculating Costs

## Recalculating Distributions

The Recalculate distribution function corrects transactions that
have not been costed correctly. This function reexamines, for the
selected parts and dates, the receipts and related issues of that
part. If any discrepancies in quantity or cost are found, those transactions
are flagged as posting candidates and re-costed with the next run
of the Costing Utilities. There is no report that prints with this
function.

To recalculate balances:

1. Click the Recalculate
   Distributions toolbar button.

The Recalculate Distributions dialog box
appears.

2. If you want to VISUAL
   to recalculate distributions for a range of Part IDs, select the
   Recalculate Distributions for a Range of Part
   IDs option and enter the Starting and Ending Part IDs in
   the Starting and Ending ID fields.
3. If you want to filter
   the transactions that VISUAL processes, click the calendar button
   and select the Process Transactions date on which you want VISUAL
   to start.
4. Select the recalculation
   method you want VISUAL to use:

Recalculate Distributions
VISUAL recalculates the cost of out transactions based on existing
transaction links.

Reset P/O Receipts from
Matched Invoices VISUAL recalculates the cost of in transactions
from related A/P invoices.  VISUAL also updates any linked out
transactions.

Force FIFO Re-evaluation
VISUAL breaks existing FIFO links and calculates new FIFO links.
Purchases to and shipments from WIP are not affected.

5. Click the Start
   button.

## Recalculating Standard Costs

The Recalculate Standard Costs function updates the standard costs
of selected parts using the average of receipt costs for a given period.

For example, Part A may have a standard cost of $.50, which you
defined in Part Maintenance. If you have been receiving Part A with
costs between $.65 and $.99 for the past three months, you may want
to use the Recalculate Standard Costs function to update the standard
cost for Part A.

To recalculate standard costs:

1. Click the Recalculate
   Standard Costs toolbar button.

A list of your parts appears in the Recalculate
Standard Costs dialog box.

2. Select a part for which
   you want to recalculate the standard cost. You can select multiple
   parts using the SHIFT and CTRL keys.

You can click the Select
All button to select all of the parts.

If you want to search for a part:

1. Click the Search
   button.

A
blank line appears at the top of the table.

2. Enter the search criteria
   and press the ENTER key.

Only
the parts matching the criteria you entered appear in the table.

3. If you want to filter
   costs by the date on which you received them, click the appropriate
   calendar buttons and enter the Start and End Dates of the receipt
   period you want to use.

VISUAL uses the receipts of the chosen part
during this time period to recalculate the parts standard cost.

If VISUAL does not encounter and receipts
within the specified range and you want VISUAL to use the latest receipt
of the part for the recalculation, select the Use
the Latest Receipt if No Receipts Occurred in this Date Range
check box.

4. If you want VISUAL to
   process only differences between the transaction value and posted
   value, select the Exceptions Only check
   box in the Options section and enter the filter criteria.
5. Click the Recalc
   Selected Parts button.

A progress dialog appears as VISUAL recalculates
the standard costs for the parts you selected. The new costs appear
in the New Unit Cost column and on what VISUAL bases those costs appears
in the New Cost Based On column.

A check mark appear in the row header indicating
the changes that will occur to the costs in your database.

6. Click the Save
   button.

VISUAL saves the recalculated costs to your
database.

## Recalculating Inventory Balances and WIP Balances

It may become necessary to recalculate inventory balances presented
by the Inventory Balances Report for a specific financial period.
VISUAL allows you to recalculate the inventory balances of any period.
It is available from the File menu of Costing Utility. To recalculate
the inventory balance, the period must be open and the period must
be fully costed. The Inventory Balance recalculation does NOT create
posting candidates.

When upgrading it is imperative to run the Recalculate Inventory
Balances for the Post MFG Audit and the Recalculate WIP Balances reports,
and you must ensure that they are accurate. These options must be
run for the current open period. The application is not designed to
recalculate history on a period-by-period basis. In the future, you
can use these reports on a period basis for month-end reporting.

To recalculate inventory or WIP balances:

1. Click the Recalculate
   WIP Balances  or Recalculate Inventory
   Balances  toolbar button.

The Recalculate ... Balances dialog box
appears.

2. Enter the Starting and
   Ending IDs you want to use for the range of this recalculation.
3. Click the Posting Date
   calendar button and select the posting period for which you want
   to recalculate balances.
4. Click the Start
   button.

The parts VISUAL processes appears in the
top of the dialog box.

5. When VISUAL has finished,
   the balances dialog box closes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help