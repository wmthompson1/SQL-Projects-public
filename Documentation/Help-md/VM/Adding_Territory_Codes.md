Adding Territory Codes




# Adding Territory Codes

Use the Territory table to enter or delete Territory
codes. Territory codes represent the various geographical regions
in which your company conducts business.

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Table Maintenance, Territory
   Table.
3. Click Insert.
4. Specify the code and
   description.
5. Click Save.

## Specifying User Dimensions for Territory Codes

If you use dimensional reporting, you can attach user dimensions
for territory codes.

Territory code user dimensions can be used in these transactions:

* Receivable Invoice
* Shipment

You can set up different user dimensions for each code. Use the
User Dimensions dialog box to specify which user dimensions to associate
with a particular code. Use the User Dimensions Priorities dialog
box available in the Accounting Window to determine when the warehouse
user dimension IDs should be used.

To associate user dimensions with codes:

1. From the Territory Code
   table, click User Dimensions.
2. In the left pane, each
   user dimension group is listed. Expand the list under the user
   dimension group to view the transactions in which code user dimensions
   can be used.
3. To assign the same dimensions
   to all transaction types, click the name of the dimension group
   in the left pane. All Subledgers is inserted in the Subledger
   field.

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

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Codes_in_Application_Global_Maintenance.md) Deleting Codes in Application Global
Maintenance

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help