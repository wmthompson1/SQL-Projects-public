Adding a New Warehouse




# Adding a New Warehouse

If you
are licensed to use multiple sites, you create warehouses by Site
ID. Warehouse IDs must be unique in your tenant; you cannot use the
same warehouse ID in multiple sites.

To add a warehouse to your database:

1. Select Inventory,
   Warehouse Maintenance.

2. Click the New
   toolbar button.

|  |  |
| --- | --- |
| TIP.gif | If there is a warehouse in the database that closely matches the new warehouse you are adding, you can reduce the information you must manually enter by selecting the existing warehouse, changing the ID, and saving the new record. You can modify the new record to meet the needs of the new warehouse. |

3. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site that owns this warehouse. If you are licensed to use a single
   site, this field is unavailable.
4. Click
   in the Warehouse ID field and enter a unique identifier for this
   warehouse.
5. Specify a description for the new warehouse in the
   Description field.
6. If you want to enter
   an address for this warehouse, click the Warehouse Address toolbar
   button.

7. Specify this information:

Name If different
than your company name, specify the name of the warehouse in the Name
field.

Address Specify
the street address for this warehouse.

City Specify
the city in which the warehouse is located in the City field.

State Click
the State arrow and select the abbreviation
for the state in which the warehouse is located.

Zip Specify
the postal code of the area in which the warehouse is located in the
Zip field.

Country  Select the
country id from the drop-down list or click the browse button to search
for the Country ID.

VAT Registration
If you have a VAT registration number for this warehouse, enter
it in the VAT Registration field.

8. Click OK.

The Warehouse Address dialog closes.

9. Click the Country ID browse button and select the
   country code for this warehouse.
10. Click the Region ID browse button and select the Region
    ID for this warehouse.
11. Specify this information:

VDW
Installed If the warehouse is a VISUAL Distribution warehouse,
select the VDW Installed check box. VDW
warehouses can only be used in conjunction with VISUAL Distribution.

Independently
Planned Warehouse If you want this warehouse to be an independently
planned warehouse, select the Independently Planned
Warehouse check box. Independently planned warehouses are eligible
for MRP on an individual basis. Warehouses that are not independently
planned belong to the warehouse designation UNIVERSAL. Click [here](MRP_Processing.htm)
for more information.

WIP/VAS Supported
If the warehouse supports WIP/VAS, select the WIP/VAS
Supported check box. WIP/VAS must be globally activated in
Application Global Maintenance. For more information on setting WIP/VAS
information, refer to [Setting
WIP/VAS Information for Warehouses](Setting_WIP_VAS_Information_for_Warehouses.htm).

Warehouse
WIP/VAS If this warehouse supports WIP/VAS, click the Warehouse WIP/VAS browse button and set up the
WIP/VAS information for this warehouse. The Warehouse WIP/VAS dialog
box appears populated with the current warehouse.

1. Click the
   Insert button. The new available row appears highlighted.
2. Double-click
   the Part ID browse button and select the part you are making eligible
   for value added service.
3. Double-click
   the WIP/VAS browse button and select the WIP/VAS you want to associate
   with the part you selected. The price for the WIP/VAS you selected
   appears in the Price column.

Enter WIP/VAS IDs
in Application Global Maintenance.

4. If you want
   to change the price for this part in this warehouse, click in
   the Price column and change the price to what you want to use.

MRP Exempt If
you are running Material Resource Planning and want to exclude this
warehouse from planning runs, select the MRP Exempt
check box.

Inventory
Not Shared If you are working with VISUAL Project, click
the arrow and select if you want VISUAL to NOT share the inventory
for this warehouse. You can select:

N If you want
to allow all users to issue (transfer) to other warehouses, select
the N option.

P If you want
to allow production planners only to issue (transfer) to other warehouses,
select the P option.

Y If you want
to restrict users from issuing (transferring) to other warehouses,
select the Y option.

Consignment Warehouse
If you want to use this warehouse as a to consignment warehouse,
select the Consignment Warehouse check box.

Use to consignment warehouses to store parts
and materials that you will consign to customers or vendors.

For to consignment warehouses, select
either the customer or vendor option button to which you want to assign
the consignment. Click the appropriate browse button and select name
of the customer or vendor.

12. Click
    the Insert Row toolbar button.

The next available row in the table appears
highlighted.

13. Specify a unique identifier
    for this location in the Location ID column. Because VISUAL uses
    the combination of Warehouse and Location, the location identifier
    need only be unique to this warehouse. For example, if all of
    your locations are Shelf 1, Shelf 2, etc. you can use Shelf 1
    and Shelf 2 in another warehouse.
14. Click in the Type column
    and click the arrow that appears. Select a type for this location
    from the list. (The list changed depending on the status of the
    Consignment warehouse check box.)

You can select:

Floor Stock
If you are going to use this location for materials you consider floor
stock, select the Floor Stock option. You
may want to use this option for things you need to stock but do not
appear on work orders: for example, welding supplies.

Regular If this
location is going to be part of your normal stock, select the Regular option.

Transit If you
want to designate this location as a transit location, select the
Transit option.

From Customer
If you are working with consignment stock, select the From
Customer option. Double-click the Customer ID browse button
and select the customer with whom you want to associate this location.

From Vendor
If you are working with consignment stock, select the From
Vendor option. Double-click the Vendor ID browse button and
select the vendor with whom you want to associate this location.

For more information, refer to [What
is Consignment Receipt Entry.](VMCSNRCVfrmConsignmentReceiving.htm)

|  |  |
| --- | --- |
| TIP.gif | If you use Actual or Average Costing methods with FIFO By Part, VISUAL removes the From Vendor and From Customer location types from Warehouse Maintenance. |

15. Specify a description
    for this location in the Location Description column.
16. Click the Save
    toolbar button.
17. After you have completed
    entering locations for this warehouse, select the Exit
    option from the File menu.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Warehouse_Maintenance.htm) User-defined Help