Adding Sales Representatives




# Adding Sales Representatives

NOTE: If you are licensed
to use VISUAL Global Financials, you cannot access this dialog. You
must maintain sales representatives in Global Financials instead.

Use the Sales Reps dialog to specify your sales
representatives and their default commissions.

Use the
information you set up for sales representatives to generate the Sales
Commission Report and to generate checks for sales representatives
in Accounts Payable. If you intend to pay sales representatives through
Accounts Payable, you must specify a commission percentage.

All Sales
Reps in the table are available for selection for all customers.

Sales representatives
can be employees or vendors. Before you specify sales representatives
in the Sales Reps dialog, you should set up the Vendor IDs and Employee
IDs for the sales representatives.

To add or
edit Sales Rep information:

1. Select Sales,
   Customer Maintenance.
2. Select Maintain,
   Sales Reps.
3. Click Insert.
4. Specify this information:

Sales Rep ID - Specify
the ID for this sales rep. To comply with the European Union GDPR
rules, we recommend that you do not use personal information, such
as a name, for the ID. See [What Is Individual
Privacy?](VMINDPRVWhat.md).

Name - Specify
the name of this sales rep.

Active Select
this check box if the individual currently represents you. An active
sales rep record can be selected in other area in VISUAL, such as
Customer Maintenance.

Def Comm % - Specify
the default commission percentage earned by this sales rep.

Vendor ID - If this sales rep is a vendor, specify
the vendor ID for this sales rep.

Employee ID -
If this sales rep is an employee,
specify the Employee ID for this sales rep.

Earning Code -
Specify the earning code for this
sales representative. Earning codes are used in payroll processing.

Pay Method - Specify the payment method for this sales
rep. You can select Payables, Payroll, or Never.

5. Click Save.

## Copying and Pasting Sales Rep Information

You can also copy and paste information from one line to another.
To copy information, select the line in the table you want to copy
and click the Copy button.

To paste the information, select the line into which you want to
paste the information and click the Paste
button. The line must exist before you can paste into it. When you
paste the information into the new line, the fields at the bottom
of the dialog box fill in with the appropriate information.

## Deleting Sales Reps

To remove a sales rep completely, highlight the address line and
click the Delete button. Click the Save button to save the deletion.

## Specifying User Dimensions

If you use dimensional reporting, you can attach sales representative
user dimensions to accounts receivable invoices and customer orders.
You can set up different user dimensions for each sales rep. Use the
User Dimensions for Sales Rep ID dialog box to specify which user
dimensions to associate with a particular sales rep. Use the User
Dimensions Priorities dialog box available in the Accounting Window
to determine when the Sales Rep user dimension IDs should be used.

To associate user dimensions with sales reps:

1. Select the row containing
   the sales rep for which you want to set up user dimensions.
2. Click User
   Dimensions....
3. In the left pane, each
   user dimension group is listed. Expand the list under the user
   dimension group to view the transactions in which Sales Rep user
   dimensions can be used.

To assign the same dimensions to all transaction
types, click the name of the dimension group in the left pane. All
Subledgers is inserted in the Subledger field.

To assign dimensions to a particular transaction
type, select the appropriate transaction type. The transaction type
is inserted in the Subledger field.

4. Click Insert.
5. Specify this information:

Valid From Specify
the date the dimension assignment becomes effective.

Debit Dimension
Double-click the browse button and select the dimension to use for
account debits.

Credit Dimension
Double-click the browse button and select the dimension to use for
account credits.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.md) User-defined Help