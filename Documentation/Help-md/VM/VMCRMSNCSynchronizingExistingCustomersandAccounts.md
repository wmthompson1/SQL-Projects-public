Synchronizing Existing Customers and Accounts




# Synchronizing Existing Customers and Accounts

**Caution:** The Synchronize Customer/Account
Utility permanently changes the information in your database. Backup
your database first.

Use the Sync Existing feature
of the Synchronize Customer/Account Utility if you find that existing
VISUAL customers or CRM accounts have dissimilar information. Customer
and account synchronizations are recorded in a log file. By synchronizing
customers and accounts, is one step towards regaining synchronized
VISUAL and CRM databases. Once existing customers and accounts are
identified and synchronized confirm that all customers or accounts
display in both the VISUAL and the VISUAL CRM databases by adding
missing customers and accounts to complete the synchronization of
the VISUAL and CRM databases.

To synchronize existing customers
or account using the Synchronize Customer/Account Utility:

1. Navigate to the Infor
   VISUAL installation directory and double-click VMCRMSNC.EXE. If
   the default VISUAL installation directory is used, the Synchronize
   Customer/Account Utility launches from C:\Infor\VISUAL\VISUAL
   MFG.
2. Select the Sync
   Existing Mode.
3. Select the customer
   or account in the Customer/Account table and click Sync
   Existing in the Cust/Accts to Process table. Only two line
   entries may be selected at the same time of which one must be
   a VISUAL customer and the other must be a CRM account.

Add
multiple records by using the CTRL key and then selecting the customer/accounts.
Remove unwanted records from the Cust/Accts to Process table by clicking
Remove Selection.

4. Select
   one check box for each line in the Cust/Accts to Process table.
   Your choices are:
5. Match
   to VE - Select this check box to indicate that when synchronized
   the CRM account is processed to match the VISUAL customer attributes.
6. Match
   to CRM - Select this check box to indicate that when synchronized
   the VISUAL customer is processed to match the CRM account attributes.

5. Click
   the Log File tab and specify the log file information:

* File Path - Designate the file path directory
  for the Synchronize Customer/Account Utility log file. Click the
  File Path browse button to open the VISUAL standard explorer window
  and search for the directory to specify where the synchronize
  customer/account utility log file will reside, or manually enter
  the file path. The file path is save to the local preference file
  VMCRMSNC.INI iwth a variable name of Log
  File Directory.
* File Name - Specify the name of the synchronize
  customer/account utility log file where all customer and account
  processing entries are to be logged. The file name is saved to
  the local preference file VMCRMSNC.INI key with a variable name
  of Log File Name.

6. Click
   the Start toolbar button to add the
   customers and accounts in the Cust/Accts to Process table and
   their associated IDs to the VISUAL and VISUAL CRM databases. Actions
   taken to process customer and account are written to the log file.

![btn_mini.gif](btn_mini.gif "btn_mini.gif")
Adding Missing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCInterfaceOvrvw.htm) Navigating in the Synchronize Customer/Account
Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCCustomerAccountTableSort.htm)
Sorting the Customer/Account table in the Synchronize Customer/Account
Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCWhat.htm) What is the Synchronize Customer/Account
Utility?