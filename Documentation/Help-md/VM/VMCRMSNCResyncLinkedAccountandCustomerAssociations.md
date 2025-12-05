Re-synchronizing linked account and customer associations




# Re-synchronizing linked account and customer associations

**Caution:** Re-synchronizing associations
of linked Accounts/Customers by using this sub-utility permanently
changes the information in your database. Backup your database first.

Use this
sub-utility to re-synchronize all information associated with linked
VISUAL customers and linked VISUAL CRM accounts. All values for each
linked CRM account and each linked VISUAL customer are compared and
any discrepancies are displayed. These values include entities, sites,
addresses, and contact associations among others.

When you re-synchronize information, these actions are taken:

* If
  information is missing from VISUAL but present in CRM, then the
  information from CRM is added to VISUAL.
* If
  information is missing from CRM but present in VISUAL, then the
  information from VISUAL is added to CRM.
* If
  information for CRM is different from information for VISUAL,
  then the CRM information is overwritten with the information from
  VISUAL as VISUAL is the system of record.

To re-synchronize data between
VISUAL customers and the linked VISUAL CRM accounts:

1. Navigate to the Infor
   VISUAL installation directory and double-click VMCRMSNC.EXE. If
   the default VISUAL installation directory is used, the Synchronize
   Customer/Account Utility launches from C:\Infor\VISUAL\VISUAL
   MFG.
2. Select
   Maintain,
   Associations
   of linked Acct/Cust.
3. Click
   the Log File tab and specify the log file information:

File Path - Specify
the file path directory for the Re-sync associations of linked Accounts/Customers
log file. To search for a directory location, click the File
Path browse button. You can also manually specify the file path.

File Name - Specify
the name of the Re-sync associations of linked Accounts/Customers
sub-utility log file where all customer and account re-synchronization
processing entries are to be logged.

4. Use
   the tabs to review the discrepancies found between CRM account
   information and VISUAL customer information:

Cust/Acct tab
Use this tab to review differences between the CUSTOMER table and
the V\_ACCOUNT table. The CUSTOMER table is used to store tenant-level
customer information in VISUAL, such as Customer Maintenance header
information, General tab information, and Primary Contact tab information.
The V\_ACCOUNT table is used to store tenant-level account information
in CRM Account Maintenance General Tab information and Contact tab
information. The name of the database column where the information
is stored is displayed in the Column Name column.

Entities tab
Use this tab to review differences between the CUSTOMER\_ENTITY table
and the V\_ACCT\_ENTITY table. The CUSTOMER\_ENTITY table is used to
store entity-level credit information specified in the Entity Credit
Limit tab in VISUAL Customer Maintenance. The V\_ACCT\_ENTITY table
is used to store entity-level credit information in the Accounting
tab in CRM Account Maintenance.

Site tab Use
this tab to review differences between the CUSTOMER\_SITE table and
the V\_ACCT\_SITE table. The CUSTOMER\_SITE table is used to store site-level
order management information specified in the Order Mgt tab in VISUAL
Customer Maintenance. The V\_ACCT\_SITE table is used to store site-level
credit information in the Order Mgt tab in CRM Account Maintenance.

Address tab
Use this tab to review differences between the CUST\_ADDRESS table
and the V\_ADDRESS table. The CUST\_ADDRESS table is used to store alternate
shipping addresses for customers in VISUAL. Shipping addresses are
specified in the Shipping Address dialog in Customer Maintenance.
The V\_ADDRESS table is used to store alternate addresses for accounts
specified in Address Maintenance in CRM.

Contact Assoc

Use this tab to review differences between the CUSTOMER\_CONTACT table
and the V\_ACCT\_CONTACT table. The CUST\_CONTACT table is used to store
alternate contacts for customers in VISUAL. Contacts can be associated
with customers in the Alternate Contacts dialog in Customer Maintenance
and with the Customer tab in Contact Maintenance. The V\_ACCT\_CONTACT
table is used to store alternate contacts for accounts in CRM. Contacts
can be associated with accounts in Account Maintenance and Contacts
Maintenance.

5. To
   insert missing data or to update linked data, click Go.
6. Click
   View Log File to review the linked account
   and customer associations that were re-synchronized.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCWhat.htm) What
is the Synchronize Customer/Account Utility?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCfrmCustomerSnc.htm)
Adding Missing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCLinkingExistingCustomersandAccounts.htm) Linking Existing Customers and Accounts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCInterfaceOvrvw.htm)
Navigating in the Synchronize Customer/Account Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCRMSNCCustomerAccountTableSort.htm)
Sorting the Customer/Account table in the Synchronize Customer/Account
Utility