Transfering, Moving, and Issuing Materials Using BTS




# Transferring, Moving, and Issuing Materials Using BTS

## Moving Materials

* Paperwork and Labels in
  Part Maintenance w/barcodes
* Print Warehouse/Locations
  and Labels in Warehouse Maintenance
* \*Print Lot/Traceability
  information and Labels in Trace Maintenance
* Scan the Transaction in
  BTSbi.exe:

* Employee ID
* Part ID
* \*Trace ID
* \*Alpha Propertys
* \*Numeric Propertys
* From Warehouse
  ID
* From Location
  ID
* To Warehouse
  ID
* To Location
  ID
* Qty

* Validate that transaction
  is processed in VMBTSINV.EXE
* Check Inventory
  Transaction Entry for transaction
* Check Part
  Maintenance / Warehouse Locations for movement

## Issuing to a Workorder

* Print Paperwork and Labels
  in Work Order Traveller w/barcodes
* Print Warehouse/Locations
  and Labels in Warehouse Maintenance
* \*Print Lot/Traceability
  information and Labels in Trace Maintenance
* Scan the Transaction in
  BTSbi.exe:

* Employee ID
* Work Order
  ID (Base, Lot, Split, Sub, Operation Seq #, Material Seq #)
* \*Trace ID
* \*Alpha Propertys
* \*Numeric Propertys
* From Warehouse
  ID
* From Location
  ID
* Qty

* Validate that transaction
  is processed in VMBTSINV.EXE
* Check Inventory Transaction
  Entry for transaction
* Check Part Maintenance /
  Warehouse Locations for movement

## Receiving Finished Goods

* Print Paperwork and Labels
  in Work Order Traveller w/barcodes
* Print Warehouse/Locations
  and Labels in Warehouse Maintenance
* \*Print Lot/Traceability
  information and Labels in Trace Maintenance
* Scan the Transaction in
  BTSbi.exe

* Employee ID
* Work Order
  ID (Base, Lot, Split, Sub, Seq #, Material Seq
* \*Trace
* \*Alpha Propertys
* \*Numeric Propertys
* \*To Warehouse
  ID
* \*To Location
  ID
* Qty

* Validate that transaction
  is processed in VMBTSINV.EXE
* Check Inventory Transaction
  Entry for transaction
* Check Part Maintenance /
  Warehouse Locations for movement

## Moving Materials

You can perform the following material movements:

* Any Warehouse/Location to
  Any Warehouse/Location
* PrimaryWarehouse/Location
  to Any Warehouse/Location
* Any Warehouse/Location to
  Auto-Issue Warehouse/Location
* Any Warehouse/Location to
  Inspection Warehouse/Location

## Any Warehouse/Location to Any Warehouse/Location

This transaction will move material from any warehouse/location
to any other warehouse/location. It is the core of the following transactions,
which provides all the basic functionality of the BTS-BI module.

## PrimaryWarehouse/Location to Any Warehouse/Location

This transaction will move material from the Primary warehouse/location
defined for the part to any other warehouse/location. It provides
a shorthand method to move material with less scans required, as it
will assume the From warehouse/location. It will prompt for a warehouse/location
if there isnt a primary warehouse/location defined.

## Any Warehouse/Location to Auto-Issue Warehouse/Location

This transaction will move material from any warehouse/location
to the Auto-Issue warehouse/location defined for that part. It provides
a shorthand method, which will require less scanning for the transaction.
It will prompt for a warehouse/location if there isnt one defined
as the Auto-issue Warehouse/Location in the part master.

## Any Warehouse/Location to Inspection Warehouse/Location

This transaction will move material from any warehouse/location
to the Inspection warehouse/location defined for that part. It provides
a shorthand method, which will require less scanning for the transaction.
It will prompt for a warehouse/location if there isnt one defined
as the Inspection Warehouse/Location in the part master.

## Issue to a Work Order

Materials issued to Work Orders are a key element in relieving inventory.
The VISUAL BTS system will allow instantaneous material positions
in both inventory and work-in-process. This constant accurate material
issues to workorders provide up-to-date information at all times.

The chain of events would be similar to the following:

* WorkOrder Pick List is printed
* Material is Located (and
  location is scanned)
* Material is moved to a production
  area
* Material is scanned to relieve
  Inventory and applied to Work Order

## Finished Goods Receipt into Inventory

Finished Goods received into inventory from a Work Order can be
easily tracked using VISUAL BTS. This method of tracking final production
inventory provides instant inventory positions. As finished goods
are scanned into inventory the status of the workorder is updated
to show production throughput.

The chain of events would be similar to the following:

* Finished Goods Last Operation
  is performed
* (optional) Finished Goods
  labels are printed
* Material is moved to a Warehouse/Location
  storage area
* Material is scanned to update
  Inventory and applied to Work Order Totals

## Finished Goods Labels

Finished goods labels could be added as a part of the last operation.
Once applied these labels provide the necessary information for scanning.
They can be produced as a part of an operation or when other paperwork
is produced for the work order.