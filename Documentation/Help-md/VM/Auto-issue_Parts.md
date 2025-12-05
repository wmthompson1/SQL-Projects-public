Auto-issue Parts




# Auto-issue Parts

An auto-issue part is a material requirement that
is automatically issued to a work order when labor transactions are
made. Users do not have to manually enter inventory transactions to
issue the part to a work order.

To auto-issue parts, these criteria must be met:

* The Auto Issue check box
  must be selected for the part.
* The part must be stored
  in at least one auto-issue warehouse location.
* A default auto-issue warehouse
  and location combination must be specified for the part.
* If you have created auto-issue
  locations in multiple warehouses, at least one default location
  must be specified for each warehouse.
* The part cannot have a trace
  profile. Traceable parts cannot be auto-issued.

If you select the Auto Issue check box for a part, but do not assign
the part to an auto-issue location, then auto-issue transactions are
not made. Similarly, if you assign a part to an auto-issue location,
but do not select the Auto Issue check box, then auto-issue transactions
for the part are not made. If a warehouse has auto-issue locations,
but none of the locations are designated as the default for the warehouse,
then auto-issues are not made from the warehouse.

To create an auto-issue part:

1. Select Inventory,
   Part Maintenance.
2. In the Site ID field,
   select the site that uses the auto-issue part. Auto-issue is set
   up at the site level.
3. Click the Part
   ID browse button and select the part to auto-issue.
4. In the Settings section,
   select the Auto Issue check box.
5. Click the Defaults
   tab.
6. Specify this information:

Auto-issue Warehouse
ID Specify the default warehouse to use for auto-issue transactions
for this part.

Auto-issue Location ID
Specify the default location to use for auto-issue transactions
for this part.

7. Click Save.
8. Optionally, specify
   additional auto-issue warehouses and locations:

1. Select
   Maintain, Warehouse
   Locations.
2. Click
   Insert.
3. Double-click
   the Warehouse ID button and select a
   warehouse.
4. Double-click
   the Location ID button and select the
   location.
5. Select
   the Auto Issue check box.
6. If the
   location is the default auto-issue location for the warehouse,
   select the Default Whs Auto Issue check
   box. Each auto-issue warehouse must have a default warehouse auto-issue
   location.
7. Click
   Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Warehouse_Locations_and_Auto-issue_Transactions.htm) Warehouse Locations and Auto-issue Transactions

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_and_Issue_Negative_Settings.htm) Auto-issue and Issue Negative Settings

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_Transaction_Quantities_and_Timing.htm) Auto-issue Transaction Quantities and
Timing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Backflushing_Labor_Tickets.htm)
Working with Backflushing