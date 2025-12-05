Setting Up Cycle Count Setups for all Parts




# Setting Up Cycle Counts for Multiple Parts

Use the Cycle Count Setup for All Parts dialog box
to create cycle count information for multiple parts. Use the filters
in the dialog to select the parts.

1. Select Inventory,
   Part Maintenance.
2. Select Maintain,
   Cycle Count Setup for all Parts.
3. In the Selection Options
   section, specify the parts and warehouse for which you are setting
   up cycle counts. Use the fields to filter the parts to include.
   To be included in the cycle count set up, a part must meet all
   the criteria you specify. For example, if you specify a range
   of parts in the Starting Part ID and Ending Part ID fields but
   also specify a product code, then only parts with the product
   code in the range of parts you specified are included. Specify
   this information:

Starting Warehouse ID
and Ending Warehouse ID - To set up counts in a range of warehouses,
specify the first warehouse  in the Starting Warehouse ID field
and the last warehouse  in the Ending Warehouse ID field. To
set up counts for all warehouse, leave these fields blank. To set
up counts for a single warehouse, specify the same ID in both fields.

Starting Part ID and
Ending Part ID - To set up counts for a range of parts, specify
the first part in the Starting Part ID field and the last part in
the Ending Part ID field. To set up counts for all parts, leave these
fields blank. To set up counts for a single part, specify the same
ID in both fields.

Product Code -
To set up counts for a certain product code, specify the product code
in this field. Leave the field blank to include all product codes.

Commodity Code
- To set up counts for a certain commodity code, specify the commodity
code in this field. Leave the field blank to include all commodity
codes.

ABC Code - To
set up counts for parts with a certain ABC code, enter the ABC code
in this field. Leave the field blank to include all ABC codes. See
[Using ABC Analysis](Using_ABC_Analysis.htm).

4. In the Count Setting
   section, specify when to perform the count:

Count Frequency
- Specify the number of days between counts.

Last Count Date
- Specify the date that the part was last counted in the warehouse.
The days between counts value is added to the last count date to determine
when the count should occur.

If you leave this field blank, then no updates
are made to the Last Count Date on individual part records. Any existing
last count date information is retained on the part records.

5. If you are recording
   count dates by warehouse location, select the Update
   Part Location Last Count Date check box to update the LAST\_COUNT\_DATE
   column in the PART\_LOCATION table with the date that is specified
   in the Last Count Date field. In the interface, the date is displayed
   in the Last Count Date in the Warehouse Locations dialog box,
   which is available in Part Maintenance, Inventory Transaction
   Entry, and Warehouse Maintenance. To update only the LAST\_COUNT\_DATE
   column in the CYCLE\_COUNT\_PART table, clear the check box. In
   the interface, the date is displayed in the Last Count Date column
   in the Cycle Count Setup dialog in Part Maintenance.

If you are not recording count dates by
warehouse location, then the Update Part Location
Last Count Date check box is unavailable. The LAST\_COUNT\_DATE
column in the CYCLE\_COUNT\_PART table is updated when you save the
row.

6. Click Run
   to create the counts you set up. After processing is complete,
   you can review the setup for individual parts in the Cycle Count
   Setup dialog:

1. In Part
   Maintenance, specify \*\* Tenant \*\* to view cycle count information
   for all warehouses in your enterprise. Select a site to view
   information for warehouses in the selected site only.
2. In the
   Part ID field, specify the part.
3. Select
   Maintain, Cycle
   Count Setup. Cycle count information is displayed.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help