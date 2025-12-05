Linking Existing Customers and Accounts




# Linking Existing Customers and Accounts

**Caution:** The Synchronize Customer/Account
Utility permanently changes the information in your database. Backup
your database first.

Use the Sync Existing feature
of the Synchronize Customer/Account Utility to create a link between
an existing VISUAL customer and an existing CRM account.

To create a link between
a VISUAL customer and a CRM account:

1. Navigate to the Infor
   VISUAL installation directory and double-click VMCRMSNC.EXE. If
   the default VISUAL installation directory is used, the Synchronize
   Customer/Account Utility launches from C:\Infor\VISUAL\VISUAL
   MFG.
2. In the Mode section,
   click Sync Existing.
3. In the Customer/Account
   table, select the CRM account and VISUAL customer to link together.
   Both the CRM account and VISUAL customer must be unlinked. To
   select the two records to link, select the first row, press the
   CTRL key, and select the second row.
4. To
   add the rows in the processing table, click Sync
   Existing.
5. In
   the Cust/Accts to Process table, specify which record is the master
   record. Select one of these check boxes:

Match to VE -
Select this check box to update the CRM account with the VISUAL customer
attributes.

Match to CRM -
Select this check box to update the VISUAL customer with the CRM account
attributes.

6. Click
   the Log File tab and specify the log file information:

File Path - Specify
the file path directory for the Synchronize Customer/Account Utility
log file. To search for a directory location, click the File
Path browse button. You can also manually specify the file path. The
file path is saved to the local preference file VMCRMSNC.INI with
a variable name of Log File Directory in
the frmCustomerSnc section.

File Name - Specify
the name of the synchronize customer/account utility log file where
all customer and account processing entries are to be logged. The
file name is saved to the local preference file VMCRMSNC.INI key with
a variable name of Log File Name in
the frmCustomerSnc section.

7. Click
   the Start toolbar button to create links
   between the customers and accounts in the Cust/Accts to Process
   table. Actions taken to process customer and account are written
   to the log file.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCWhat.htm) What is
the Synchronize Customer/Account Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCfrmCustomerSnc.htm)
Adding Missing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCInterfaceOvrvw.htm)
Navigating in the Synchronize Customer/Account Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCResyncLinkedAccountandCustomerAssociations.htm)
Re-synchronizing Linked Account and Customer Associations