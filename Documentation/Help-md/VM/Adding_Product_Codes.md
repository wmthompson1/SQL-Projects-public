Adding Product Codes




# Adding Product Codes

Use Product Codes to group parts together.

You can use product codes to determine which G/L accounts should
be used when parts with a product code are used in transactions. This
hierarchy is used when a part is used in a transaction:

1. If a part-specific account
   has been specified in Part Maintenance, then the part-specific
   account is used.
2. If no part-specific
   account has been specified, then the account used for the product
   code assigned to the part is used.
3. If no product code account
   has been specified, then the account specified in the G/L interface
   is used.

The accounts you specify in the Product Codes dialog override the
accounts specified in the G/L interface. Any accounts you specify
on the Part Maintenance record override the accounts you specify for
the Product Code.

In addition, you can use product codes to override the default demand
fence settings specified in Site Maintenance. Demand fences specified
on the Planning tab in Part Maintenance override the demand fences
you define for the product code.

To add product codes:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select \*\*Tenant\*\*. If you are licensed to use a single
   site, this field is unavailable.
2. Select Maintain,
   Product Codes.
3. Click Insert.
4. Specify this information:

Product Code
Specify a unique identifier in the product code column.

Description
Specify a description of the product code in the Description column.

Demand Fence 1 and Demand
Fence 2 Specify demand fences for this product code. These
demand fences are used for a part if the part does not have specific
demand fences but does have a specific product code.

Cost Category ID
- If you are licensed to use projects/A&D, specify the cost category
ID to use to track budgets and costs. You can assign a material or
ODC cost category. See [Setting
Up Cost Categories](Setting_Up_Cost_Categories.htm).

5. In the upper table,
   select the product code for which to specify account information.
6. In the lower table,
   specify the accounts to use for each accounting category. Double-click
   the Account ID browse button to select
   an account from a list.
7. Click Save.

## Specifying User Dimensions for Product Codes

If you use dimensional reporting, you can attach user dimensions
for product codes.

Product code user dimensions can be used in these transactions:

* Receivable Invoice
* Shipment
* Payable Invoice
* Purchase Receipts
* Inventory Adjustments
* Work Order Issues
* Work Order Labor
* Work Order Service
* Work Order Finished Goods

You can set up different user dimensions for each code. Use the
User Dimensions dialog box to specify which user dimensions to associate
with a particular code. Use the User Dimensions Priorities dialog
box available in the Accounting Window to determine when a user dimension
IDs should be used.

To associate user dimensions with codes:

1. From the Product Code
   table, click User Dimensions....
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

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help