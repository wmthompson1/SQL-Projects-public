Physical Inventory Cycle Counts




# Physical Inventory Cycle Counts

A cycle count is a physical inventory count that you
conduct on a predefined schedule, such as every thirty days. To select
the parts and warehouse that are subject to cycle counts, use Part
Maintenance.

See [Cycle Counts](Cycle_Counts.md).

If you have set up cycle counting for parts in a warehouse, then
these actions occur when you initialize a physical inventory count:

1. Parts are selected based
   on the Cycle Counting filters you specify in the Initialize Physical
   Count dialog box. If you specified warehouse location filters,
   parts must be able to be stored in the locations that you specify
   to be eligible for the count.
2. The parts that are identified
   in step 1 are evaluated for their last count date and number of
   days between counts. If the value results in a date that is on
   or before the current date, then the parts are included in the
   physical inventory count.

If you record count dates by warehouse location,
and there is no last count date recorded in the part location table,
then the last count date in the Count Frequencies dialog is used instead.

3. After you complete the
   count, the last count date is updated. You can record the last
   count date by warehouse or by warehouse location. Use Preferences
   Maintenance to specify the date to use. Depending on your selection,
   one of these actions is completed:
4. If you record
   last count date by warehouse, then the Last Count Date field in
   the Count Frequencies dialog box is update. Access this dialog
   in Part Maintenance. Select the part, then select Maintain,
   Cycle Count Setup.
5. If you record
   last count date by warehouse location, then the Last Count Date
   field in the Warehouse Locations for Part dialog is updated. You
   can access this dialog in several places:
6. In Part
   Maintenance, select the part, then select Maintain,
   Warehouse Locations.
7. In Inventory
   Transaction Entry, select the part, then select Maintain,
   Warehouse Locations.
8. In Warehouse
   Maintenance, select the warehouse. Select the row that contains
   the location you are reviewing, then select Edit,
   Location/Parts.