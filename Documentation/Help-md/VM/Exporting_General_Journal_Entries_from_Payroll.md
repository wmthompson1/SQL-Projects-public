Exporting General Journal Entries from Payroll




# Exporting General Journal Entries from Payroll

Before you can export general journal entries from
Payroll, you need to create an export file in Payroll. See the Payroll
documentation for more information on creating export files.

After you have created the export file and reviewed it in Payroll,
you can export the file. To do this:

1. Select VFIMPEXP.EXE
   from the directory where your VISUAL
   executables are installed.

The Financials Import/Export window appears.

2. Click the Import
   General Journal button.

The Import General Journal Transactions
dialog box appears.

3. Choose the export entity
   ID and the batch date.

The accounting period defaults according
to the batch date.

4. Enter an identifiable
   batch description in the Batch Description field.
5. Enter a suspense account
   ID.

The suspense account ID is for those accounts
from Payroll that do not match those of Infor VISUAL Financials.

If the accounts do not match and there is
no suspense account ID set up, VISUAL does not export the file.

6. In the Import File field,
   enter a file name for the file that you are exporting.
7. If you are using a suspense
   account, you must check the Post Invalid Accounts to Suspense
   account check box.
8. Click the KIS Payroll
   for Windows M.Y.O.B. format radio button.

This format more closely matches the file
format that Payroll has created.

9. Select the appropriate
   import type option:

Detail - Select
this option to create one journal entry and to combine any accounts
with the same account numbers.

Summary - Select
this option to keep the account number separate, even if you have
the same account numbers within the journal entry. This is the recommended
option.

10. Click Ok
    to export the file into Infor VISUAL Financials.

VISUAL automatically posts the file to the
General Ledger.

See the Payroll and Financials documentation
for more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.htm) User-defined Help