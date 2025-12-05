Closing Projects: An Overview




# Closing Projects

When work is complete on a project, close the project. Before you
change the projects status to Close through the Project Window, verify
the following information:

1. Make sure all project
   invoices have been issued and payments have been received.
2. If necessary, ship all
   products to the customer.
3. Recognize all project
   revenue.
4. Make sure that all project-related
   transactions are posted to the General Ledger.
5. "Test" Close
   the project.
6. Run the Project Charges
   Under Review Report to check for outstanding transactions.
7. Re-release the project
   and resolve items identified on the Project Charges Under Review
   Report.
8. Close the project.

## Step One: Make Sure All Project Invoices Have Been Issued and Payments Have Been Received

To make sure that all invoices have been issued, run the [Project
Billing Events Report](Project_Billing_Events_Report_Helpful.htm) for the project you would like to close.

To review the invoices issued for the project, run the Project Billing
Events Report. To check to see if invoices have been issued, run the
report with the following parameters:

Customer ID Enter the ID for the customer of the project you would
like to close.

Order ID Enter the ID of the order associated with the project
you would like to close.

Starting Date Enter a date within the period that work on the
project began.

Ending Date Enter a date within the period that work on the project
ended.

Show Events Box Select all check boxes in the Show Events Box.

Customers Box Select Current Customer in the Customers box.

Orders Box Select Current Order in the Orders box.

Sequence Box Select either order ID or customer ID, depending
on your preference.

When the report outputs, it lists all the invoices that have been
issued. It also shows billing events eligible for invoicing that have
not yet been invoiced.

If the report shows that you have not issued invoices for billing
events, generate the invoices by selecting the Generate Invoice check
box in the Edit Billing Events window and printing the invoice.

To check to see if invoices have been paid, use the Accounts Receivable
Invoice Registry. To view unpaid invoices for the project you would
like to close, use the following parameters:

Beginning Customer ID and Ending Customer ID Enter the ID for
the customer of the project you would like to close.

Beginning Invoice Date and Ending Invoice Date Enter a date on
or before the date of the first invoice in the Beginning Invoice Date
field. Enter the date that the last invoice was issued in the Ending
Date field.

Include box Select the Unpaid and Partially Paid check boxes to
view the invoices that have not been paid.

Click Ok to output the report. The report shows which invoices have
not been fully paid.

## Step Two: If Necessary, Ship All Products to the Customer

Shipping products to customers is especially important if you are
using Shipment as the revenue recognition method. Refer to your VISUAL
documentation for more information on shipping products.

## Step Three: Recognize All Project Revenue

Prepare and post all revenue recognition transactions for your project.

## Step Four: Post All Project-Related Transactions to the General Ledger

To check project transactions, run the G/L Transactions Report /
Inquiry from the Info menu of the Project Summary menu. Set up the
inquiry with the following parameters:

Sequence Box In the Sequence Box, select Project, WBS, Dept.

Starting Project ID and Ending Project ID In the Starting Project
ID and Ending Project ID fields, enter the ID of the project you would
like to close.

Filters Box Select By Date Range in the Filters box.

Starting Date and Ending Date In the Starting Date field, enter
the date that you released the project. In the Ending Date field,
enter the date that work was complete on the project.

Transactions Box Select Print Unposted Txs to view unposted transactions.

Current User Only Clear the Current User Only check box to view
transactions entered by all users.

Include Rev Recognition Select the Include Revenue Recognition
check box to view revenue recognition transactions.

Transaction Type Box Select Print All in the Transaction Type
box.

Click Ok to review unposted transactions. Post any unposted transactions,
if necessary.

## Step Five: Test Close the Project

After you review transactions, temporarily close the project. By
temporarily closing the project, you can review any outstanding work
orders and other transactions.

To close the project:

Open the project you would like to close in the Project window.

Select the header card of the project.

From the Status Change menu, select Close. The Change Status dialog
box appears.

Select the Change status of subordinate materials and operations
check box, then click Ok.

VISUAL closes the project.

## Step Six: Run the Project Charges Under Review Report to Check for Outstanding Transactions

Run the report for the project you are closing. The report identifies
any additional open transactions and work orders.

## Step Seven: Re-release the Project and Post or Close Outstanding Items

If the Project Charges Under Review Report identified unresolved
items, re-release the project so that you can post and/or close items.

To re-release the project, select the projects header card, then
select Release from the Status Change menu. Select the Change status
of subordinate materials and operations check box, then click Ok.

Resolve the transactions identified on the Project Charges Under
Review Report.

## Step Eight: Close the Project

When you have resolved the items identified in the Project Charges
Under Review Report, close the project. From the Status Change menu,
select Close. Select the Change Status of subordinate material check
box, then click Ok. VISUAL closes the project.

After you close the project, users can no longer refer to the project
in new transactions.

Consider marking the project warehouse as MRP exempt to prevent
MRP from processing the warehouse. Mark the project warehouse as MRP
exempt in Warehouse Maintenance.

## Updating Project Costs after Closing

You can incur costs on a project after it is closed. Costs from
AP Invoices, Sub-assembly updates, and FIFO layer updates can impact
actual project costs.

The formal EAC at the end of the project should match the actual
costs. The formal EAC must be updated so that the correct amounts
of revenue can be recognized.

To update the formal EAC, you can use the Updated ETCs with Actuals
utility. Select the Mark new ETC versions as current, Create new EAC
versions, and Mark new EAC versions as current options when you run
the utility. [See Updating ETCs
with Actual Costs](VMUPDETCfrmUpdateETC.htm).

You can also manually update the formal EAC to match the final costs.
See [Manually
Creating Estimates at Completion.](Entering_Project_Estimates_at_Completion.htm)