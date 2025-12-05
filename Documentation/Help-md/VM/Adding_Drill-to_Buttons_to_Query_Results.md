Adding Drill-to Buttons to Query Results




# Adding Drill-to Buttons to Query Results

To add drill-to buttons, you must clear the No Auto
Joining check box when you write the query.

The drill-to buttons are added automatically provided that your
query includes the required primary or foreign keys and columns. For
example, you can drill into Site Maintenance if SITE.ID or CUSTOMER\_ORDER.SITE\_ID
is included in your query.

You must also specifically select the database column in your query.
For example, if you specified SELECT \* FROM RECEIVER, drill-to links
would not be added to the query result. If you specified SELECT r.ID,
r.PURC\_ORDER\_ID, r.SITE\_ID FROM RECEIVER r, then the query result
would include drill-to buttons for the receiver ID, purchase order
ID, and site ID.

This table shows the tables and columns that support drill-tos and
the window that the drill-to button opens:

|  |  |  |  |
| --- | --- | --- | --- |
| **Database Table** | **Database Column** | **Drills to** | **Notes** |
| CURRENCY | ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| VOUCHER\_ID | Accounts Payable Invoice Entry |  |
| VENDOR\_ID | Vendor Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| PAYB\_GL\_ACCT\_ID | Accounting Window |  |
| CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| RECEIVABLE | INVOICE\_ID | Accounts Receivable Invoice Entry |  |
| CUSTOMER\_ID | Customer Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| ACCOUNT | ID | Accounting Window |  |
| CURRENCY\_ID |  | To activate the link, an entity ID column must be included in the query. |
| CUSTOMER | ID | Customer Maintenance |  |
| DEF\_TRANS\_CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| EMPLOYEE | ID | Employee Maintenance |  |
| INVENTORY\_TRANS | TRANSACTION\_ID | Inventory Transaction Entry |  |
| SITE\_ID | Site Maintenance |  |
| GL\_ADJ\_ACCOUNT\_ID | Accounting Window |  |
| LABOR\_TICKET | TRANSACTION\_ID | Labor Ticket Entry |  |
| EMPLOYEE\_ID | Employee Maintenance |  |
| RESOURCE\_ID | Shop Resource Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| WORK\_ORDER | TYPE  BASE\_ID  LOT\_ID  SPLIT\_IT  SUB\_ID | Manufacturing Window | To activate the link, all columns listed in the Database Columns column must be included in the query. the Part ID must also be included |
| PART\_ID | Part Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| CUSTOMER\_ORDER | ID | Customer Order Entry |  |
| CUSTOMER\_ID | Customer Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| PART | ID | Part Maintenance | If Site ID is included in the query, Part Maintenance is opened at the site level. If Site ID is not included, Part Maintenance is opened at the tenant level. |
| PREF\_VENDOR\_ID | Vendor Maintenance |  |
| PART\_SITE | PART\_ID | Part Maintenance | If Site ID is included in the query, Part Maintenance is opened at the site level. If Site ID is not included, Part Maintenance is opened at the tenant level. |
| SITE\_ID | Site Maintenance |  |
| PURCHASE\_ORDER | ID | Purchase Order Entry |  |
| VENDOR\_ID | Vendor Maintenance |  |
| SITE\_ID | Site Maintenance |  |
| CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| RECEIVER | ID | Purchase Receipt Entry |  |
| PURC\_ORDER\_ID | Purchase Order Entry |  |
| SITE\_ID | Site Maintenance |  |
| SHOP\_RESOURCE | ID | Shop Resource Maintenance | If Site ID is included in the query, Shop Resource Maintenance is opened at the site level. If Site ID is not included, Shop Resource Maintenance is opened at the tenant level. |
| SITE\_ID | Site Maintenance |  |
| AFB\_GL\_ACCT\_ID | Accounting Window |  |
| SHOP\_RESOURCE\_SITE | ID | Shop Resource Maintenance | If Site ID is included in the query, Shop Resource Maintenance is opened at the site level. If Site ID is not included, Shop Resource Maintenance is opened at the tenant level. |
| SITE\_ID | Site Maintenance |  |
| SHIPPER | PACKLIST\_ID | Shipping Entry |  |
| CUST\_ORDER\_ID | Customer Order Entry |  |
| SITE\_ID | Site Maintenance |  |
| SITE | ID | Site Maintenance |  |
| VENDOR | ID | Vendor Maintenance |  |
| CURRENCY\_ID | Exchange Rate Maintenance | To activate the link, an entity ID column must be included in the query. |
| DEF\_EXP\_GL\_ACCT\_ID | Accounting Window |  |
| DEF\_TRANS\_CURRENCY | Exchange Rate Maintenance |  |
| WAREHOUSE | ID | Warehouse Maintenance |  |
| CUSTOMER\_ID | Customer Maintenance |  |
| VENDOR\_ID | Vendor Maintenance |  |
| SITE\_ID | Site Maintenance |  |