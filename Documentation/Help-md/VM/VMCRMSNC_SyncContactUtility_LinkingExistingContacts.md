Linking Existing Contacts




# Linking Existing Contacts

**Caution:** The Synchronize Contact Utility
permanently changes the information in your database. Backup your
database first.

Use the Sync Existing feature
of the Synchronize Contact Utility to create a link between an existing
VISUAL contact and an existing CRM contact.

To create a link between
a VISUAL contact and CRM contact:

1. Navigate
   to the Infor VISUAL installation directory and double-click VMCRMSNC.EXE.
   If the default VISUAL installation directory is used, launch the
   Synchronize Customer/Account Utility from C:\Infor\VISUAL\VISUAL
   MFG.
2. Select
   Maintain, Sync Contacts.
3. In
   the Mode section, click Sync Existing.
4. In
   the Contact table, select the CRM contact and VISUAL contact to
   link together. Both the CRM and VISUAL contact must be unlinked.
   To select the two records to link, select the first row, press
   the CTRL key, and select the second row.
5. To
   add the rows in the processing table, click Sync
   Existing.
6. In
   the Contacts to Process table, specify which record is the master
   record. Select one of these check boxes:

Match to VE -
Select this check box to update the CRM contact with the VISUAL contact
attributes including any customer associations.

Match to CRM -
Select this check box to update the VISUAL contact with the CRM contact
attributes. If the CRM contact is associated with accounts that have
been converted to customers, then the customer associations are included
in the information written to the VISUAL contact record. The CRM customer
associations overwrite existing VISUAL contact customer associations.

7. Click
   the Log File tab and specify the log file information:

File Path - Specify
the file path directory for the Synchronize Contact Utility log file.
To search for a directory location, click the File Path browse
button. You can also manually specify the file path. The file path
is saved to the local preference file VMCRMSNC.INI with a variable
name of Log File Directory
in the frmContactSnc section.

File Name - Specify
the name of the synchronize customer/account utility log file where
all customer and account processing entries are to be logged. The
file name is saved to the local preference file VMCRMSNC.INI key with
a variable name of Log File Name in
the frmContactSnc section.

8. Click
   the Start toolbar button to create links
   between the VISUAL and CRM contacts in the Contacts to Process
   table. Actions taken to process contacts are written to the log
   file.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_What.md) What is the Synchronize Contact
Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_InterfaceOvrvw.md)
Navigating in the Synchronize Contact Utility