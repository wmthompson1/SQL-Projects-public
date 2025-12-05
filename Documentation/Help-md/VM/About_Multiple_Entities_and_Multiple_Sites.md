About Multiple Entities and Multiple Sites




# About Multiple Entities and Multiple Sites

If you are licensed to use multiple entities and multiple sites,
you can set up and manage a robust corporate structure.

In a multi-entity environment, a parent enterprise/company has separate
business units or divisions that are separate legal entities, each
with their own tax ID and independent financial statements and reporting.

Each of these accounting entities can have multiple sites. Financial
statements and reporting is at the accounting entity level, but inventory
control, WIP, planning and other data is separated by site.

These terms are used to describe the components of your enterprise
structure.

## Tenant

A tenant is the corporate parent or top level of the organizational
structure. Each database can have only one tenant. Information you
define at the tenant level applies to all accounting entities and
sites in your database. Information defined at the tenant level includes,
but is not limited to:

* Certain application-wide
  information, such as purchase quote type, the default directory
  for documents, and interface theme
* Common codes, such as Honorifics,
  Packaging Types, Carriers, Workflow Codes, Commodity Codes, and
  Units of Measure
* Certain master data, such
  as GL Accounts, Employees, and Vendors. While you define employees
  at the tenant level, you can assign them to particular sites.

For some records, such as parts, you define certain information
at the tenant level and certain information at the site level. You
can also choose to override some of the tenant information for the
part with site-specific information. For example, in Part Maintenance
the Part Description can only be defined at the tenant level. The
Eng Master ID can only be defined at the site level. The Effectivity
Date Price for Shipments setting for a part can be specified at the
tenant level, and then be overridden at the site level. When the site-level
information is different from the tenant-level information, the text
in the field is displayed in blue on the site-level record. For options
and check boxes, the label is displayed in blue.

## Accounting entity

An accounting entity is an independent financial entity within your
company. The accounting entity is the middle level of the organizational
structure. Each accounting is summarized to the Tenant level. Information
defined at the accounting entity level includes, but is not limited
to:

* Costing information, such
  as the costing method, POC revenue recognition method, and burden
  basis
* Default VAT information
* Default Intrastat information
* Payment information, such
  as Next Payment Batch Sequence # and withholding information
* Default Order Management
  information, such as whether WIP/VAS is enabled, how the date
  of the oldest outstanding invoice is determined, and allocation
  information
* Certain financial information,
  such as currency exchange rates.

## Site

A site is a specific, physical location. Sites are assigned to accounting
entities. Each site can be assigned to only one accounting entity,
but each accounting entity can have multiple sites.

Information defined at the site level includes, but is not limited
to:

* Scheduling information
* Shipment tracking information
* Default ECN information
* Default inventory, labor,
  and inspections, and project information
* Engineering masters, quotes,
  and work orders

Most transactions occur at the site level. You can also run most
reports for a single site, or you can choose to run them for multiple
sites.

You assign parts, services, shop resources, and employees to sites.
The system administrator assigns database users to particular sites.
Users can only view and create information in the sites to which they
are assigned.