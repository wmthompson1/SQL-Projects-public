About Master Data in the Multi-site Environment




# About Master Data in the Multi-site Environment

Master data are the building blocks of transactions. Master data
include records such as parts, customers, currency codes, shop resources,
outside services, and warehouses.

In a multi-site environment, you define certain master data at the
tenant level. When you maintain master data that is defined at the
tenant level, you do not select a specific site ID. The information
you define at the tenant level applies to all of the sites in the
database. Master data you define at the tenant level include:

* Common codes, such as Customer
  Order Acknowledgement Codes, Harmonization Codes, National Motor
  Freight Codes, Standard codes, Workflow Codes, Adjustment Reasons,
  Deviation Reasons, Inspection Reasons, Issue/Return/Transfer Reasons,
  RMA Reasons, AIC Codes, Commodity Codes, Countries, FOB Points,
  Honorifics, Ship Via Codes, SIC Codes, States & Provinces,
  Territories
* Export Formats
* Packaging Types
* Report Format Overrides
* Departments and Terms
* Documents
* Employees (Employee data
  is maintained at the tenant level, but you assign employees to
  work in sites and define employee pay rates by site)
* Hold Reasons, Markets, and
  Sales Tax Groups by Part
* Units of Measure and unit
  conversion settings
* Sales Tax Groups
* GL Accounts

You define certain master data at the site level only. Master data
you define at the site level only include:

* Equipment
* Warehouses, including part
  locations

In some cases, you must define certain information at the tenant
level, then define additional information at the site level. When
you define this type of master data, you first select \*Tenant\* in
the SIte ID field and define certain pieces of information. After
you save the record at the tenant level, you then select a specific
Site ID and complete the master data information. The master data
that you define in this manner are:

* Parts
* Outside Services
* Shop Resources

You define Customers at the tenant level, but you specify credit
limit information by account entity and order management information
by site