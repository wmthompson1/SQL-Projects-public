Entering Accounting Information




# Entering Accounting Information

Enter the following information in the Accounting :

Terms - Click the Terms button and select
the default payment terms to use with this vendor. If you do not specify
a value, then the default terms that are specified on the Defaults
tab in Application Global Maintenance are inserted when you save the
record. If you do not specify a value in the Terms field and default
terms have not been defined in Application Global Maintenance, then
the terms ID that is specified in the Due on Receipt ID field in Application
Global Maintenance is inserted. If the Due on Receipt ID field is
blank, then the first ID in the database that meets the criteria for
due on receipt is used. See [Adding
Terms](Entering_Information_in_Terms_Maintenance.md).

Internal Site ID - If this vendor is an
internal vendor, click the arrow and select the site ID this vendor
ID represents. For example, if this vendor is the vendor you use when
you buy from Site MMC, specify MMC in this field. This field only
applies to the internal purchasing and sales process.

Currency ID - Select a currency for this
vendor. This is the vendors native currency. You can select any of
the currencies set up in your database.

Default Transaction Currency - Select
a default transaction currency for the vendor from the list of valid
currencies. The line item table contains columns for Euro Currency
and Euro Participation. Enter Currencies in Currency Maintenance.

Default A/P Acct ID - Select a default
control account for this vendor. VISUAL automatically lists all Account
IDs, Account names, and Account types. Check the box next to the Account
types you want VISUAL to list. This table references the entries you
made in the A/P Invoice Entry Window.

Default Exp Acct ID - Select a default
control account for this vendor. VISUAL automatically lists all Account
IDs, Account names, and Account types. Check the box next to the Account
types you want VISUAL to list. This table references the entries you
made in the Purchase Entry Window for non-linked purchase orders.

For consumable purchases with a selected vendor, you should select
a Default Expense Account ID that you can use as the default during
purchase order entry. For more information on setting up Default Expense
Account IDs.

Matching - In the Invoice Matching section,
specify the parameters to use when matching the A/P Invoice to the
Purchase Order. Select one of these options:

Exact If the A/P
Invoice total must match the Purchase Order total, select Exact.

Range If the A/P
Invoice total must be within a certain range of the Purchase Order
total, select Range. This may be useful if you want to build in shipping
charges that vary slightly, or to account for currency exchange rates
that may change on a day-to-day basis. Specify the upper and lower
ranges in these fields:

Plus % Specify
the maximum percentage by which the A/P Invoice line can exceed the
Purchase Order total. For example, if you specified 10% in this field,
and the Purchase Order total is $150, then the A/P Invoice total could
exceed the Purchase Order total by up to $15.

Minus % Specify
the maximum percentage by which the A/P Invoice line can be less than
the Purchase Order total. For example, if you specified 10% in this
field, and the Purchase Order total is $150, then the A/P Invoice
total could be less than the Purchase Order total by up to $15.

Not Checked If
you do not require the Purchase Order total to be compared to the
A/P Invoice, select Not Checked.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Vendor_Maintenance.md) User-defined Help