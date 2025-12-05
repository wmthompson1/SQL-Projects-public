Checking Material Availability




# Checking Material Availability

Use the Material Availability dialog to check the inventory levels
of the parts specified on the customer order. This function does not
assess material availability for material requirements of linked work
orders.

The quantities shown in the Material Availability dialog box depend
upon these criteria:

* Whether a warehouse is specified
  on the line
* Whether the warehouse is
  an independently planned warehouse or a universal warehouse
* The setting you specify
  in Preferences Maintenance for the UseUniversalForMaterialAvailability
  entry

If you specify an independently planned warehouse for the line,
then the Material Availability dialog box displays the quantities
of the part stored in the independently planned warehouse.

If you specify a universally planned warehouse for the order, then
the setting you specify in Preferences Maintenance determines the
quantities displayed in the dialog. If you specify Y for the UseUniversalForMaterialAvailability
setting, then the quantities displayed are for all universally planned
warehouses in the site specified on the header. If you specify N for
the UseUniversalForMaterialAvailability setting, then the dialog displays
only the quantities stored in the  warehouse specified on the
line.

If you do not specify a warehouse for the line, then the quantities
available in all universally planned warehouses in the site specified
on the order header are displayed.

## Setting the UseUniversalForMaterialAvailability Preference

Use Preferences Maintenance to specify how to calculate quantities
in the Material Availability dialog when a universally planned warehouses
is specified as the supplying warehouse.

To set the preference:

1. Select Admin,
   Preferences Maintenance.
2. Click the Insert
   button.
3. Specify this information:

Section Specify
Visual Mfg.

Entry Specify
UseUniversalForMaterialAvailability.

Value To display
the quantities for all universally planned warehouses when a universally
planned warehouse is specified as the supply, specify Y.
To display the quantities in the specified universally planned warehouse
only, specify N.

4. Click the Save
   button.

## Viewing Material Quantities

To view material quantities:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site that contains the order. If you are
   licensed to use a single site, this field is unavailable.
2. Click the Our
   Order ID arrow and select the order to use.
3. To view material availability
   for a specific line, select the line.
4. Select File,
   Check Material Availability.

If you set up a delivery schedule for the
line, then a separate line for each line in the delivery schedule
is displayed.

This information is displayed for each line
item:

Detail The customer
order line number, the part ID, and the part description are displayed.

Qty Ordered
The quantity of part ordered on the order line or delivery schedule
line is displayed.

Qty Shipped
The total quantity of parts shipped for the line to date or delivery
schedule line is displayed.

Ship Date The
date that the customer wants the order line to be shipped is displayed.
If you specified a date on the order line, then the date from the
line is displayed. If you specified a date on the order header only,
then the date from the header is displayed.

Promise Ship Date
The date on which you promise to ship the order is displayed. If
you specified a date on the order line, then the date from the line
is displayed. If you specified a date on the order header only, then
the date from the header is displayed.

Promise Del Date
The date on which you promise the order will be delivered is displayed.
If you specified a date on the order line, then the date from the
line is displayed. If you specified a date on the order header only,
then the date from the header is displayed.

Warehouse ID
The warehouse ID specified on the order line is displayed. If no warehouse
is specified, then this field is blank.

Projected Available (After
Ship) This column displays the total quantity remaining in
warehouse locations with a status of Available after all customer
orders ship. Customer order lines with a status of Released, Firmed,
and On hold are considered. Customer order lines with a status of
Inherit are also considered if the header status is Released, Firmed,
or On Hold.

The supply calculation depends upon whether
a warehouse ID is displayed in the Warehouse ID column and the value
specified for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the quantity remaining in available locations
  in the specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the total quantity remaining in all universal
  warehouse locations with a status of Available. If you are using
  multiple sites, the quantity shown is for the site specified in
  the order header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the quantity stored in available locations
  for the specified warehouse.
* If you did
  not specify a warehouse on the line, then this column shows the
  total quantity remaining in all universal warehouse locations
  with a status of Available. If you are using multiple sites, the
  quantity shown is for the site specified in the order header only.

On Hand This
column shows the quantity currently stored in warehouse locations
with any status.

The calculation depends upon whether a warehouse
ID is displayed in the Warehouse ID column and the value specified
for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the current quantity in all locations in the
  specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all universal warehouse
  locations. If you are using multiple sites, the quantity shown
  is for the site specified in the order header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all locations in
  the specified warehouse only.
* If you did
  not specify a warehouse on the line, then this column shows the
  current quantity in all universal warehouse locations. If you
  are using multiple sites, the quantity shown is for the site specified
  in the order header only.

Available This
column shows the quantity currently stored in warehouse locations
with the Available status.

The calculation depends upon whether a warehouse
ID is displayed in the Warehouse ID column and the value specified
for the UseUniversalForMaterialAvailability preference:

* If an independently
  planned warehouse is displayed in the Warehouse ID field, then
  this column shows the current quantity in available locations
  in the specified warehouse only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified Y for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in all universal warehouse
  locations with the status of Available. If you are using multiple
  sites, the quantity shown is for the site specified in the order
  header only.
* If a universally
  planned warehouse is displayed in the Warehouse ID field and you
  specified N for the UseUniversalForMaterialAvailability preference,
  then this column shows the current quantity in available locations
  in the specified warehouse only.
* If you did
  not specify a warehouse on the line, then this column shows the
  current quantity in all universal warehouse locations with the
  status of Available. If you are using multiple sites, the quantity
  shown is for the site specified in the order header only.

To view material netting information for a part in the Material
Planning Window, double-click the line containing the part to view.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help