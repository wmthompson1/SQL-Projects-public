Specifying Information on the General Tab




# Specifying Information on the General Tab

Use the General tab to specify this information:

* Corporate address
* Barcode transaction system
  time limit
* Number of recently used
  files to display in the File menu of certain windows
* Purchase quote type
* Synchronizer records setting

To specify information on the General tab:

1. Select Admin,
   Application Global Maintenance.
2. Click the General
   tab.
3. In the address fields,
   specify your companys corporate name and address.

If you have multiple accounting entities
or multiple sites, you can specify different addresses for your accounting
entities in Accounting Entity Maintenance and for your sites in Site
Maintenance.

If you have one accounting entity and one
site, specify the company address in Application Global Maintenance.
The address information in Accounting Entity Maintenance and Site
Maintenance is not used in a single accounting entity, single site
database.

3. If you are licensed
   to use the Barcode Transaction System, in the Barcode Transmission
   System section specify the number of minutes to wait for a response
   from the system before the current transaction is cleared.
4. To specify the number
   of recently accessed records to display, click the Recent
   File List Limit arrow and select the number of records
   you would like to add to the File menu.

You can choose to list up to 9 records.
The recently used files list is used in these applications:

* Customer Maintenance
* Sales Order
  Entry
* Sales Order
  Management Window
* Purchase Order
  Entry
* Purchase Order
  Management Window
* Part Maintenance
* Vendor Maintenance

The recently used records setting you specify
is applied to all of the applications that support the recently used
file list. You cannot use the recently used records feature in only
some of the applications. If you specify a number in the Recently
Used Records field, then all of the applications that support the
feature will display a list of recently used records.

Recently used records will be tracked and
displayed on the File menu after you specify a setting in the Recent
File List Limit field.

To de-activate the feature, specify 0 in
the Recent File List Limit field.

5. In the Purchase Quote
   Type section, specify how to enter quantities in vendor quotes.
   Click one of these options:

Quantity-break tables
To specify a default price that applies to quantities from 1 to
the quantity you specify in the first quantity break, click this option.

For example, presume you specified this
vendor pricing information:

|  | Quantity | Price |
| Default |  | $50 |
| Break 1 | 25 | $40 |
| Break 2 | 50 | $30 |
| Break 3 | 100 | $20 |

If you ordered a quantity between 1 and
24, the vendor would charge $50 per unit. If you ordered a quantity
between 25 and 49, the vendor would charge you $40 per unit. If you
ordered a quantity between 50 and 99, the vendor would charge you
$30 per unit. If you ordered a quantity of 100 or more, then vendor
would charge you $20 per unit.

Up-to-Quantity
To specify a default price that applies to quantities greater than
the largest up-to quantity you specify, click this option.

For example, presume you specified this
vendor pricing information:

|  | Quantity | Price |
| Up to 1 | 25 | $50 |
| Up to 2 | 50 | $40 |
| Up to 3 | 100 | $30 |
| Default |  | $20 |

If you ordered a quantity between 1 and
25, the vendor would charge $50 per unit. If you ordered a quantity
between 26 and 50, the vendor would charge $40 per unit. If you ordered
a quantity between 51 and 100, the vendor would charge $30 per unit.
For all quantities 101 and above, the vendor would charge the default
price of $20 per unit.

6. In the Default Oldest
   Open Invoice section, specify a default setting for defining the
   oldest past due customer invoice. The system uses this information
   to help determine if the customer has an unpaid invoice that exceeds
   the receivable aging threshold that you specify in Customer Maintenance.
   The setting you specify in Application Global Maintenance is applied
   to any new customers you create. You can override the setting
   in Customer Maintenance. Click one of these options:

Determined by Invoice
Date To use the date of the invoice to identify the oldest
past due invoice, click this option.

Determined by Due Date
To use the date that the full amount of the invoice is due to identify
the oldest past due invoice, click this option.

7. To create Synchronizer
   Records for your warehouse management system, select the Create Synchronizer Records check box.
8. To display the Financial
   menus, select the Financial Interface in Use
   check box. If you are licensed to use VISUAL Financials, you can
   access the applications from the financial menus. To hide Financial
   menus, clear the check box.
9. To use the Release Date
   of material demand orders when performing Material Resource Planning,
   select the By Release Date
   check box below the Material
   Requirement Planning section.
10. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User Defined Help