Adding Sales Tax Groups




# Adding Sales Tax Groups

A sales tax group is a listing of all taxes a customer
in a particular location must pay. For example, if you sell a product
to a customer located in New York City, you are responsible for charging
your customer taxes for both New York City and New York State. Sales
Tax Group Maintenance allows you to group all applicable taxes together
for customers with the same tax responsibilities.

To add sales tax groups to the system:

1. Create a blank sales
   tax group window by clicking on the Clear
   button in the Tax Group Maintenance window.

When you first start Sales Tax Group Maintenance,
the Tax Group ID field is active by default.

2. Enter the new Tax Group ID. If the ID exists,
   the information for that group appears.
3. Move to the description field and enter a description
   for the new Tax Group.
4. Click the Insert
   Row button. It does not matter where the cursor is when
   you click Insert Row; the new entry
   appears at the bottom of the current list of Sales Tax IDs.

An
arrow appears in the left column of the new row.

5. Enter the Sales Tax
   ID for the individual tax you are assigning to this tax group.
   You can also select from the list of available tax IDs by double
   clicking on the Sales Tax ID column heading.

If you are entering a new Sales Tax ID,
the following dialog box appears.

Click Yes to continue.

6. Move to the description
   field for the individual tax and enter a description for the tax.

The Percent Set check box indicates if a
tax percent has been established for this tax.

7. Highlight the entire
   row by clicking on the left-most column in the table, then click
   the Edit Percents button.

The Tax Percents dialog box appears.

8. Click the Insert
   Row button on the Tax Percents table.

This adds a new line to the table.

9. Enter the date that
   you want this percent to take effect in the Effective Date column.
   Move to the Percent field and enter the percentage for this tax.
10. In Ceiling field, specify
    the highest amount that can be charged for this tax. If you are
    licensed to use multiple sites, the ceiling amount is not converted
    for different currencies. For example, if you specify 100,000,
    the maximum amount of tax a customer who uses US dollars for currency
    is $100,000. The maximum amount of tax a customer who uses euro
    is 100,000EU. When you apply a sales tax with a ceiling to a customer
    order, the currency of the order should match the currency of
    the amount you specified in the Ceiling field. This is not validated
    by the system. It is recommended that the tax group ID you specify
    indicates the currency of the tax ceiling amount.
11. When the tax percentage
    is correct, click the Ok button to return
    to the Sales Tax Group window.

    |  |  |
    | --- | --- |
    | POSTIT.gif | After you have entered a Tax Percent, a check mark appears in the Percent Set check box. |

To remove a Tax Percentage from the table,
select the line and choose the Delete Row
button. To return to the Sales Tax Group window without saving the
changes select the Cancel button.

12. If you are using Infor
    VISUAL Financials, enter the G/L Account ID to which you want
    Sales Tax dollars posted.

If you do not know what the account numbers
are, double click the G/L Account ID column heading to bring up a
table containing all of the available account numbers. Select from
any of these accounts.

After you enter the account, VISUAL retrieves
the account description from the G/L Account table. If you do not
specify an account, VISUAL uses the default Sales Tax Payable accounts
in the G/L interface.

13. If you want to associate
    a vendor with this tax line, double-click the Vendor
    ID button and select the vendor you want to use.

The vendor name and terms appear for the
vendor you select. This is for informational purposes only.

14. Click the Save
    toolbar button

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Sales_Tax_Group_Maintenance.md) User-defined Help