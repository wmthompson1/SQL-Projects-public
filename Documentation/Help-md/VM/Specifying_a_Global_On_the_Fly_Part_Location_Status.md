Specifying a Global On the Fly Part Location Status




# Specifying a Global On the Fly Part Location Status

Use Site Maintenance to specify a global part location
on the fly status. Select the appropriate option to ensure uniformity
in the creation of inventory transactions.

The three options available to you are:

Not Allowed - Database value of "N."
With this option button selected, you can only use existing part/location
associations. You cannot create new part/location associations or
unique warehouse locations at the time of transaction. With this setting,
you must establish part/location associations using the Part Maintenance
window or the Part Location Creator.

Assign Existing Location to Part - Database
value of "Y." With this option button selected, you can
assign an existing warehouse location to a part (an association that
previously did not exist) at the time of a transaction. The warehouse
location and part must already exist.

Create New Location and Assign to Part
- Database value of "C." With this option button selected,
you can create a new (non-existent) warehouse location and assign
it to a part, thereby creating a valid part/location association at
the time of the transaction. The warehouse must already exist; it
is the location within the warehouse and the new part/location association
that is new.

The part location on the fly setting concerns transactions created
using the following applications:

VMINVENT - Inventory Transaction Entry

This applies when you receive, issue, adjust, and transfer (only
in To Warehouse Locations) part quantities and must specify a warehouse
location into which you are receiving, transferring, issuing, or adjusting.
Click [here](VMINVENTWhat.htm) for more information.

VMRCVENT - Purchase Receipt Entry

This applies when you are receiving a purchase order quantity at
a warehouse and can specify a location within the warehouse at the
time of receipt. Click [here](VMRCVENTWhat.htm) for more
information.

VMSHPENT - Shipping Entry (returns only)

This applies when you are receiving a returned customer shipment
at a warehouse and can specify a location within the warehouse at
the time of return receipt. Click [here](VMSHPENTWhat.htm)
for more information.

VMPHYINV - Physical Inventory Count

This applies when you are conducting part counts and recounts within
warehouses and can specify a location. Click [here](VMPHYINVWhat.htm)
for more information.

VMIBTSHP - Interbranch Transfer Shipping
Entry

This applies when you are shipping an IBT from one warehouse (From
Whse ID) location to another (To Whse ID) and can specify from which
location you want to ship the parts. Click [here](VMIBTSHPWhat.htm)
for more information.

VMIBTRCV - Interbranch Transfer Receipts
Entry

This applies when you are receiving an IBT into a warehouse location
(To Whse ID) and can specify which location you want to receive the
transfer. Click [here](VMIBTRCVWhat.htm) for more information.

In all the above cases, if your preference is to allow the creation
of new part/location associations, VISUAL prompts you, as you specify
a new Location ID for the part, with a dialog box in which you can
specify a Hold Reason ID, Description, and a Status for the part in
the new Warehouse Location.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help