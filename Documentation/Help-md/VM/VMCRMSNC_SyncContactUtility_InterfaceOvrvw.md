Navigating in the Synchronize Contact Utility




# Navigating in the Synchronize Contact Utility

Use this utility to view, synchronize, and add
missing contacts in both VISUAL and VISUAL CRM.

Linking contacts depends on using the Contacts
table and the Contacts to Process table. Use the Contacts table to
review VISUAL and VISUAL CRM contacts: active, inactive, unlinked,
linked, or all. In the second table, Contacts to Process, you can
either add missing contacts, or link existing contacts depending on
your selected action mode. All synchronization activities are recorded
in a log file.

## Accessing the Synchronize Contact Utility

To access the Synchronize Contact Utility navigate to the
Infor VISUAL installation directory and double-click VMCRMSNC.EXE.
If the default VISUAL installation directory is used, launch the Synchronize
Customer/Account Utility from C:\Infor\VISUAL\VISUAL MFG and then
select Maintain,
Sync Contacts.

## Contact table

The Contact table lists all
contacts in the VISUAL database and CRM database. You can filter the
table by column or sort by
prioritizing the contact information. The table shows contacts that
are both linked and unlinked with VISUAL and CRM.

All viewing options are available
for active and inactive contacts. To view inactive contacts select
the View Inactive Contacts check box, or
clear the check box to view the active contacts. Set the table display
by clicking one of these View options:

View Unlinked
- Displays all unlinked contacts.

View Linked
- Displays all linked contacts.

View All - Displays
all unlinked and linked contacts.

General contact information
is listed in the Contact table along with these fields:

**Active**
Indicates that the customer or account is identified as active when
the check box is selected.

**VE
ID** - Uniquely identifies each VISUAL customer with
a number.

**CRM
ID** - Uniquely identifies each CRM account with a system-generated
number.

## Contacts to Process table

The Contacts to Process table
lists the contact records that you have selected to be either added
or synchronized.

To display this table, click
the Contacts to Process tab.

When the Add missing mode
is selected these contact information fields are displayed:

**VE ID** - The VISUAL Contact ID. If you
are creating a new VISUAL contact to link to a CRM contact, you can
edit the ID.

**Info** - Displays the VISUAL customer identifying
information.

**VE Associations** - The customer
associations linked to the VISUAL Contact ID.

**CRM ID** - The CRM contact ID. If you are
creating a new CRM contact to link to a VISUAL contact, you can edit
the ID.

**Info** - Displays the VISUAL CRM contact
identifying information.

When the
Sync Existing mode is selected these customer or account information
fields are displayed:

Match to VE Select this check box to indicate
that the VISUAL contact information is to be used when synchronizing
with the CRM contact.

**VE ID** - Uniquely identifies each VISUAL
contact with a system-generated number.

**Info** - Displays the VISUAL contact identifying
information.

**VE Associations** - The customer
associations linked to the VISUAL Contact ID.

Match to CRM Select this check box to indicate
that the CRM contact information is to be used when synchronizing
with the VISUAL contact.

**CRM ID** - Uniquely identifies each CRM
contact with a system-generated number.

**Info** - Displays the VISUAL CRM contact
identifying information.

## Log File settings

As a log file and path must be specified to synchronize
contacts, you also need to know how to navigate to where you specify
that information.

To display
this log file settings, click the Log File
tab.

**File Path**
Specify the file path directory for the Synchronize Contact Utility
log file. To search for a directory location, click the File
Path browse button. You can also manually specify the file
path. The file path is saved to the local preference file VMCRMSNC.INI
with a variable name of Log File Directory in the frmContactSnc
section.

**File
Name** - Specify the name of the Synchronize Contact
utility log file where all contact processing entries are to be logged.
The file name is saved to the local preference file VMCRMSNC.INI with
the key name Log File Name" in the frmContactSnc section.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNC_SyncContactUtility_What.htm) What is the Synchronize Contact Utility?