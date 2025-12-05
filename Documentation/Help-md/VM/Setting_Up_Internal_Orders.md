Setting Up Internal Orders




# Setting Up Internal Orders

Before you can create an internal purchase order, you must:

* Set up an FOB code that
  designates who owns inventory while it is in transit
* Specify default in transit
  accounts and intercompany AR and AP accounts in the GL Account
  Interface
* Set up an internal Customer
  record
* Set up an internal Vendor
  record

## Setting up FOB codes

To set up FOB codes for buying and selling between sites in different
accounting entities:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Table Maintenance, FOB
   Point.
3. Click Insert.
4. Specify this information:

Code Specify
the ID for this FOB Point.

Description
Specify a description for this FOB Point

Intransit Owner
Click the arrow and specify who owns the inventory while it is in
transit. Select Receiving if the site receiving the inventory owns
the inventory. Select Shipping if the site shipping the inventory
owns the inventory.

5. Click Save.

## Specifying Default Accounts

Set up accounts to use to record the costs associated with internal
buy/sell orders.

### Specifying Transit Accounts

Before you ship any inventory between sites, specify the default
in transit accounts to use. These accounts are used to record inventory
costs while the inventory is in transit. To specify default accounts:

1. Select Ledger,
   Application Global Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site for which you are defining accounts. If you are licensed
   to use a single site, this field is unavailable.
3. Click the GL
   Interface tab.
4. Specify default account
   numbers for these accounts:

* A/P Intercompany
  Cash
* A/R Intercompany
  Cash
* Intransit
  - Burden
* Intransit
  - Labor
* Intransit
  - Material
* Intransit
  - Services

5. Click Save.

### Specifying Purchasing and Sales Accounts

When you create an internal purchase order, you may want to use
different accounts to record the transactions than the accounts you
use for external purchases and sales. These accounts are used to record
material costs and revenue. To set up these accounts, create a product
code to use on internal purchase and sales transactions.

When you create an internal purchase order, you can specify the
product code on the purchase order line. When you run costing, the
accounts associated with this product code will be used for transactions
related to the internal purchase order.

To set up a product code for use with internal purchase and sales
orders:

1. Select Inventory,
   Part Maintenance.
2. In the SIte ID field,
   click the down arrow and select Tenant.
3. Select Maintain,
   Product Codes.
4. Click Insert.
5. Specify the product
   code and description.
6. In the table, specify
   an account to use with each category.
7. Click Save.

When you enter an internal purchase order, specify the product code
you defined. When you run costing, this product code will be examined
to determine which accounts to use.

## Setting up an internal vendor

Create a vendor record for sites that send shipments from other
sites. To set up an internal vendor:

1. Select Purchasing,
   Vendor Maintenance.
2. In the Vendor ID field,
   specify an ID for the internal vendor.
3. In the General
   tab, click the Internal Vendor check box.
4. Click the Accounting
   tab and specify this information:

Currency ID
Select the currency ID for this internal vendor.

Internal Site ID
Click the arrow and select the site ID this vendor ID represents.
For example, if this vendor is the vendor you use when you buy from
Site MMC, specify MMC in this field.

5. Complete the other information
   for the internal vendor as necessary.
6. Click Save.