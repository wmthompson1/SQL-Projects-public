Adding Missing Contacts




# Adding Missing Contacts

**Caution:** The Synchronize Contact Utility
permanently changes the information in your database. Backup your
database first.

Use the Add Missing feature
of the Synchronize Contact Utility to create a new record linking
a VISUAL contact with a CRM contact. If you select an unlinked VISUAL
contact and use the Add Missing feature, then a new CRM contact record
is created. If you select an unlinked CRM contact and use the Add
Missing feature, then a new VISUAL contact record is created. Changes
are recorded in a log file.

To add a missing contact:

1. Navigate
   to the Infor VISUAL installation directory and double-click VMCRMSNC.EXE.
   If the default VISUAL installation directory is used, launch the
   Synchronize Customer/Account Utility from C:\Infor\VISUAL\VISUAL
   MFG.
2. Select
   Maintain, Sync Contacts.
3. In
   the mode section, click Add Missing.
4. In the Contact table,
   select the contacts for which you are creating new records. You
   must select unlinked records. Add multiple records by using the
   CTRL or SHIFT key and then selecting the contacts.
5. To add the rows in the
   processing table, click Add Missing.
6. Click the Log File tab
   and specify the log file information:

File Path - Specify
the file path directory for the Synchronize Contact Utility log file.
To search for a directory location, click the File Path browse button.
You can also manually specify the file path. The file path is saved
to the local preference file VMCRMSNC.INI with a variable name of
Log File Directory in
the frmContactSnc section.

File Name - Specify
the name of the Synchronize Contact utility log file where all contact
processing entries are to be logged. The file name is saved to the
local preference file VMCRMSNC.INI key with a variable name of Log File Name in
the frmContactSnc section.

7. Click the Start
   toolbar button to add the contacts in the Contacts to Process
   table and their associated IDs to the database. Actions for processing
   contacts are written to the log file.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_What.md)
What is the Synchronize Contact Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_InterfaceOvrvw.md)
Navigating in the Synchronize Contact Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_CustomerAccountTableSort.md)
Sorting the Contact table in the Synchronize Contact Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_LinkingExistingContacts.md)
Linking Existing Contacts