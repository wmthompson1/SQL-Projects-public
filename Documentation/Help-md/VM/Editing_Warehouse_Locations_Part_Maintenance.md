Editing Warehouse Locations




# Adding Parts to Warehouse Locations in Part Maintenance

In Part Maintenance, you can assign parts to any existing
warehouse location.

If you are licensed to use multiple sites, you must select a site
ID before you can access the Warehouse Locations dialog box.

You can also add parts to warehouse locations in Warehouse Maintenance.
See [Adding a Part to a Location](Adding_a_Part_to_a_Location.htm).

To add a part to warehouse locations:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
3. In the Part ID field,
   specify the part.
4. Select Maintain,
   Warehouse Locations. The table shows
   all warehouse locations where the part can currently be stored.
5. Click Insert.
6. Specify this information:

Warehouse ID -
Double-click the browse button and select the warehouse from the list.
If you are licensed to use multiple sites, the browse table shows
only those warehouses that belong to the site you selected. After
you select a warehouse, the ID of the associated site is inserted
in the Site ID field.

Location ID -
Double click the Location ID browse button
to choose the location within the warehouse that stores this part.
Only valid locations defined for the warehouse are eligible for selection.

Status From
the Status drop-down list, select a status for the part in this warehouse
location. Statuses include

Available Select
Available if this part is currently available
in inventory and ready for use.

Unavailable  Select
Unavailable if this part is currently unavailable
for use. Unavailable parts cannot be shipped or issued. Unavailable
quantities are not considered in material netting calculations.

On Hold  Select
On Hold if this part is currently on hold.
On-hold parts cannot be shipped or issued.

Locked To prevent
any transactions from occurring against this location for this part,
select the Locked check box.

Primary To make
this warehouse location the parts primary location, select the Primary check box. This automatically updates
the primary location in the Part Maintenance defaults (see Defaults
tab).

Auto Issue To
make this warehouse location an auto-issue location, select the Auto Issue check box.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL supports multiple auto-issue locations. For each location you want to make an auto-issue location, select the Auto Issue check box. |

Default Warehouse Auto
Issue To make this warehouse location the Auto issue default
for the warehouse, select the Default Whs Auto
Issue check box. You can specify one default auto issue location
per warehouse, and it is possible to have multiple auto-issue default
warehouses per part. An Auto issue default for the warehouse must
be an auto issue warehouse location

Default Part Auto Issue
To make this warehouse location the Auto-issue default for the part,
select the Part auto-issue check box. The
Auto issue default for the part must be an auto-issue and auto-issue
default warehouse. This automatically updates the auto issue location
in the Part Maintenance defaults (see Defaults tab). There is only
one auto-issue default part warehouse location for each part.

Inspect To make
this warehouse location an inspection location, select the Inspect
check box. This automatically updates the auto issue location in the
Part Maintenance defaults (see Defaults tab).

Transit To make
this warehouse location a transit location, select the Transit
check box. Use this designation to identify warehouse locations as
part transfer locations for use with inter-branch transfers.

|  |  |
| --- | --- |
| POSTIT.gif | When creating an IBT for a part without a default transit location, VISUAL creates a location with an ID of TRANSIT. |

Hold Reason ID
- If the part in this warehouse location is on hold (see the description
of statuses earlier), double-click the Hold Reason
ID browse button to choose a hold reason code for the action.

Selecting a [hold
reason](Setting_Hold_Reasons.htm) code prompts VISUAL to change the warehouse location status
to On Hold.

Quantity If
a quantity of the part currently exists in the warehouse location,
VISUAL displays the quantity in this field.

Part/Location Description
Specify a description of this part and location combination.

Last Count Date
If you record last count date by warehouse location, the date of
the last cycle count is displayed. This date can be specified when
cycle counts are set up. This date can also be generated when completing
a cycle count in Physical Inventory Count.

If you record last count date by warehouse,
then this field is blank. This field is also blank if a last count
date has not been specified or a cycle count has not been completed.

See [Cycle Counts](Cycle_Counts.htm).

7. Click Save.

It is only possible to delete a location
from the list for a part if no transactions exist involving the part
and location.

To delete a line, select the appropriate
row and click the Delete button.

VISUAL places an X next to the row. Click
the Save button to complete the deletion.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help