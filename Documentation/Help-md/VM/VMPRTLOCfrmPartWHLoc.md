Adding Warehouse Locations Using the VISUAL Manufacturing Part Location Creator




# Adding Warehouse Locations Using the VISUAL Manufacturing Part Location Creator

You can add new locations to existing warehouses and
specify the parts that you want to store in these new locations or
add parts or ranges of parts to existing warehouse locations using
the Infor VISUAL Part Location Creator.

The Part Location Creator is not available from the main VISUAL
menu.

If you are licensed to use multiple site, you can add parts to warehouses
on a site-by-site basis. The part you add to locations must exist
in the site. If you select a part that does not exist in the site,
it is not added to the site warehouse locations.

From the directory where your executables are installed, double-click
Vmprtloc.exe.

The Part Location Creator window appears.

You can also use valid QBE (Query by Example) expressions to add
a part or range of parts simultaneously to all warehouse locations.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
2. Enter a Part ID in the
   Part ID field. This is the Part ID that you want to add to the
   new warehouse location.

The Part ID you enter must be a valid VISUAL
Part ID. You cannot enter new parts into your database from here.

If you are using a QBE, enter a valid expression
here.

3. If you are specifying
   an individual part to add to this location, enter its description
   in the Part Description field.

If you are using QBE, enter a valid expression
here.

4. If you are specifying
   an individual part to add to this location, enter its Product
   Code from the Product Code list box.

If you are using QBE, enter a valid expression
here.

5. If you are specifying
   an individual part to add to this location, select its Commodity
   Code from the Commodity Code list box.

If you are using QBE, enter a valid expression
here.

6. Enter the ID of the
   Warehouse to which you want to add this new part location.

The Warehouse ID you enter must be a valid
VISUAL Warehouse ID. You cannot enter new warehouses into your database
from here.

If you are using QBE, enter a valid expression
here.

7. Enter an ID for the
   new location or an ID of an existing warehouse location.
8. Click the Go
   button to begin the part warehouse location creation process.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Warehouse_Maintenance.md) User-defined Help