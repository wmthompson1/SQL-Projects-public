Setting Up VAT Books




# Setting Up VAT Books

VAT Books control the numbering sequence of all invoices
and memos created when VAT is enabled. In the European Union, there
may be more than one "VAT book" or numbering sequence in
use at any one time. With VAT enabled, VISUAL permits more than one
automatic number sequence to exist in the system for invoices and
memos.

You can use VAT Book Setup from the VAT section of Accounting Entity
Maintenance to specify VAT Book codes and their characteristics. The
VISUAL invoice generation program uses the customers VAT book code
to determine the new invoice numbers. VISUAL saves this code in each
of the generated invoices and determines the numbering scheme applied
to the invoices. Note that you can also generate memos if the shippers
are for returned goods. The customer record has two VAT book code
references, one for invoices and one for memos. VISUAL selects the
appropriate code depending on the type of record you are creating.

When creating manual invoices and memos, VISUAL requires the entry
of a VAT Book Code whenever the system is in VAT mode. VISUAL uses
the VAT Book Code to determine the automatic number scheme for the
new invoice or memo. In addition, this code determines on which VAT
and Intrastat reports the invoice or memo ultimately appears. VISUAL
does not require that the customer VAT Book Code agree with the code
you enter.

When you specify a VAT Book Code, VISUAL verifies that the VAT Book
supports the type of document in question. VISUAL does this by examining
the flags in the VAT Book record. It is an error to refer to a VAT
Book that does not support the given invoice or memo type.

To set up a VAT Book:

1. Click the VAT
   Book Setup button on the VAT tab of the Accounting Entity
   Maintenance window.

The VAT Books dialog box appears.

2. Click the Insert
   button.

A new line appears in the line item table.
The current year appears in the Year column.

3. Enter an identifying
   code for the VAT Book in the Code column.
4. In the Description column,
   enter a description of the new VAT Book.
5. Select the appropriate
   VAT code type check boxes from the VAT Code Type section.

You can select A/R Invoices, A/R Memos,
A/P Invoices, A/P Memos.

6. In the Sequence Numbers
   section, enter the appropriate values in the Start Number, Next
   Sequential Number, Alphanumeric Prefix, Alphanumeric Suffix, Number
   of Decimal places.

You can also select the Show Leading Zeros
check box to show leading zeros in the VAT Book.

7. In the Report Type combo
   box, enter or select either EC (European Community) or IT (Italy).
8. Click the Save
   button to save the new VAT Book.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help