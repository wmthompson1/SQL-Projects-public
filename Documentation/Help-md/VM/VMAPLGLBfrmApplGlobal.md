Starting Application Global Maintenance




# About Application Global Maintenance

Use Application Global Maintenance to set up information
about your tenant or corporate parent. Each database can have only
one tenant. Most of the information you define in Application Global
Maintenance applies to all accounting entities and sites in your database.
You can override some information you define in Application Global
Maintenance in Accounting Entity Maintenance or Site Maintenance.

## Starting Application Global Maintenance

To access the Application Global Maintenance window, select Admin, Application Global Maintenance.

## Tasks

This table shows the tasks that you can complete in Application
Global Maintenance:

| Task | Description |
| [Specifying Information on the General Tab](VMAPLGLB-tabGeneral.md) | Specify the corporate address, barcode transaction system settings, recent file list limit, purchase quote type, and oldest open invoice setting, |
| [Specifying Scheduling Information](Specifying_Scheduling_Information_Tenant.md) | Specify default schedule and calendar exceptions. |
| [Specifying Default Information](Specifying_Default_Information_tenant.md) | Specify certain application-wide information, including:   * Trace ID information * How to use customer   pricing in shipping entry * Default Document   Maintenance options * Password requirements   in Workflow * PLM connection settings * Where to store macros |
| [Adding Terms](Entering_Information_in_Terms_Maintenance.md) | Define the payment terms you use when you invoice customers and when vendors invoice you. |
| [Setting the Default Login Profile](Setting_the_Default_Login_Profile.md) | Set default sign in information for the work station. |
| [Setting Report Format File Overrides](Setting_Report_Format_File_Overrides.md) | Specify the custom reports to use in place of the standard QRPs. |
| [Maintaining Global Codes and Types](Maintaining_Global_Codes_and_Types.md) | Specify a variety of common terms, such as SIC codes, FOB codes, territories, and commodities. |
| [Bid Rate Maintenance](Bid_Rate_Maintenance.md) | Create bid categories and groups to use in the estimating process |
| [Creating Export Formats](Exporting_Formats.md) | Create electronic file formats. |
| [Verifying VISUAL .NET Configuration Settings](Verifying_VISUAL_.NET_Configuration_Settings.md) | Administer the connection to the .NET databases and executable. Menu option is displayed for Global Financials licensees only. |
| [Updating the Reporting Database Tables](Updating_the_Reporting_Database_Tables.md) | Specify how to update the tables that dashboard metrics use as sources of data. |
| [Monitoring Reporting Service Print Jobs](Monitoring_Reporting_Service_Print_Jobs.md) | If you have set up the VISUAL Reporting Service (VRPTSVC.EXE) to automatically run print jobs based on a schedule, use the Report Service Configurations dialog to monitor print jobs. |
| [Setting Program Preferences](Setting_Program_Preferences.md) | Specify the tab to display by default when Application Global Maintenance is opened. Also specify the executable to use as the default customer order entry and purchase order entry program. |
| [Maintaining SOA Information](Maintaining_SOA_Information.md) | If you use business object documents (BODs) to integrate VISUAL to another product, use SOA Maintenance to set the default information that must appear on each BOD. |

## Fields

The main Application Global Maintenance form contains these fields:

### General tab

Name

The name of your company.

Street Address 1

The company's street address.

Street Address 2

The company's street address.

Street
Address 3

The company's street address.

City

The company's city.

State

The company's state.

Zip

The company's zip code.

Country

The country where the company is located.

Session Time
Limit

For Barcode Transaction System licensees,the number of minutes to
wait for a response from the system before the current transaction
is cleared.

Recent File List Limit

The number of recently accessed records to display. You can choose
to list up to 9 records. The recently used files list is used in these
applications:

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

Purchase Quote type

Determines how the default price is used in vendor quotes. To specify
a default price that applies to quantities from 1 to the quantity
you specify in the first quantity break, click Quantity-break
tables. To specify a default price that applies to quantities
greater than the largest up-to quantity you specify, click Up-to-Quantity.

Create Synchronizer Records

Indicates whether Synchronizer Records for your warehouse management
system.

Financial
Interface in Use

Indicates whether the standard VISUAL Financials menus and programs
are displayed.

Default
Oldest Open Invoice

Determines how the oldest past due customer invoice is identified.

### Scheduling tab

1st Shift Start

The time that the first shift starts.

Shift 1

In hours, the duration of the first shift.

Shift 2

In hours, the duration of the second shift.

Shift 3

In hours, the duration of the third shift.

### Defaults

Only Trace Qty from
Preceding Operation

A selected check box indicates that users are required to enter
trace IDs sequentially at every labor transaction or service receipt.

Customer
Price Effectivity in Shipping

Indicates how customer-specific pricing information is used when
shipping an order to the customer. The setting you specify in Application
Global Maintenance is the default setting. You can override the setting
for individual parts in Part Maintenance.

Terms

The default terms to use for new customer and vendor records.

Due on Receipt
ID

The terms ID to use as the default Due on Receipt ID.

Login URL

When VISUAL is integrated to Infor PLM, the external launch URL
for Web PLM.

Enable

A selected check box indicates that all sites can directly access
to PLM. The default setting can be overridden in Site Maintenance.

Allow Emailing
Associated Documents (Default)

Used to specify the default setting for the Allow
E-mailing check box in Document Maintenance. You can override
the default setting in Document Maintenance.

Passwords Required
for Secured Fields

Select the check box to require the use of passwords for secured
fields when working with workflows,

Store Macros
in Database

Indicates how to macros are stored and read. Select the check box
to store and read macros from the database. Clear the check box to
store and read macros from the work station.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help