What is the Synchronize Customer/Account Utility?




# What is the Synchronize Customer/Account Utility?

**Caution:** Using this utility permanently
changes the Customer and Account information in your database. Make
a backup of your database before using this utility.

When you
create a customer in VISUAL, an account is created in CRM and linked
to the VISUAL customer. Similarly, when you convert a CRM account
to a customer, a VISUAL customer record is created and linked to the
CRM account. Likewise with contacts, when you create a contact in
VISUAL a linked contact is created in CRM and vice versa. Where it
is acceptable to leave a CRM account unlinked with a VISUAL customer
when done purposefully, linked and synchronized accounts and customers
are preferred.

Occasionally,
the links between VISUAL customers and CRM accounts are not created
or are broken and their associated information becomes un-synchronized.
Contacts for VISUAL and CRM also may not be created or may become
broken.

To establish links for unlinked VISUAL
customers and CRM accounts, use the main Synchronize Customer/Account
Utility. You can create links for unlinked records in these ways:

* Link to a new record. When
  you select this option, a new record is created to link to the
  VISUAL customer or CRM account.
  For example, if you choose to create a new record for an unlinked
  CRM account, a new VISUAL customer record is created.
* Link to an existing record.
  When you select this option, you establish a new link between
  an existing CRM account and an
  existing VISUAL customer. To use this option, both the CRM account
  and VISUAL customer cannot be currently linked to another record.

To re-establish information associated
with linked VISUAL Customers and CRM accounts, use the Re-sync associations of linked Accounts/Customers
sub-utility. You can re-synchronize values associated with linked
VISUAL customers and CRM accounts. When you run this sub-utility you
add missing information to the linked VISUAL customers and CRM accounts
and synchronize disparate associations in CRM to match the information
in VISUAL.

To establish links for unlinked VISUAL
and CRM contacts, use the Synchronize Contact Utility. You can create links for unlinked contacts by linking
to a new record or linking to an existing record.

## Requirements

To use this utility, CRM
must be installed. You must have system administrator privileges to
use this utility. You can only use the utility with Infor VISUAL 7.1.2
and higher and Infor VISUAL CRM 7.12 and higher. Consult with your
VISUAL ICS staff for recommendations on updating VISUAL and VISUAL
CRM.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCfrmCustomerSnc.htm)
Adding Missing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCCustAcctsToProcessTable_GenID.htm)
Generating IDs in the Cust/Accts to Process table in the Synchronize Customer/Account
Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCLinkingExistingCustomersandAccounts.htm)
Linking Existing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCResyncLinkedAccountandCustomerAssociations.htm)
Re-synchronizing Linked Account and Customer Associations

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCInterfaceOvrvw.htm)
Navigating in the Synchronize Customer/Account Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCCustomerAccountTableSort.htm)
Sorting the Customer/Account table in the Synchronize Customer/Account
Utility