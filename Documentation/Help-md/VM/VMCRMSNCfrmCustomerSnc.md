Adding Missing Customers and Accounts




# Adding Missing Customers and Accounts

**Caution:** The Synchronize Customer/Account
Utility permanently changes the information in your database. Backup
your database first.

Use the Add Missing feature of the Synchronize Customer/Account
Utility to create a new record to link to the VISUAL customer or CRM
account. If you select an unlinked VISUAL customer and use the Add
Missing feature, then a new CRM account record is created. If you
select an unlinked CRM account and use the Add Missing feature, then
a new VISUAL customer record is created. Customer and account additions
are recorded in a log file.

To add missing customers or accounts:

1. Navigate to the Infor
   VISUAL installation directory and double-click VMCRMSNC.EXE. If
   the default VISUAL installation directory is used, the Synchronize
   Customer/Account Utility launches from C:\Infor\VISUAL\VISUAL
   MFG.
2. In the mode section,
   click Add
   Missing.
3. In the Customer/Account
   table, select the VISUAL customers and CRM accounts for which
   you are creating links. You must select unlinked records. Add
   multiple records by using the CTRL or SHIFT key and then selecting
   customers and accounts.
4. To add the rows, click
   Add Missing in the processing table.
5. Optionally, edit the
   ID for the new record. An ID for the new record is generated based
   on your selection in the Preferences dialog. IDs that can be edited
   are displayed in blue. To reset any edited IDs to the system-generated
   IDs, click the Generate Cust/Acct IDs
   toolbar button.
6. Click the Log File tab
   and specify the log file information:

File Path - Specify
the file path directory for the Synchronize Customer/Account Utility
log file. To search for a directory location, click the File Path
browse button. You can also manually specify the file path. The file
path is saved to the local preference file VMCRMSNC.INI with a variable
name of Log File Directory in the frmCustomerSnc section .

File Name - Specify
the name of the synchronize customer/account utility log file where
all customer and account processing entries are to be logged. The
file name is saved to the local preference file VMCRMSNC.INI key with
a variable name of Log File Name in the frmCustomerSnc section.

7. Click the Start
   toolbar button to add the customers and accounts to the database.
   Actions taken to process customer and account are written to the
   log file.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCWhat.htm)
What is the Synchronize Customer/Account Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCLinkingExistingCustomersandAccounts.htm)
Linking Existing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCInterfaceOvrvw.htm)
Navigating in the Synchronize Customer/Account Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCResyncLinkedAccountandCustomerAssociations.htm) Re-synchronizing Linked Account and
Customer Associations

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCCustomerAccountTableSort.htm)
Sorting the Customer/Account table in the Synchronize Customer/Account
Utility