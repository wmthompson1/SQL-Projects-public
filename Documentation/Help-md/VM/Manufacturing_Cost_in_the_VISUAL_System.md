Manufacturing Cost in the VISUAL System




# Manufacturing Cost in the VISUAL System

Whether using standard or actual costing, all transactions
that change a parts inventory balance or the unit cost are captured
as they occur.

In order to fully appreciate Costing in VISUAL, it is necessary
to understand inventory valuation.

## Inventory Valuation

There are a number of different methods to value inventory LIFO,
FIFO and Average Cost. VISUAL uses the FIFO (First-in First-out) method
of valuing inventory. The FIFO method inventory valuation assigns
cost to inventory in cost layers. Each addition (purchase, inventory
receipt, or adjustment in) adds a new cost layer. Each subtraction
(issue, sale, or adjustment out) removes one or more cost layers.

VISUAL uses two types of FIFO layers. The first, raw materials inventory
contains layers by way of purchases from a supplier or when you create
a return from an issue return from work-in-process back to inventory
(in the case of an over issue). Second, work-in-process can also contain
FIFO layers, which include multiple inventory issues for the same
part on a work order. This is categorized as a WIP Issue Layer.

In a standard cost database all inventory transactions are performed
at the standard rate and therefore the melded issue costs carry the
same value as the FIFO inventory layers.

## FIFO From Purchases

Every receipt of raw material inventory or finished goods inventory
(VISUAL does not hold a distinction) is assigned a per unit price
value. Raw material inventory FIFO layers are created when a purchase
is received into inventory. The cost of the purchased inventory is
derived by the number of units received times the per unit cost as
identified on the purchase order. This value will also represent the
purchase order accrual value. Each purchase creates a unique layer
of inventory which displays the inventory valuation report accessed
from the Reports menu.

## FIFO Layers from Issue Returns

Issue returns (parts issued to a work order returned to inventory)
also create a FIFO layer. When parts are issued to a work order their
costs are added to work-in-process based on the raw material FIFO
layer they came from. If the issue to WIP is derived from more than
one layer then the costs of all the layers issued to fulfill the requirement
are melded together to create a single WIP issue layer. Any subsequent
issues of the same part to a work order will create an additional
WIP issue layer. If a part on the work order is returned to inventory
from work-in-process, a new cost layer is created with the layers
value being derived from the WIP issue layers currently residing in
the work order. If there is only one issue of a particular part for
the work order the cost is straight forward. It would be, the average
unit cost (by melding original FIFO layers) times the number of units
returned to inventory. This transaction can be seen in transaction
table (Txn #5) below where the parts returned derive their cost layer
from the average on the FIFO layer issues in Txn #3.

Where there are more than one raw material inventory "issues"
to a work order the costs are returned from the WIP issue layers in
FIFO order. This scenario is depicted in transaction # 7 below, where
the costs of the new raw material FIFO layer is derived from two WIP
issue layers (5 units at 2.168 (rounding), plus 100 units at 2.2996
= 240.80).

## FIFO Layers from Receipts and/or Adjust In

Two other ways FIFO layers in inventory happen are through a receipt
of inventory (finished goods) from a work order. The cost of the inventory
layer is derived from the average unit cost on the work order times
the number of units. If the receipt closes the work order (complete
receipts) the entire cost of the work order at the time of the receipt
is the value of the FIFO layer.

Adjustments into inventory create a separate cost layer in inventory
for the per unit cost assigned during inventory transaction entry.
If no cost is assigned at that time, the cost will be derived by the
unit cost as set on the part master file when costing utilities is
run.

## Inventory Transactions

There are 10 classes of inventory transactions. Each of these transactions
either move goods in or out of inventory, or transfer between inventory
locations. There are, therefore, 18 possible transaction types. Most
transactions affecting inventory (with the exception of transfers)
either add or remove costs from inventory.

## Transaction Types (Basics)

### P/O Receipts

The P/O Receipts are purchased items received into stock. When these
costs are received they are assigned to an inventory warehouse location.
The number of units purchased as well as the cost of the purchased
parts will become a new cost layer of raw materials inventory. When
the PO Receipt is received into inventory VISUAL books the entry to
record a purchase accrual (credit) with the offsetting debit to Inventory.

Inventory parts can be purchased directly to a work order. When
these parts are received they are booked to raw materials inventory
and immediately issued to the corresponding work order. The inventory
transaction entry report will depict this process. Purchased parts
that are purchased on behalf of an existing work order are given the
same treatment as inventory issues when received into the warehouse.
The only time these costs would become a FIFO layer is if they are
subsequently received into inventory through an inventory issue return.

As stated above VISUAL uses the FIFO method of valuing inventory.
However, there is another level of complexity to inventory valuation;
part warehouse location. For each part in inventory, there may be
multiple holding bins in the warehouse. Each inventory transaction
affects one or more of these locations, and VISUAL must therefore
maintain each of these locations in order to report proper inventory
valuations if the FIFO by part locations in application global maintenance
is set.

### Services

In the same manner as purchased parts, services can be purchased
directly from the manufacturing window and are treated by costing
utilities as if they were purchased parts. Costs are booked to WIP
with the offset to the purchase accrual account.

### Inventory Issues/Issue Returns

Inventory issues are transactions that assign raw material inventory
to a specific work order. Inventory issues will normally cause the
reduction of one or more inventory layers. These costs become the
basis of the material costs assigned to WIP. Inventory issue transactions
are prepared by costing utilities to debit WIP and credit Inventory.

Issue returns are inventory parts sent back to the warehouse. Issue
returns would most likely result from overissues or raw materials
to a work order. Costing utilities accounts for these costs by a credit
to raw materials inventory and a debit to WIP.

### Accounts Payable

Costs can be directly assigned through accounts payable for items
that did not undergo the normal purchasing process. In the invoice
entry window these costs can be linked to the work order. In doing
so, VISUAL requires the user to enter the GL code to cost the items.
The GL Account assigned to an accounts payable invoice linked directly
to a work order is treated as a clearing account. Costing utilities
post and offset entry to the GL account and apply the transaction
value to WIP.

### Warehouse Transferred

The cost implication (i.e., treatment of warehouse transfers) is
dependent on the setting for FIFO method in application global. If
you select FIFO by Part, transfers from one location to another do
not have any cost implications; inventory transaction entry records
the movement (without cost implication) to the new location. If you
select FIFO by part location in Application Global, VISUAL records
cost movements between locations.

### Adjustments In/Out (Inventory)

Usually, inventory adjustments stem from physical inventory counts.
Typically, companies take physical counts to keep perpetual records
in line with actual inventory on hand. Discrepancies between the actual
inventory on hand and the perpetual records require inward or outward
adjustments. If an inward adjustment is required, VISUAL costs this
adjustment as a new cost layer. Outward adjustments remove costs from
an existing cost layer or potentially remove an entire cost layer
from inventory. When entering adjustments through inventory transaction
entry, VISUAL requires you to assign a G/L account for the other side
of the transaction. VISUAL knows raw materials inventory is either
debited or credited (depending on the adjustment type). You must define
the G/L offset account to apply the other side of the transaction.

### Direct Labor / Burden

Labor charges are applied during labor ticket entry. Whether entering
labor charges through bar code or entering via a computer terminal
station, costs are applied to the labor ticket area. All costs for
setup and run times are recorded into WIP via costing utilities. In
order to record direct labor in WIP, VISUAL creates a debit to WIP
labor, and a credit to Manufacturing Direct payroll.

Burden (overhead) represents costs associated with the cost of manufacturing
without the ability to identify these cost to specific operations
or jobs in WIP at any one point in time. For example, rent, lighting,
general plant maintenance, and depreciation are costs that every manufacturing
environment incurs but are not attributable to specific jobs in WIP.

Costing in VISUAL provides for the ability to set burden rates to
attempt to capture these costs and allocate them to jobs that flow
through WIP. VISUAL provides the ability to apply burden to raw materials
inventory as well as to specific operations used in the manufacturing
process. Burden rates applied to raw materials inventory on the part
master file will cause burden to be charged each time the part is
issued to a work order. Burden costs assigned operations are applied
to WIP at the time of Labor ticket entry.

The burden costs applied during labor ticket entry come from the
settings assigned on the resource in shop resource maintenance. VISUAL
derives the burden rate either from the operation set in shop resource
maintenance, on the operation in the bill of materials. The determination
of whether cost are extended from the resource or the work order depends
on the Burden Basis setting as defined on the Cost tab in application
global. If you select Determined by Resource Burden, VISUAL examines
the settings as defined in the Resource ID of Resource Maintenance
to determine the appropriate amount of burden to apply. If you select
Determined by Operation Burden in application global, then the amounts
applied on the work order are used to determine the amount of burden.

### Indirect Labor

VISUAL applies indirect labor in the same manner as direct labor;
the only difference is the transaction type in the Labor Ticket Entry
window must be set to Indirect rather than Setup or Run. Indirect
labor is not charged to specific jobs. Costs associated with indirect
labor are reclassed from manufacturing payroll to the appropriate
manufacturing indirect labor G/L accounts.

### Shipments (Sales)

Shipments of customer orders cause specific transactions to take
place within the VISUAL system. Costs accumulated in work in process
are marked as Closed. Inventory costs (WIP) then flow through to cost
of sales in the general ledger in two distinct entries. The first
entry reclassifies work in process costs to finished goods inventory.
The second entry records the transfer of finished goods inventory
to Cost of sales to properly match costs with revenue as required
by generally accepted accounting principles.

### Standard

In standard costing, material is applied at the standard cost in
the parts database. Any difference between the purchase price of
the material and the standard is taken as a variance when the Purchase
Receiver is matched to the invoice in A/P Invoice entry. Labor and
burden are applied based on the standard rates obtained from the shop
resource.

### Actual

With actual costing, VISUAL constantly collects cost information
as it occurs. In Infor VISUALs Application Global Maintenance, you
must specify the source of the raw material cost. The two options
for Source of Raw Material Cost are:

* A/P Invoicing
* Purchase Order

### A/P Invoice Based

Until you enter the invoice and VISUAL matches it to the receipt,
A/P Invoice-based material costs are valued at purchase order dollar
amounts. As the receipts are costed at actual invoice prices, the
corresponding issues for these material receipts are then costed at
the actual price. Because the actual cost is not known until invoiced,
VISUAL uses a standard cost (if available) from the parts database
as a temporary value. When the actual value becomes available, VISUAL
creates adjustment distributions (if the previous standard was posted
to G/L) for the difference between the estimated (standard) cost and
the actual cost.

### Purchase Order Based

Purchase Order based material costs use the value from the purchase
order. When the actual invoice is received and matched to the purchase
order receipt, any difference between the purchase order and the invoice
value is booked as a purchase price variance.

If you are costing at invoice value and the material requirement
for a job is linked to a purchase order, VISUAL issues the material
directly to the job upon receipt. Material is temporarily valued at
the purchase order price, not the part standard. Materials that are
purchased under an actual cost system not for a specific job are valued
based on the First In First Out (FIFO) method of inventory valuation.

Actual costing uses the employee labor rate to cost labor transactions.
Burden costs are applied based on the rates set up for the shop resource.
This can be established based on one or a combination of the following:

* Cost per Setup time
* Cost per Run time
* Cost per Unit produced
* Fixed Cost per Resource
* Percent of Setup and / or
  Run labor costs

There is a delay in the final determination of a work order cost
when using actual costing. Before VISUAL can calculate a final cost,
the following must have occurred:

* All operations are completed
* All material requirements
  are issued to the work order
* All material issues are
  fully costed (receipts for which the material came from have been
  costed, i.e. invoice received or sub work order receipt costed)
* The work order is closed

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](WIP_Costing_in_VISUAL.md)
WIP Costing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](What_is_Actual_and_Projected_Cost.md) What is Actual and Projected Cost

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Determining_Whether_Actual_or_Projected_Cost_is_Used.md) Determining whether Actual or Projected
Cost is Used

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setup_Manufacturing_Costing.md)
Setup Manufacturing Costing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help