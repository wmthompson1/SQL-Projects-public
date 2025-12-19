Printing/Viewing Inventory Valuation Report




# Printing/Viewing Inventory Valuation Report

To print or view valuation reports:

1. Select the Inventory
   Valuation Report from the Inventory menu.

The Print Part Inventory Valuation Report
window appears.

2. Click the Site ID(s)
   arrow and select the site(s) to use.
3. Click the Report
   Currency arrow and select the currency for the report.
   If you are printing a report for a single site, the entity currency
   associated with the site is inserted. If you are printing a report
   for multiple sites, the drop-down list shows the tracking currencies
   shared by the selected sites. If no shared tracking currencies
   are found, Not Available is inserted. You cannot run the report
   if no shared tracking currency are found. Clear site selections
   until a shared currency is found.
4. Select the appropriate
   sequence for the report

You can sequence the report by Part ID, Warehouse ID, Product
Code, or Commodity Code.

5. Use the Starting and
   Ending
   Part ID buttons to select the range of Part IDs to print.
6. Select the output for
   the report.

Select Print to
output the report to a printer.

Select View to
output the report to your screen for viewing.

Select File to
output your report as a text file. You can then edit the report using
a text editing application.

7. Select the appropriate
   option check boxes.

Show
Parts with Non-Zero Amounts Only - If you have many part masters
for which you are not currently carrying inventory, you may want to
use this option to reduce the size of the report.

Include
parts with on-hand qty and zero amount - If this check box
is selected, the inventory valuation report includes parts with on-hand
quantities greater than zero, but the value of these quantities is
zero.

Note:
You must select the Show Parts with Non-Zero Amounts
Only check box to enable the Include parts
with on-hand qty and zero amount check box.

Use
Part Standard Unit Cost Instead of FIFO Actual - If using actual
costing, received materials are valued at FIFO based on the invoice
or purchase order amount. Depending upon your use of the report, you
may want to value inventory based on the standard cost as defined
in Part Maintenance, rather than actual costs.

8. If you are sequencing
   Part IDs with Cost Layer Detail information, select the appropriate
   Cost Layer Detail options.

You can only use these options if you are
using the actual costing method. You have three choices:

Show All Parts in Range
- All parts are reported regardless of zero or negative cost layers.

Show Parts with Zero
Cost Layers Only - The report only prints for parts that have
one or more cost layers with a zero value. This option helps you track
down any parts that may not have been valued correctly. This could
happen, for example, if you adjusted parts into inventory and forgot
to provide the appropriate cost.

Show Parts with Negative
Balance Cost Layers - The report is an exception report that
includes parts where the Part Maintenance Quantity on Hand is different
from the Inventory Transaction Quantity on Hand. It indicates where
there may be a quantity error in the database.

9. If you are sequencing
   Part IDs with Cost Layer Detail information, select the appropriate
   Transaction Detail options.

Show
Only Project Related Transactions - Select this check box if
you want ONLY project related transactions.

Show
Only Non-Project Related Transactions - Select this check box
if you want ONLY non-project related transactions.

10. If you have selected
    Warehouse ID for a selection criteria, you can select how you
    want VISUAL to sequence your warehouse information:

Whse/Part
- Warehouse first, then part.

Whse/Loc/Part
- Warehouse first, then location, then part.

Whse/WBS/Part
- Warehouse first, then WBS code, then part.

Whse/Loc/WBS/Part
- Warehouse and Location first, then WBS, then part.

11. Select Print/View
    from the File menu.

If you selected Print
as the output, a standard Windows dialog box appears.

12. Make the appropriate
    selections then click Ok.

VISUAL prints the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Inventory_Valuation_Report.md) User-defined Help