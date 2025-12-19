Setting Up Cycle Count for an Individaul Part




# Setting Up Cycle Count for an Individual Part

To set up cycle counting for an individual part:

1. Select Inventory,
   Part Maintenance.
2. In the Site ID field,
   specify \*\* Tenant \*\* to display all warehouses when you browse
   for a warehouse ID in the Count Frequencies dialog box. To include
   only warehouses for a specific site in the warehouse ID browse,
   select the site ID.
3. Click the Part ID browse
   button and select the part to set up for cycle counting.
4. Select Maintain,
   Cycle Count Setup.
5. Click Insert.
6. Specify this information:

Warehouse ID
Specify the ID of the warehouse where the count is performed. the
site associated with the warehouse is inserted in the Site ID field.
The description of the warehouse is inserted in the Description field.

Days Between Counts
Specify how often to count this part in this warehouse.

Last Count Date
Optionally, specify the date that the part was last counted in the
warehouse. The days between counts value is added to the last count
date to determine when the count should occur.

If you record count dates by warehouse,
this date is updated automatically after you complete a physical inventory
count.

7. If you are recording
   count dates by warehouse location, select the Update
   Part Location Last Count Date check box to update the LAST\_COUNT\_DATE
   column in the PART\_LOCATION table with the date that is specified
   in the Last Count Date field. In the interface, the date is displayed
   in the Last Count Date in the Warehouse Locations dialog box,
   which is available in Part Maintenance, Inventory Transaction
   Entry, and Warehouse Maintenance. To update only the LAST\_COUNT\_DATE
   column in the CYCLE\_COUNT\_PART table, clear the check box.

If you are not recording count dates by
warehouse location, then the Update Part Location
Last Count Date check box is unavailable. The LAST\_COUNT\_DATE
column in the CYCLE\_COUNT\_PART table is updated when you save the
row.

8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help