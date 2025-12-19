Recalculating Balances and Costs




# Recalculating Balances and Costs

## Recalculating Distributions

The Recalculate distribution function corrects transactions that
have not been costed correctly. This function reexamines, for the
selected parts and dates, the receipts and related issues of that
part. If any discrepancies in quantity or cost are found, those transactions
are flagged as posting candidates and re-costed with the next run
of the Costing Utilities. There is no report that prints with this
function.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are recalculating distributions.
   If you are licensed to use a single site, this field is unavailable.
2. Select Recalculate Distributions
   from the File menu.

The Recalculate Distributions dialog box
appears.

3. Enter the Starting and
   Ending Part IDs in the Starting and Ending ID fields.
4. Enter a date in the
   Process Transactions On or After field in the Process Transactions
   On or After field.
5. If appropriate, select
   the Reset P/O Receipts from Matched Invoices check box.
6. Click the Start button
   to recalculate the distributions.

## Recalculating Standard Costs

The Recalculate Standard Costs function updates the standard costs
of selected parts using the average of receipt costs for a given period.

For example, Part A may have a standard cost of $.50, which you
defined in Part Maintenance. If, however, you have been receiving
Part A with costs between $.65 and $.99 for the past three months,
you may want to use the Recalculate Standard Costs function to update
the standard cost for Part A.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are recalculating costs.
   If you are licensed to use a single site, this field is unavailable.
2. Select Recalculate
   Standard Costs from the File menu.

The Recalculate Standard Costs dialog box
appears, with a list of parts in your database.

3. Select a part for which
   you want to recalculate the standard cost.

You can click the Select
All button to select all of the parts, or click the Search
button to search for a specific part.

4. Enter the Start Date
   and End Date of the receipt period in the Start Date and End date
   fields.

VISUAL uses the receipts of the chosen part
during this time period to recalculate the parts standard cost.

5. If appropriate, select
   the Use the Latest Receipt if No Receipts Occurred
   in this Date Range check box.
6. Click the Recalc
   Selected Parts button.

VISUAL recalculates the standard costs for
the selected parts. The new costs appear in the New Unit Cost column.

7. Click the Save
   button to save the new standard costs, or Close to close the dialog
   box without saving the new standard costs.

### Exporting the Recalculate Standard Costs table to Microsoft Excel

You can export the contents of the table in the Recalculate Standard
Costs dialog to Microsoft Excel. Click the Send to Microsoft Excel
button.

## Recalculating Inventory Balances or WIP Balances

It may become necessary to recalculate inventory balances
presented by the Inventory Balances Report for a specific financial
period. VISUAL allows you to recalculate the inventory balances of
any period. It is available from the File menu of Costing Utility.
To recalculate the inventory balance, the period must be open and
the period must be fully costed. The Inventory Balance recalculation
does NOT create posting candidates.

When upgrading it is imperative to run the Recalculate Inventory
Balances for the Post MFG Audit and the Recalculate WIP Balances reports,
and you must ensure that they are accurate. These options must be
run for the current open period. The application is not designed to
recalculate history on a period-by-period basis. In the future, you
can use these reports on a period basis for month-end reporting.

If you are licensed to use multiple sites, click the Site ID drop-down
button and select the site to use to recalculate balances, then access
the dialog box.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Tools.md) User-defined Help