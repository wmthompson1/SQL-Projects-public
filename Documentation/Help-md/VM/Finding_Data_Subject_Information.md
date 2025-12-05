Finding Data Subject Information




# Finding Data Subject Information in the Individual Privacy Window

The Individual Privacy program contains a field where
you enter a data subjects name. You can specify all or part of the
name.

When you click Refresh or tab out of the
Individual ID field, the program searches for the data subjects name
in database tables that store these types of data: Contact, Customer,
Employee, Sales Rep, and Vendor. The program searches for the data
subject based on a combination of the first name and last name. You
can enter the first few characters of the name. For example, to search
for John Smith, you could enter JO. This table shows the database
tables that the program searches:

|  |  |
| --- | --- |
| **Data Group** | **Database Tables** |
| Contact | CONTACT  EQUIPMENT  UNP\_MNT\_CALLS    If you use the database with Infor VISUAL CRM, then these tables are also searched:  V\_CONTACT  V\_HISTORY |
| Customer | CARRIER  CUSTOMER  CUSTOMER\_BANK  CUSTOMER\_CONTACT  CUSTOMER\_GROUP  CUSTOMER\_ORDER  CUST\_ADDRESS  QUOTE  RMA  IBT  IBT\_RECEIVER  IBT\_SHIPPER    If you use the database with Infor VISUAL CRM, then this table is also searched:  V\_ACCOUNT |
| Employee | EMPLOYEE |
| Sales Rep | SALES\_REP |
| Vendor | CASH\_DISBURSEMENT  PURC\_REQUISITION  PURCHASE\_ORDER  RFQ\_VENDOR  SHIP\_TO\_ADDRESS  VENDOR  VENDOR\_ADDRESS  VENDOR\_BANK  VENDOR\_REMIT\_ADDRESS  VENDOR\_CONTACT  VENDOR\_GROUP |

No other database tables are searched.

The search results are displayed in the table sorted by Data Group.
You can sort the table by any of the columns, and you can filter the
table by data group.

After you run a search, you can generate a report about a data subject
and redact a data subjects information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMINDPRVWhat.htm)
What Is Individual Privacy?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMINDPRVfrmIndividualPrivacy.htm) Searching for a Data Subject

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.htm) User-defined Help