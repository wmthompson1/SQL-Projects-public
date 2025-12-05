Using the Primary Warehouse and Location as the Default From Location




# Using the Primary Warehouse and Location as the Default From Location

Use the preference described in this topic in conjunction
with [Transferring Inventory
Between Locations](VMINVENT_APLfrmInventoryTransfer.htm) in Inventory Transaction Entry.

You can set up a preference in Preferences Maintenance to always
use a parts primary warehouse and location as the default location
when transferring parts between warehouses. When you set up this preference,
the primary warehouse and primary location specified for the part
in the selected site are inserted into the From fields in the Inventory
Transfers dialog. If you specified only a primary warehouse on the
Part record, then the first location found for the warehouse is used
as the default location. In addition, the quantity on-hand in the
part location is inserted into the Quantity field in the Inventory
Transfers dialog. You can override all default information.

To set up the preference:

1. Select Admin,
   Preferences Maintenance.
2. Click Insert.
3. Specify this information:

Section InventoryEntry

Entry AutoFillLocation

Value Y

4. Click Save.

You may need to exit and relaunch VISUAL for the preference to take
effect.