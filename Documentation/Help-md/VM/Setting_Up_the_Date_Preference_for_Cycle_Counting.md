Setting Up the Date Preference for Cycle Counting




# Setting Up the Date Preference for Cycle Counting

You can record the date of the last cycle count by
warehouse or by warehouse location. Specify your choice in Preferences
Maintenance.

1. Select Admin,
   Preferences Maintenance.
2. Click Insert.
3. Specify this information:

Section Specify
PhysicalInventoryCount.

Entry Specify
LastCountDateByLocation.

Value To record
the date of the last count by each warehouse location, specify Y.
When cycle counts are conducted, the LAST\_COUNT\_DATE column in the
PART\_LOCATION database table is updated. In the interface, the date
is displayed in the Last Count Date in the Warehouse Locations dialog
box. The Warehouse Locations dialog box is available in Part Maintenance,
Inventory Transaction Entry, and Warehouse Maintenance.

To record the date of the last count by
each warehouse, specify N or leave the value blank. When cycle counts
are conducted, the LAST\_COUNT\_DATE column in the CYCLE\_COUNT\_PART
table is updated. In the interface, the date is displayed in the Last
Count Date column in the Cycle Count Setup dialog. They Cycle Count
Setup dialog is available in Part Maintenance.

4. Click Save.