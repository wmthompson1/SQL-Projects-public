Overriding Cost of Goods Sold G/L Accounts




# Overriding Cost of Goods Sold G/L Accounts

Customer Order Entry allows you to override or specify
cost of goods sold expense accounts for each line item by individual
cost category. These accounts are debited for actual or standard cost
of shipped items, depending on the costing method in use. This is
done by the Prepare Shipments Journal Transactions option of the Costing
Utilities.

When these transactions are created, the system chooses the COGS
accounts for a line item in the following way:

* First, use any accounts
  that are specified for the line using this function.
* Next, for any accounts not
  specified on the line, use any COGS accounts specified for the
  Product Code of the line, if any
* Finally, use the default
  COGS accounts specified in Infor VISUAL Financials Application
  Global Maintenance.
* |  |  |
  | --- | --- |
  | POSTIT.gif | You can specify different accounts at multiple levels. You could specify only a special material account for the line, and use the defaults for the other cost categories. To avoid the confusion this may cause, you should always override all four accounts at once. |

## Overriding the Cost of Goods Sold Accounts for a Line Item

1. Call up the desired
   customer order.
2. Select the line item
   that you wish to assign the general ledger account information
   to.
3. Click the CGS
   Accts button, or choose Cost of Goods Sold G/L Accounts
   from the Edit menu.

The Cost of Goods Sold G/L Accounts dialog
box appears.

4. Enter the G/L account
   number you want to assign to each of the categories.
5. If you do not know the
   account number, use the button next to the field to call up a
   table of accounts.
6. Click Ok
   to save the information and close the dialog box.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help