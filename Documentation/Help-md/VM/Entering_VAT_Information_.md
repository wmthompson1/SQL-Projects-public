Entering VAT Information




# Entering VAT Information

Use the VAT tab of the Vendor Maintenance window to
enter the Value Added Tax terms you want to use for your vendors.

Enter the following information on the VAT tab:

VAT Registration - Enter the vendors
VAT registration number.

VAT Code - Click the VAT
Code button and select a VAT Code for the vendor. Though this
becomes the default VAT Code for the vendor, you can override the
code at any time. For more information on entering VAT Codes, refer
to Setting Up Value Added Tax.

Invoice VAT Book Code - Enter the appropriate
VAT Book.

Memo VAT Book Code - Enter the appropriate
VAT Book.

Select the appropriate VAT options for this vendor:

VAT Exempt - If the vendor is VAT exempt,
select the VAT Exempt check box.

Note that even if vendors are VAT exempt, they still need to belong
to a VAT Book.

VAT is Discounted If Within Terms - Select
the VAT Is Discounted If Within Terms check box if you want VISUAL
to use a discount if a purchase transaction is within the vendors
settlement terms. Enter terms for a vendor on the Accounting tab.

VAT Is Always Discounted - Select the
VAT Is Always Discounted check box if you want VISUAL to always use
a vendors discount percent for VAT transactions.

Using an example invoice for a vendor with settlement terms of 5%
discount if paid within 10 days, and with the VAT Is Always Discounted
check box selected:

|  |  |  |  |
| --- | --- | --- | --- |
| Payment within 10 days | = | 9,678.13 | discounted goods amount |
|  |  | 1,662.50 | discounted vat amount |
|  |  | 11,340.63 |  |
| Payment outside 10 days | = | 10,187.50 | full goods amount |
|  |  | 1,662.50 | discounted vat amount |
|  |  | 11,850.00 |  |

Same invoice and vendor, with the VAT is always discounted
check box cleared:

|  |  |  |  |
| --- | --- | --- | --- |
| Payment within 10 days | = | 9,678.13 | discounted goods amount |
|  |  | 1,662.50 | discounted vat amount |
|  |  | 11,340.63 |  |
| Payment outside 10 days | = | 10,187.50 | full goods amount |
|  |  | 1,750.00 | full vat amount |
|  |  | 11,937.50 |  |

Vendor VAT Code Overrides Part
VAT - Select the Vendor VAT Code Overrides Part VAT check box
if you want VISUAL to automatically display the VAT code from the
vendor and initially calculate a VAT amount using this code when you
are entering invoices. With this check box cleared, VISUAL uses the
VAT Code from the part master, if one is established.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Vendor_Maintenance.htm) User-defined Help