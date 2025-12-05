Adding Parts to the Database




# Adding Parts to the Database

You can add parts with or without Part IDs to the
part database. This procedure describes how to add parts to the part
database using a part ID. To add parts that do not have a part ID,
see [Adding Parts Without
IDs](Adding_Parts_Without_Part_ID_s.htm).

If you are licensed to use multiple sites, you can select a site
and define all part information when you are creating a part. Some
of the information you define is stored at the tenant level. If you
click the Save button before you complete the part record, you must
select the \*\*Tenant\*\* option in the Site ID field to continue specifying
information for certain fields.

Before you add a part to the database, define units of measure.
See [Adding Units of Measure](VMUMTMNTfrmUnitOfMeasure.htm).

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you are creating this part. If you are licensed
   to use a single site, this field is unavailable.
3. Specify this information:

Part
ID -  Specify the ID for the part. The ID can be any name
or number, up to 30 characters. This ID identifies the part to the
system. There can never be two parts with the same ID. An entry is
required.

Description - Specify a brief description for
the part. You can specify up to 40 characters.

Stock UM - Specify
the unit of measure in which the part is stocked. For example, if
you purchase this part by weight but stock it by length, you must
select the appropriate length unit of measure.

Shipping Weight - Specify the shipping weight
for the standard shipping quantity.

Weight UM - Specify the unit of measure used to
express the shipping weight.

Eng Master Eng ID
- This field applies to fabricated parts only. Specify the ID of the
engineering master for this part. This engineering master is used
to compute standard costs for this part the next time you chose to
recompute standard costs.

Product Code -
Specify the product code for this part. Use product codes to group
parts into classes and to specify which General Ledger accounts are
used in transactions involving the part. See [Adding
Product Codes](Adding_Product_Codes.htm).

Process Type
Click the browse button or arrow and select the process type for this
part.

Assign a process type to track the performance
lead time of this part. Performance lead time measures the duration
of the sales cycle. See [Performance
Leadtime Processes](What_is_Performance_Leadtime_.htm).

Commodity Code - Specify a commodity code for
this part. Use commodity codes to group parts together. You can use
both product codes and commodity codes to sequence and filter a variety
of material planning functions and many different reports. See [Adding Commodity Codes](Adding_Commodity_Codes.htm).

Case Qty - Specify the quantity of this part that
constitutes a case.

Pallet Qty - Specify the quantity of this part
that constitutes a pallet.

4. In the Settings section,
   specify the type of part you are adding. Select one or more of
   these check boxes:

Fabricated If you manufacture this part, select
the Fabricated check box. If the part is a raw material, clear the
check box. If you clear the Fabricated check box, the Purchased check
box is selected.

Purchased If you purchase this part from a vendor,
even if that vendor fabricates the part, select the Purchased check
box.

Consumable If this part has a Part ID but you
do not receive the part into inventory, select the Consumable check
box. At the time of receipt, consumables are expensed.

Demand History To store a summarized demand
history for this part for exporting to a forecasting function, select
the Demand History check box.

Inv Tx Locked To prevent all inventory activity
against this part, select the Inv Tx Locked check box.

Kit If this part is part of a larger multi-part
kit, select the Kit check box. This check box is available only if
you are licensed to use VISUAL DCMS.

Detail Only If you want to indicate that this
part is not a finished item of a work order, select the Detail Only
check box.

Stocked If you commonly stock this part, select
the Stocked check box. This field is informational only.

Tool/Fixture If you use this part as a tool
or fixture in your manufacturing process, select the Tool/Fixture
check box. When parts marked as tools or fixtures are used in a master
or work order, the part is highlighted in the Manufacturing Window.

Auto Issue If you have not set this part as
traceable you can use backflush or Auto Issue during labor transactions.

When you enter labor transactions for operations
that use this part, backflush parts are issued to the work order from
their default auto-issue locations. If no auto-issue location has
been specified, then the primary location is used. When a quantity
is reported as complete on a labor ticket, the quantity of auto-issued
parts required to manufacture the completed quantity is issued to
the labor ticket.

Supply then Leadtime This check box is active
only if you did not select the Use All Supply Before Applying Lead-time
in Material Checks check box in Site Maintenance.

To consider material supply beyond work
orders required dates, select this check box. When you select this
check box, the scheduler ignores a work orders required date when
locating material supply. When sufficient supply is located, the work
order is scheduled. If sufficient supply cannot be located, then the
materials lead time is used to determine when the work order can
be scheduled.

To consider material supply only up to the
work orders required date, clear this check box. When you clear this
check box, the scheduler does not look beyond the required date for
supply when there is insufficient supply at the required date. In
this case, it applies the parts or requirements lead time to determine
if sufficient supply can be obtained by the required date, or to determine
when it can obtain sufficient supply.

If you selected the Use All Supply Before
Applying Lead-time in Material Checks check box in Site Maintenance,
then all supply is considered beyond work orders required dates for
all parts in the site. You cannot override the setting for a particular
part. To specify this setting on a part-by-part basis, clear the Use
All Supply Before Applying Lead-time in Material Checks check box
in Site Maintenance.

The Concurrent Scheduler considers purchase
orders, purchase order delivery schedules, Coproducts, work orders,
and, if netting planned orders, planned orders, as supply.

5. Click the Save
   button. The current date is inserted in the Create Date field.

## Specifying Costing Information

Add costing information for the part in the Costing tab. If you
use standard costing, the costs that you specify in the costs and
burden sections are used when determining the costs of transactions.
If you use average or actual costing, the costs that you specify are
used as estimates when you use the part in the Manufacturing Window.

For fabricated parts, you can manually specify costs, or you can
calculate the costs based on the engineering master for the part.
See [Implode
Costs from Engineering Master back to the Part](Implode_Costs_from_Engineering_Master_back_to_the_Part.htm).

To specify costing information:

1. Click the Costs tab.
2. In the Costs section,
   specify this information:

Material For fabricated parts, enter the per
unit cost of the raw material you use to produce the part. For a purchased
parts, enter the per unit cost you incur in the purchase of this part.

Labor For fabricated parts, enter the estimated
labor cost to produce this part. For purchased parts, this field is
unavailable

Fixed This field is available for purchased
parts only. If you have any fixed costs associated with purchased
parts, such as vendor setup charges, specify the cost in the Fixed
field. Fixed charges are not per unit charges. They are one-time only
charges regardless of quantity.

Burden For fabricated parts, enter your estimated
cost of the burden to produce this part. For purchase parts, you cannot
specify a value in this field. If you specify a value in the Purchase
Burdens section, the value is inserted into this field.

Service For fabricated parts, enter the estimated
cost of outside services necessary to produce this part.

Total The total of all costs is calculated and
inserted in this field.

3. In the Issue Burdens
   section, specify the costs incurred internally when issuing the
   part to a work order. This does not include shipping costs. Specify
   this information:

Percent If a percentage of the material cost
is incurred when the material is issued, specify the percent in this
field.

Per Unit If burden is applied per unit when
the material is issued, specify the per unit cost in this field.

You can specify either a percent or a per
unit cost, or both. The burden cost is applied when the part is issued
to a work order.

4. In the Purchase Burdens
   section, specify the costs associated with purchasing this part.
   This does not include shipping costs. These fields are available
   only if the part is a purchased part. Specify this information:

Percent If a percentage of the material cost
is incurred when materials are purchased, specify the percent in this
field. The percent value is multiplied by the material cost and the
result is inserted in the Burden field.

Per Unit  If burden is applied per unit
when the material is purchased, specify per unit cost in this field.
The value is inserted in the Burden field.

Total Cost w/ Burden If you use Actual costing,
the total cost of the part plus the purchase burden is displayed in
this field.

5. The Standard Hours fields
   are available only if the part is fabricated. Use these fields
   to specify the standard number of hours required to manufacture
   one unit of the part. You can enter the information manually,
   but we recommend using the Implode Hours dialog box to calculate
   the information.

See [Calculating
Standard Unit Hours](Calculating_Standard_Unit_Hours.htm).

After you implode hours, this information
is displayed:

Setup
The total number of setup hours per unit based on the operations
in the default engineering master specified in the Eng Master Eng
ID field.

Run
The total number of run hours per unit based on the operations in
the default engineering master specified in the Eng Master Eng ID
field.

Multi-level Setup The total number of setup
hours per unit based on the operations on all engineering masters
that comprise the part. If material requirements in the default engineering
master are also fabricated parts, then the setup hours on the engineering
masters for the material requirements and the setup hours on the default
engineering master are included in the multi-level setup calculation.
Engineering masters for material requirements are examined until only
purchased material requirements are found.

For example, PARENT PART has a fabricated
material requirement called PART A, PART A has a fabricated material
requirement called PART B, and PART B has a purchased material requirement
for PART C, then the setup time for the PARENT PART, PART A, and PART
B is added to determine the multi-level setup standard hours.

Multi-level Run The total number of run hours
per unit based on the operations on all engineering masters that comprise
the part. If material requirements in the default engineering master
are also fabricated parts, then the run hours on the engineering masters
for the material requirements and the run hours on the default engineering
master are included in the multi-level run calculation.

For example, PARENT PART has a fabricated
material requirement called PART A, PART A has a fabricated material
requirement called PART B, and PART B has a purchased material requirement
for PART C, then the run time for the PARENT PART, PART A, and PART
B is added to determine the multi-level run standard hours.

5. In the Selling Price
   section, specify the default prices that customers pay you for
   this part. Specify this information:

Unit price Specify the default price per unit.
The price you specify is used if no customer-specific price, discount-specific
price, or market-specific price can be identified for the part. See
[Setting Unit Prices](Setting_Unit_Prices.htm).

Wholesale Unit Price Specify the default wholesale
unit price. Depending on the settings you use in Customer Maintenance,
VAT may be calculated based on the wholesale price instead of the
unit price. See [Adding New Customers](VMCUSMNTfrmCustomer.htm).

6. In the Price Controls
   section, specify this information:

ABC
Code - If you use ABC Code analysis in your inventory management
system, enter the code to use for this part. See [Using
ABC Analysis](Using_ABC_Analysis.htm).

Customer Price Effectivity Settings - Specify
the action to take if a customer-specific price cannot be found for
this part when a customer order is shipped. This field overrides the
default setting specified in Application Global Maintenance. Specify
one of these options.

Yes To prevent
the shipment of this part if a valid unit price cannot be found in
the Customer Pricing table for the date of shipment, specify Yes.
If you select this option, you must specify Shipments or Both in the
By Order/Ship Date column when you set up customer-specific pricing.
See [Setting Unit Prices](Setting_Unit_Prices.htm)

No To use the unit
price specified on the customer order line if no price exists in the
Customer Price table for the date of shipment, specify No. Select
this option to allow the customer order to be shipped even if a customer
price has not been defined.

Warn To display
a warning message if a valid price cannot be found in the Customer
Price table, specify Warn. You can use the Unit Price from the Customer
Order line to complete the shipment.

Leave the field blank to use the setting
specified on the Defaults tab in Application Global Maintenance.

To set up customer pricing for this part,
see [Setting Unit Prices](Setting_Unit_Prices.htm).

Price Group If you use VISUAL Pricebook and
want to set up pricing information by price group, specify the group
ID.

Bid Rate Category Specify the bid rate category
for this part. Use bid rate categories to analyze budgets and quotes
for this part. Set up bid rate categories in Application Global Maintenance.

7. Click the Save
   button.

## Specifying Planning Information

Use the Planning tab to specify how to plan the inventory for this
part. The planning tab is displayed if you are using the Material
Resource Planning module.

You can define planning information for this part for each independently
planned warehouse where it is stored. You can also define planning
information for all universally planned warehouses.

To add planning information for the part:

1. Click the Planning
   tab.
2. In
   the Warehouse ID field, click the arrow and select the independently
   planned warehouse for which to define planning information. To
   define information for all universally planned warehouses, select
   Universal.
3. Specify this information:

Planner User ID Specify the ID of the person
responsible for material planning for this Part ID. Use this field
for sorting and searching in material planning. The planner does not
have to be a valid VISUAL user and is not a required field.

Buyer User ID Specify the ID of the person responsible
for buying this Part ID. Use this field for sorting and searching
in material planning. The buyer does not have to be a valid VISUAL
user and is not a required field.

Safety Stock Qty Specify the amount in excess
of real demand of this part to store in your inventory. This excess
inventory covers fluctuations in demand caused by unplanned orders,
scrap, or other events.

Lead Time (in days) Specify the number of days
required to replenish parts in your inventory. For example, lead time
could be made up of manufacture time and delivery. This value is used
to compute order release and want dates when only one of these two
dates is known. You should enter a Lead Time if you are using MRP
or scheduling.

Min/Max
Order Qty Specify the minimum and maximum suggested quantity
used by MRP when placing a planned order. Use this number as a material
planning guide. An entry of zero means there is no minimum. This number
does not restrict other types of orders and is only used by MRP when
creating planned orders.

Multiples of Specify the multiple to use when
MRP plans an order for this part. The quantity specified on the planned
order is divisible by the value you specify. For example, if part
A is ordered in multiples of 100, and the quantity required after
an MRP run is 67, a planned order with a quantity of 100 is created.

For parts with an order policy of Master
Schedule, the planned order quantities displayed in the Current MRP
Plan line are expressed as a multiple of the value you specify. The
Current MRP Plan line does not necessarily match the demand line.
For example, if you specify 500 in the Multiples of field, and the
actual demand is 550, then the planned order quantity is 1000. If
you did not specify a value in the Multiples of field, the demand
line and current MRP plan line would match.

Order Policy Specify the order policy to use
when you create planned orders with MRP. Select one of these options:

Not Planned To
buy this item only when the on hand quantity is less than the Order
Point Quantity, select the Not Planned option.  MRP does not
generate planned orders for parts with this policy.

Discrete To replenish
exactly the quantity by which the demand exceeds supply after subtracting
safety stock from supply, select the Discrete option.

Period Supply Use
this field in conjunction with the Days of Supply field. Specify this
option to create planned orders that meet demand on a specific date
plus the number of days you specify in the Days of Supply field.

Fixed To replenish
stock using the fixed quantity specified in Order Qty, select the
Fixed option. Fixed functions similarly to EOQ.

EOQ (Economic Order Quantity)
To replenish stock using exactly the quantity that is needed, select
the EOQ option.

Master Schedule
To replenish stock only according to the master schedule, select the
Master Schedule option.

Days of Supply This field is available if you
select Period Supply as your order policy. Specify the number of days
in a supply period.

Order Qty This field is available if you selected
Fixed as your order policy. Specify the quantity to order when a planned
order is created.

Order Point Qty This field is available if you
selected Not Planned as your order policy. Specify the smallest quantity
of this part to keep on hand. When your inventory equals or falls
below the value you specify, then an order should be placed.

Order Up To Qty
- This field is available if you select Not Planned as your order
policy. Specify the maximum quantity that can be ordered for this
part on a planned order.

Annualized Usage Specify the estimated or calculated
annualized usage of this part. You can use this number during ABC
analysis. It can only be entered manually or updated by a custom program.

Demand Fence 1 Specify the number of days in
a real demand period. This value overrides product code and global
settings.

Demand Fence 2
Specify the number of days in a mixed demand period. This value
overrides product code and global settings.

Do Not Inherit Demand
Warehouse Clear this check box to automatically assign the
part to the warehouse specified in the Header Card on an Engineering
Master, Work Order, or Project Master (Projects/A&D users only).
You can override this setting on a case-by-case basis on any Material
Cards that use this part.

Select this check box if you do not want
the part to be automatically assigned to the warehouse specified on
the Header Card. If you select this check box, the system disables
the Inherit Demand Warehouse check box on the Material Card. You can
issue the part as needed in Inventory Transaction Entry.

Inventory Controlled by ICS This feature is
inactive and is reserved for future use.

Rate
Based Fabrication
 Select this check box to indicate that the part is a rate-based
part. A rate-based part is a fabricated part that you produce in predictable
daily quantities. Because the daily run rate is predictable, the quantity
produced per day is used to determine when supply of the part is anticipated
to be available to meet demand. See [What
Are Rate-based Parts?](What_Are_Rate-based_Parts_.htm).

4. Click the Save
   button.

## Specifying Accounting Information

Use this tab to specify the general ledger accounts to use when
an inventory transaction is performed with this part. If you do not
specify accounts, the default accounts specified in the GL interface
in Financials Application Global Maintenance are used. Also specify
the default sales tax group ID to use with this part on customer orders.

To specify accounting information:

1. Click the Accounting
   tab.
2. Specify this information:

Material - Specify the account to use to record
material costs.

Labor - Specify the account to use to record labor
costs for this part. This field is available only if the part is a
fabricated part.

Burden - Specify the account to use to record
burden costs for this part.

Service - Specify the account to use to record
service costs for this part. This field is available only if the part
is a fabricated part.

Default Sales Tax Group ID - Specify the default
tax group to use for this part on Customer Orders. The system will
use this ID on Customer Orders if no other Tax Groups for this part
have been defined in the [Sales
Tax Group by Part ID](Assigning_Sales_Tax_Groups_by_Part_ID.htm) dialog box.

UPC
- Specify the universal product code (UPC) or European Article Number
(EAN) for a unit of the part. To specify a UPC code, enter a 12 digit
number. To specify an EAN code, enter a 13 digit number. Do not add
spaces to the number; the correct spaces are inserted after you save
the part.

UPC
Pkg - Specify the universal product code (UPC) or European
Article Number (EAN) for a package of the part. To specify a UPC code,
enter a 12 digit number. To specify an EAN code, enter a 13 digit
number. Do not add spaces to the number; the correct spaces are inserted
after you save the part.

3. Click the Save
   button.

## Specify Default Information

Use the Defaults tab to specify default vendor and warehouse information
for this part.

To specify default information:

1. Click the Defaults
   tab.
2. Specify this information:

Preferred Vendor ID - Specify the vendor from
whom you purchase this part. The price breaks this vendor provides
are used to estimate costs in the Manufacturing Window and the Estimating
Window.

You can specify the preferred vendor either
by browsing for the Vendor ID or the Vendor Name. To browse for a
vendor by ID, click the browse button and select the ID. The name
associated with the ID is inserted in the Vendor Name field. To browse
for a vendor by name, click the Vendor Name browse button and select
the name. The Vendor ID is inserted in the Vendor ID field.

Manufacturer - Specify the name of the manufacturer
who makes this part.

Manufacturer Part ID - Specify the ID that the
manufacturer of this part uses to identify this part.

Primary Warehouse ID - Specify the default warehouse
to use to issue and receive this part.

Primary Location ID - Specify the default warehouse
location to use to issue and receive this part.

Auto-issue Warehouse ID - If you selected the
Auto Issue check box in the Settings section, specify the ID of the
warehouse that issues the part.

Auto-issue Location ID - If you selected the Auto
Issue check box in the Settings section, specify the warehouse location
that issues the part.

Inspection Required - If this part must be inspected
upon receipt, select this check box. If you select this check box,
specify a default inspection warehouse and location. If this part
does not require inspection, clear this check box.

Inspection Warehouse ID - If this part requires
inspection, specify the default warehouse that receives the part.

Inspection Location ID - If this part requires
inspection, specify the default warehouse location that receives the
part.

Default Package Type - Specify the default packaging
type for this part. Specify packaging types in Application Global
Maintenance.

Default NMFC Code ID - Specify the default National
Motor Freight Code ID for this part. Specify NMFC codes in Application
Global Maintenance.

Ship Dimensions - Specify the shipping dimensions
for this part.

3. Click the Save
   button.

## Adding User Defined Information for Parts

Use this tab to specify the
user-defined information required by your company.

To specify user-defined information:

1. Click the User
   Def tab.
2. Select the user-defined
   layout to use.
3. Specify the required
   information in the user-defined fields.
4. Click the Save
   button.

## Adding Piece Tracking Information for Part

If you are licensed to use piece tracking, the Piece Trk tab is
displayed. Use this tab to specify whether the part is a dimensional
part. Dimensional inventory takes into account the shape and size
of a part, not just the number of units. See [What
is Dimensional Inventory?](What_is_Dimensional_Inventory_.htm). To specify dimension information:

1. Click the Piece
   Trk tab.
2. Specify this information:

Part is inventoried using Piece Tracking - If
this part is a piece tracked part, select this check box. When you
select the check box, the remaining check boxes and field on the tab
are made available. Use these check boxes to specify the dimensions
required to measure this part when the part is used in transactions.
You must select at least one of the remaining check boxes.

If this part is not a piece tracked part,
clear this check box.

Length of part is required - If you require that
the length of the part be specified when working with this part, select
this check box. If you select this check box, the length of this part
must be specified when the part is used in transactions.

Width of part is required - If you require that
the width of the part be specified when working with this part, select
this check box. If you select this check box, the width of the part
must be specified when the part is used in transactions.

Height of part is required - If you require that
the height of the part be specified when working with this part, select
this check box. If you select this check box, the height of the part
must be specified when the part is used in transactions.

Dimensions UM
- Specify the unit used to measure the part's dimensions.

3. Click the Save
   button.

## Adding Specifications

Use
the specifications tab to describe the part in more detail. The text
you enter in the Part specification is used any time you use the part
in a customer order, purchase order, or engineering master. You can
specify additional specification text for each of these transactions.
For example, if you specify Part CO text, the text you enter for the
Part spec and the Part CO spec are both used in a customer order.

To add specifications:

1. Click the Specifications
   tab.
2. Click the type of specification
   to add. You can select Part, Part
   CO, Part PO, or Part
   Mfg.
3. Enter the text.
4. Click the Save
   button.

## Specifying Intrastat and VAT Information

Use this tab to specify information required for Intrastat and VAT.

If you have not enabled VAT or Intrastat in Accounting Entity Maintenance,
the tab is not displayed in the Part Maintenance window. If you enable
only one of VAT or Intrastat, the tab title displays only the option
you enabled. For example, if you only enabled Intrastat, the tab is
named Intrastat. Any items on the tab related to VAT would either
not be displayed or be unavailable.

To specify Intrastat and VAT information:

1. Click the Intrastat/VAT
   tab.
2. Specify this information:

VAT Code - Specify the VAT code for this part.
The VAT code determines the VAT percentage applied, the percentage
recoverable, and the accounts to use to record VAT transactions. Set
up VAT codes in Application Global Maintenance. value added tax code
for this part.

Intrastat Exempt - To indicate that this part
is exempt from Intrastat, select this check box. To indicate that
Intrastat information must be specified for this part, select this
check box.

Tariff Code - Specify the tariff code for this
part. The tariff code defines the class of good being transported.

Originating Country ID - Specify the part's country
of origin.

Net Weight - Specify the net weight per part unit.

Gross Weight - Specify the gross weight per part
unit.

Weight UM - Specify the unit used to measure weight.

Volume - Specify the volume per part unit.

Volume UM - Specify the unit used to measure volume.

Excise Unit Price - Specify the unit price used
by customs and excise. Specify this value in your system currency.
This is a statistical value that is not an actual part price.

3. Click the Save
   button.

## Specifying Order Management Information

Use the Order Management tab to specify
order management information for your part. Order Management features
allow you to control the manner in which you sell parts to customers
and manage the replenishment of those parts.

To specify order management information:

1. Click the Order
   Mgt tab.
2. In the Parts section,
   specify this information:

Substitute Parts
Substitute parts are parts that you can sell to a customer in place
of the specified part. For example, you may make a generic and a name
brand version of a product. The generic version could be a substitute
part for the name brand version. To specify substitute parts:

1. 1. Click the Substitute
      Parts browse button.
   2. Click Insert.
   3. Double-click the Substitute
      Part ID browse button and select the substitute part.
   4. In the Rank column, specify the order
      in which the substitute part is displayed in the Order Management
      window.
   5. Click the Save
      button.

Cross Selling Parts
Cross-selling parts are parts that through similar structure, functionality,
or price, you can logically group or sell with the current part on
a customer order. The use of cross-selling parts is exclusive to the
Order Management module. To specify a cross-selling part:

1. 1. Click the Cross Selling
      Parts browse button.
   2. Click Insert.
   3. Double-click the browse button and select
      the part to cross-sell.
   4. Click Save.

Part Aliases
Part aliases are alternate names, abbreviations, or other designations
for a Part ID. The use of part aliases is exclusive to the Order Management
module.

1. 1. Click the Part Aliases
      browse button.
   2. Click Insert.
   3. Specify this information:

Alias ID Specify
a part alias ID.

Description Specify
a description of the part alias ID.

Type Click the
arrow and select the type associated with this alias ID.

1. 4. Click Save.

4. In the Harmonized Tariff
   Schedule section, specify this parts HTS information:

HTS Code Click
the HTS Code browse button and select the code to use from the list.

Default Country of Origin
Click the Default Country of Origin browse button and select the
country of origin to assign to this part. The system lists any country
used in a customer record, customer ship-to address, customer address,
vendor record, vendor address, and vendor remit-to address.

Material Code
Specify a material code for this part.

Material Codes are unique identifiers for
parts that you ship to international customers. If you are using Shipment
Tracking to track the whereabouts of shipments and inventory holdings,
you may want to assign material codes to parts. You do not have to
use Shipment Tracking to use this feature.

5. Click the Save
   button.

## Specifying Drum-Buffer-Rope Information

If you are licensed to use drum-buffer-rope, add the Drum Buffer
Rope information for your part on the DBR tab.

To specify this information:

1. Click the DBR
   tab.
2. Specify this information:

Planner User ID
Enter the name of the person responsible for material planning for
this Part ID. Use this field for sorting and searching in material
planning. The planner does not have to be a valid database user and
is not a required field.

Buyer User ID
Enter the name of the person responsible for buying this Part ID.
Use this field for sorting and searching in material planning. The
buyer does not have to be a valid database user and is not a required
field.

Safety Stock Qty
Enter the amount in excess of real demand of this part that you
plan to keep in order to cover fluctuations in demand caused by unplanned
orders, scrap, or other events.

Demand Horizon (in days)
Enter the number of days in advance to look for demand for this
part.

Min/Max Order Qty
Enter the minimum and maximum suggested quantity used by MRP when
placing a planned order. This number is used as a material planning
guide. An entry of zero means there is no minimum. This number does
not restrict other types of orders and is only used by MRP when creating
planned orders.

Multiples Of
Enter the number by which you want DBR to calculate quantities of
this part. For example, if DBR is working with a quantity of 67 and
you have specified 100, the DBR Scheduler will increase the quantity
to 100.

Leadtime Buffer (in hours)
Enter the number of hours (24 hours per calendar day) to use for
the lead-time buffer when you are purchasing this part.

Minimum Leadtime (in
hours) Enter the minimum lead-time in hours (24 hours per
calendar day) to use when you are purchasing this part in an expedited
mode.

Replenishment Level
Enter the stock quantity below which you do not want your stock
levels to fall. When your stock level falls below the replenishment
level, VE automatically generates a work order for fabricated stocked
parts.

If you have a demand (customer order) for
this part, VISUAL creates a separate work order for the make to stock
parts.

Emergency Stock %
For stocked materials, whether you purchase them or make them, when
your on hand quantity reaches the Emergency Stock % of the replenishment
level, it is time to expedite the acquisition of more of this material.

In TOC terms, when this happens, the part
is in the Red Zone of its inventory buffer.

Yellow Zone Stock %
Enter the quantity of stock at which level you want the DBR Schedule
to recognize demand.

Demand Fence
Enter the number of days in a real demand period.

3. Click the Save
   button.

## Specifying Configuration Management Information

Use the Configuration Management tab to specify revision information.

To specify this information:

1. Click the Configuration
   tab.
2. Specify this information:

Stage
- Specify the stage for this part. You can select Design, Manual,
Pilot, or Release.

Revision
ID - Specify the identification of the current revision for
this part.

Drawing
# - Specify the drawing number for this part.

Drawing
Revision - Specify the revision number for the drawing of this
part.

Drawing
File - Specify the location of the drawing file for this part.

Alternate Parts
Click the Alternate Parts button to add
alternate parts. Alternate parts can be used in place of the current
part in engineering masters, quote masters, and work orders. You can
issue an alternate part to a work order in Inventory Transaction entry,
provided that the alternate part you choose has the same unit of measure
as the original part. If the alternate part does not have the same
unit of measure, Inventory Transaction Entry prevents you from issuing
the part.

You can also replace a material requirement
with an alternate part in the [Material
Planning Window](Replacing_a_Material_Requirement_with_an_Alternate_Part.htm).

To enter alternate parts:

1. Click the Insert
   button.
2. Double-click the browse
   button in the column header. The system displays a list of available
   parts.
3. Select the alternate part.
   Double-click the part or select it and click the Select
   and Close toolbar button. The part information is displayed
   in the dialog box.
4. Specify a rank for the
   alternate part. The rank indicates the order of preference for
   the part. If more than one alternate part is available in a master,
   the user should choose the part with the highest rank. You can
   establish any ranking system you want; for example, you can determine
   if a high rank number indicates a high priority or a low priority.
5. Click the Save
   button.

ECN
Controls Revision - If you control revisions for this part
with ECNs, select the ECN Controls Revision check box.

Obsolete - If
this part is obsolete, select the Obsolete check box.

For more information on obsolete parts,
see [Classifying Parts
as Obsolete](Classifying_a_Part_as_Obsolete_.htm).

3. Click the Save
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help