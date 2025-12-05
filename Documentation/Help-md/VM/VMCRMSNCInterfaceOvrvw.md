Navigating in the Synchronize Customer/Account Utility




# Navigating in the Synchronize Customer/Account Utility

Use this utility to view, synchronize, and add missing customers/accounts
in both VISUAL and VISUAL CRM.

To link accounts and customers use these two tables: the Customer/Account
table and the Cust/Accts to Process table. Use the Customer/Account
table to review all VISUAL customers and VISUAL CRM accounts. You
can view active, inactive, unlinked, linked, or all customers and
accounts. In the second table, Cust/Accts to Process, you can either
add missing customers or accounts, or link existing customers and
accounts depending on your selected action mode. All synchronization
activities are recorded in a log file.

## Accessing the Synchronize Customer/Account Utility

To access the Synchronize Customer/Account Utility navigate to the
Infor VISUAL installation directory and double-click VMCRMSNC.EXE.
If the default VISUAL installation directory is used, the Synchronize
Customer/Account Utility launches from C:\Infor\VISUAL\VISUAL MFG.

## Customer/Account table

The Customer/Account table
lists all customers found in the VISUAL database and accounts found
in the CRM database. You can filter the table by column or
sort by prioritizing the customer and account information.
The table shows customers and accounts that are both linked and unlinked
with VISUAL and CRM.

All viewing options are available
for active and inactive customers and accounts. To view inactive customers
and accounts select the View Inactive check
box, or clear the check box to view the active customers and accounts.
Set the table display by clicking one of these View options:

View Unlinked
- Displays all unlinked customers and accounts.

View Linked
- Displays all linked customers and accounts.

View All - Displays
all unlinked and lined customers and accounts.

General contact information
is listed in the Customer/Account table along with these fields:

**Active**
Indicates that the customer or account is identified as active when
the check box is selected.

**VE ID** - Uniquely identifies each VISUAL
customer with a number.

**CRM ID** - Uniquely identifies each CRM
account with a system-generated number.

## Cust/Accts to Process table

The Cust/Accts to Process
table lists the customer or account records that you have selected
to be either added or synchronized.

To display this table, click
the Cust/Accts to Process tab.

When the Add missing mode
is selected these customer or account information fields are displayed:

**VE ID** - The VISUAL Customer ID. If you
are creating a new VISUAL customer to link to a CRM account, you can
edit the ID.

**Info**
- Displays the VISUAL customer identifying information.

**CRM ID** - The CRM account ID. If you are
creating a new CRM account to link to a VISUAL customer, you can edit
the ID.

**Info** - Displays the VISUAL CRM account
identifying information.

When the
Sync Existing mode is selected these customer or account information
fields are displayed:

Match to VE Select this check box to indicate
that the VISUAL customer information is to be used when synchronizing
with the CRM account.

**VE ID** - Uniquely identifies each VISUAL
customer with a system-generated number.

**Info** - Displays the VISUAL customer identifying
information.

Match to CRM Select this check box to indicate
that the CRM account information is to be used when synchronizing
with the VISUAL customer.

**CRM ID** - Uniquely identifies each CRM
account with a system-generated number.

**Info** - Displays the VISUAL CRM account
identifying information.

## Log File settings

As a log file and path must be specified to synchronize
customers and accounts, you also need to know how to navigate to where
you specify that information.

To display
this log file's settings, click the Log File
tab.

**File Path**
Specify the file path directory for the Synchronize Customer/Account
Utility log file. To search for a directory location, click the File Path browse button. You can also manually
specify the file path. The file path is saved to the local preference
file VMCRMSNC.INI with a variable name of Log File Directory"
in the frmCustomerSnc section.

**File
Name** - Specify the name of the Synchronize Customer/account
Utility log file where all customer and account processing entries
are to be logged. The file name is saved to the local preference file
VMCRMSNC.INI with the key name Log File Name" in the frmCustomerSnc
section.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCWhat.htm) What is the Synchronize Customer/Account
Utility?