Setting Up VAT Percentages and G/L Accounts




# Setting Up VAT Percentages and G/L Accounts

You can set up VAT tax percentages and associated
G/L accounts in the VAT section.

1. Select Admin,
   Accounting Entity Maintenance.
2. Select the entity.
3. Click the VAT
   tab.
4. Click VAT
   Setup.
5. Click Insert.
6. In the table, specify
   this information:

Code Specify
the VAT code.

Description
Specify a description of the code.

7. In the Effective Date
   field, specify the date that the VAT code becomes effective.
8. In the VAT Type field,
   specify the type of VAT code. Select one of these options:

Default VAT
Use this option to set up VAT codes to use between countries that
are not both in the European Commission.

Intra-Euro VAT
Use this option to set up VAT codes between two countries in the
European Commission. Use this type to create VAT codes if vendors
are not required to apply VAT for transactions. You can specify Intra-Euro
VAT codes on Vendor records and purchase orders, and accounts payable
invoices.

9. If you selected Default
   VAT in the VAT Type field, specify this information:

Tax Percent
Specify the VAT percentage.

Tax G/L Account ID
Specify the G/L account to be posted for this tax.

Recoverable Tax Percent
Specify the percent of recoverable tax. This pertains only to payable
taxes.

Tax Rcv G/L Account ID
Specify the G/L account to be posted for this tax. This account
receives a debit entry for recoverable tax amounts.

10. If you selected Euro
    VAT in the Vat Type field, specify this information:

Recoverable Tax Percent
Specify the percent of recoverable tax. This pertains only to payable
taxes.

Tax Rcv G/L Account ID
Specify the G/L account to be posted for this tax. When a payable
transaction is processed, this account receives a debit entry for
recoverable tax amounts.

Intra-Euro Tax Percent
Specify the Intra-Euro VAT percentage. For Intra-Euro VAT codes,
this value typically equals the value that you specified in the Recoverable
Tax Percent field.

Intra-Euro Debit Tax
G/L Acct ID Specify the account to use to process any differences
between the recoverable tax percentage and the Intra-Euro tax percentage.
Since these two percentages are typically equal, transactions against
this account should be minimal.

Intra-Euro Credit Tax
G/L Acct Specify the account to credit when a payable transaction
is processed. If the recoverable tax percentage is equal to the Intra-Euro
tax percentage, you can enter the same account in this field as you
entered in the Tax Rcv G/L Account ID.

11. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help