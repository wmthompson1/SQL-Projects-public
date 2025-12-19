About the Accounting Entity Maintenance Window




# About the Accounting Entity Maintenance Window

Use Accounting Entity Maintenance to define information
about your accounting entities. An accounting entity is an independent
financial entity within your company. The accounting entity is the
middle level of the organizational structure. Each accounting entity
is summarized to the Tenant level.

Information you define at the accounting entity level applies to
each of the sites that belong to the entity.

The number of entities that you can create is controlled by the
license key.

## Starting the Accounting Entity Maintenance Window

Select Admin, Accounting
Entity Maintenance.

## Tasks

This table shows the tasks that you can complete in the Accounting
Entity Maintenance window:

| Task | Description |
| [Creating Accounting Entities](Creating_Accounting_Entities.md) | Use this procedure to create an accounting entity ID |
| [Specifying Information in the General Tab of Accounting Entity Maintenance](Specifying_Information_in_the_General_Tab_of_Accounting_Entity_Maintenance.md) | Use this procedure to specify general information about the accounting entity, such as the address and tax ID number. |
| [Setting Up Standard Costing](Setting_Up_Standard_Costing.md) | If the accounting entity uses standard costing, use this procedure to set up costing. |
| [Setting Up Actual Costing](Setting_Up_Actual_Costing.md) | If the accounting entity uses actual costing, use this procedure to set up costing. |
| [Setting Up Average Costing](Setting_Up_Average_Costing.md) | If the accounting entity uses average costing, use this procedure to set up costing. |
| [Specifying a POC Revenue Recognition Method](Specifying_a_POC_Revenue_Recognition_Method.md) | If you are licensed to use Aerospace & Defense modules, use this procedure to select a Percentage of Completion (POC) revenue recognition method. |
| [Setting VAT Information](Setting_VAT_Information.md) | Use this procedure to enable VAT functions. |
| [Setting Up VAT Books](Setting_Up_VAT_Books.md) | Use this procedure to specify VAT Book codes and their characteristics. |
| [Setting Up VAT Percentages and G/L Accounts](Setting_Up_VAT_Percentages_and_G_L_Accounts.md) | Use this procedure to set up VAT tax percentages and associated G/L accounts. |
| [Setting Up VAT Categories](Setting_Up_VAT_Categories.md) | Use this procedure to create VAT categories, VAT categories identify the type of item being taxed: material, service, or other.. |
| [Setting Intrastat Information](Setting_Intrastat_Information.md) | Use this procedure to enable Intrastat functionality. |
| [Setting Electronic Payment Information](Setting_Electronic_Payment_Information.md) | Use this procedure to specify default information for electronic payments that you make to vendors. |
| [Setting Order Management Global Values](Setting_Order_Management_Global_Values.md) | Use this procedure to specify default information for the management of customers. |
| [Specifying Information on the Defaults Tab](Specifying_Information_on_the_Defaults_Tab.md) | Use this procedure to specify requisition approval group names, how purchase requisition approval tasks are generated, and requisition rejection codes. |

## Fields

Entity ID

The accounting entity ID. We recommend that you do not use single
quotations (), forward slashes (/), or commas (,) in your entity
ID. Using these characters may cause issues with integrations to other
products through Infor ION.

### General tab

Name

The name of the accounting entity.

Street
Addresses

The street address of the accounting entity. If you are licensed
to use one entity and one site, define the address in Application
Global Maintenance. The address information specified in Accounting
Entity Maintenance is not used in a single entity, single site database.

City

The city where the accounting entity is located.

State

The state where the accounting entity is located.

Zip

The zip code for the location.

Country

The country where the accounting entity is located.

Tax ID Number

 The entitys tax ID number.

Financial Calendar
ID

The financial calendar for this entity.
Define financial calendars in Financials Application Global Maintenance.
After you process transactions for this entity, this field is unavailable.
You cannot change the financial calendar after you process transactions.

Functional Currency
ID

The Functional Currency ID field is unavailable.
Assign the functional currency to an entity in Currency Maintenance.

Default Menu
Language

Select USA. This field enables menus when you build a baseline database.
The field does not control the translations used in the interface.
See [Translation Maintenance](VMTRNMNTWhat.md).

Effective
Exchange Rate

The date should be used to determine the exchange rate to apply
to a transaction.

### Costing tab

Costing Method

The costing method used by the accounting entity. See
[About Costing Options](Accessing_the_Costing_Tab.md).

Source
of Raw Material Cost

The transaction to use as the source of costs for purchased materials.

Labor
Cost Basis

The source of labor costs.

Burden
Basis

The source to use when calculating burden rates.

WIP
Costing

Indicates how work in process amounts are calculated.

FIFO
Method / Inventory Grouping

Indicates how to determine first in-first out costs.

POC
Revenue Recognition Method

For users of Aerospace & Defense modules, indicates the Percentage
of Completion (POC) revenue recognition method.

Costing
Between Levels

Indicates how to process costs when one fabricated part is a material
requirement in another fabricated part.

Receipt
Exchange Rate

The date to use to determine the exchange
rate applied to purchases.

### VAT tab

Value Added Tax Support
Enabled

Select the check box to use VAT in the accounting entity.

Use VAT Books
to Generate Invoice Numbers

Indicates whether the invoice and memo numbering information set
up in VAT Books is used.

Calculate VAT
on Freight

Indicates whether VAT is applied to freight charges.

VAT Categories
Required

Indicates whether users are required to
specify a VAT category when VAT is applied to a transaction,

VAT Registration

The VAT number of your accounting entity.

Next VAT Sequence
#

The next number to use for VAT reporting.

VAT Receivables
Export ID

The Receivables Export ID to use to generate reports to file.

VAT Payables
Export ID

The Payables Export ID to use to generate
reports to file.

VAT Book Setup

Click the button to set up VAT books. VAT Books control the numbering
sequence of all invoices and memos created when VAT is enabled.

VAT Setup

Click the button to set up the VAT codes to use in transactions.

VAT Category
Setup

Click the button to set up VAT categories. VAT categories identify
the type of item being taxed: material, service, or other. If you
have selected the VAT Categories Required check box, users are required
to select a VAT category for all VAT-related transactions.

### Intrastat tab

Intrastat Enabled

Select the check box to use Intrastat. The license key determines
whether the Intrastat tab is displayed.

Review Intrastat
before Saving Txn

To prompt users to review Intrastat information
before saving transactions, select this check box.

Country ID

The country ID of your company.

Branch ID

The branch ID of your company.

Next Sequence
#

The next number for Intrastat report.

Intrastat Frequency

How often the reports are generated. Click Monthly,
Quarterly, or Yearly.

Arrival Format

Click the button to specify the format for the Arrival report.

Dispatch Format

Click the button to specify the format
for the Dispatch report.

ESL Export ID

The ESL Export ID that is used to generate reports to file.

Next Sequence #

The next number for the ESL report.

ESL Frequency

How often the ESL report is generated.
Click Monthly, Quarterly,
or Yearly.

Port of Arrival

Click the button to specify codes that identify the place where
products are received.

Nature of Transaction

Click the button to specify codes that identify the type of transaction,
such as transfer of ownership or return of products.

Tariff

Click the button to specify Tariff codes. This code is for identification
purposes only. Using a code does not apply a tariff rate.

Country

Click the button to specify the countries that require Intrastat.

Port of Transshipment

Click the button to specify the locations that are used to ship
products.

Mode of Transport

Click the button to specify codes that identify the methods used
to transport products.

Region

Click the button to specify codes that identify the regions where
your warehouses are located.

### Payment tab

Next Payment
Batch Sequence #

The next batch number to use for payments.

Withholding
Enabled

Select this check box to withhold tax from vendor payments.

Next Sequence
#

The next sequential number to use for
reporting.

Social Security
No.

The company's or individual's social security number.

Summary Export
ID

The Export ID for monthly summary reports.

Certificate
Export ID

The export ID for tax certificates.

Pay
Commissions by

 The basis for commissions that you
pay to your sales reps. Click Cash Receipt
to generate commissions when payments are received from customers.
Click Invoice/Invoice Date to generate commissions
when the invoice is created.

Cash
Variance

Specify how to calculate cash variances.

Minimum

Specify the minimum variance to report.

Maximum

Specify the maximum variance to report.

### Order Mgt tab

WIP/VAS Enabled

Select the check box to enable WIP/VAS functions. The license key
determines whether this option is available.

CO Allocation Level

If you selected the Auto Allocate check box, specify whether materials
must be allocated to customer orders before orders can be placed.
Click one of these options:

Full Click this
option to require all materials to be allocated to customer orders
before the orders can be placed.

Partial Click
this option to optionally allow required materials to be allocated
to customer orders before the orders can be placed. When you click
this option, a customer order can be placed without materials allocated.

None Click this
option if you do not require materials to be allocated to a customer
order before it can be placed.

Requirement Allocation Level

If you selected the Allocations Require Warehouse/Location check
box, specify whether materials must be allocated to work order before
the work orders can be firmed or released. Click one of these options:

Full Click this
option to require all materials to be allocated to the work order
before the work order can be firmed or released.

Partial Click
this option to optionally allow required materials to be allocated
to a work order before the work order can be firmed or released. When
you click this option, a work order can be released without materials
allocated.

None Click this
option if you do not require materials to be allocated to a work order
before it can be released.

Allocations Require
Warehouse/Location

To allow users to allocate supply and
assign demand without specifying a warehouse or a location, clear
this check box. To require supply allocations and demand assignments
to have a warehouse ID and location ID before they can be linked to
transactions, select this check box.

Auto Allocate

To automatically allocate supply to demand,
select this check box. You cannot select the Auto Allocate option
unless you have selected the Allocations Require Warehouse/Location
option.

Default Shipping Weight
UM

The unit of measure to use for weight shipment in the Order Management
Window.

Default Back
Order Fill Rate

Specify the default fill rate to use for customer back orders. The
back order fill rate is a number between 0 and 100 that indicates
the minimum percentage of available stock that must be allocated to
the customer if a back order balance remains on a customer order.
For example, an order fill rate of 100 for a C/O line for 1,000 back-ordered
parts, produces a minimum fill rate quantity of 1,000; an order fill
rate of 80 for a C/O line of 1,000 produces a minimum fill rate quantity
of 800.

Priority Codes

Click the button to specify priority codes. Use priority codes to
determine what percentage of available stock can be used to fill a
customer order. Assign a priority code to a customer in Customer Maintenance.

WIP/VAS

If you selected the Enable WIP/VAS check box, this button is available.
Use WIP/VAS codes to specify the tasks that can be performed on inventory.

HTS Codes

Click the button to specify Harmonized Tariff Schedule codes. Use
these codes when you ship to and receive from international locations.

Customer Order
Types

Click the button to specify customer order types. Use customer order
types to classify the orders you place in the Order Management window.

Customer Types

If you selected the Allocation Require Warehouse/Location check
box, click the button to specify customer types. Use customer types
to determine how to allocate inventory to the customer's demand.

Part Alias Types

Click the button to specify part alias types. Part aliases are alternate
names for part IDs. Use Part Alias types to classify the alternate
names you use.

### Defaults tab

Approval
Labels 1 through 4

Specify the label to display on the Approval tab of the Purchase
Requisition Entry window.

Generate All Tasks
Simultaneously

To generate all purchase requisition approval tasks for groups simultaneously,
select the  check box. To generate approval tasks in sequential
order, clear the check box. When you clear the check box, the first
group must approve the purchase requisition before the second groups
approval tasks are generated.

Passwords Required
for Secured Fields

Select the check box o require users to enter passwords for fields
you have secured.

Create
Financial Batches with Only One Transaction

To create one batch per transaction when
you post to the general ledger, select this check box. If you post
multiple transactions to the general ledger at the same time, a batch
is created for each transaction. Clear this check box to create one
batch for all transactions in the posting.

Rejection Codes

Click the button to specify rejection codes. Rejection codes help
you classify rejected purchase requisition tasks. Purchase Requisition
Entry and ECN Entry share a common Rejection Code table. This feature
is available from both the ECN tab in Site Maintenance and the Default
tab in Accounting Entity Maintenance.

Cash Receipt
Default Back Acct

Specify the default account to use for cash receipts. You can select
any bank account associated with the current entity.

Cash Payment
Default Bank Acct

Specify the default account to use for payments. You can select
any bank account associated with the current entity.

Customer Balance Method

Specify how to calculate the customers open balance. Click one
of these options:

Orders, uninvoiced shipments
and unpaid invoices Click this option to calculate the customers
open balance as the total of open orders, uninvoiced shipments, and
unpaid invoices.

Uninvoiced shipments and
unpaid invoices Click this option to calculate the customers
open balance as the total of uninvoiced shipments and unpaid invoices.
Open customer orders are excluded from the calculation.

Unpaid A/R Invoices
Click this option to calculate the customers open balance as the
total of unpaid accounts receivable invoices only.