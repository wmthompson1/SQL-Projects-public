Specifying Information on the General Tab




# Specifying Information on the General Tab

Use the General tab to define basic information about
your site.

1. Click the General
   tab.
2. Specify the sites address
   in the address fields.

If you are licensed to use a single site,
the address you define in Application Global Maintenance is used in
the system. You do not have to specify a site address.

3. In the Packlists section,
   specify the default status for this sites packlists. Specify
   one of these values:

S (Shipped)
Packlists are not invoiced or shipped.

1, 2, or 3 Review
Packlists must be reviewed.

A Approved for
Invoicing.

4. In the Repetitive section,
   specify information to use in the Material Planning Window. Specify
   this information:

Demand Fence 1 and 2
Demand fences are used in conjunction with MRP. The values you specify
in this section are used to order parts if the part has an order policy
of Master Schedule, and the demand fence is not defined on the parts
record or on the product code for the part. The value is in days.

Use Fence 1 as MRP Frozen
Period To prevent planned orders from being created during
the demand fence period, select this check box. When you select this
check box, planned orders cannot be created within the demand fence
time period. Planned orders are generated after the time specified
in demand fence 1 elapses. By using a frozen demand fence, you can
prevent planned order from being generated in a time frame that is
too short to actually supply the product.

Clear this check box to allow planned orders
to be generated at any time.

5. In the Part Location
   on the Fly section, select one of these options:

Not Allowed
Select this option to prevent part locations from being assigned on
the fly. You can only use existing part/location associations. You
cannot create new part/location associations or unique warehouse locations
at the time of transaction. With this setting, you must establish
part/ location associations using the Part Maintenance window or the
Part Location Creator.

Assign Existing Location
to Part Select this option to allow users to assign an existing
warehouse location to a part (an association that previously did not
exist) at the time of a transaction. The warehouse location and part
must already exist.

Create New Location and
Assign to Part Select this option to allow users to create
a new warehouse location and assign it to a part, thereby creating
a valid part/location association at the time of the transaction.
The warehouse must already exist.

The part location on the fly setting applies
to transactions created using:

Inventory Transaction Entry
(VMINVMNT.EXE) - This applies when you receive, issue, adjust,
and transfer (only in To Warehouse Locations) part quantities and
must specify a warehouse location into which you are receiving, transferring,
issuing, or adjusting.

Purchase Receipt Entry (VMRCVMNT.EXE)
- This applies when you are receiving a purchase order quantity
at a warehouse and can specify a location within the warehouse at
the time of receipt.

Shipping Entry (VMSHPENT.EXE)
(returns only) - This applies when you are receiving a returned
customer shipment at a warehouse and can specify a location within
the warehouse at the time of return receipt.

Physical Inventory Count
(VMPHYINV.EXE) - This applies when you are conducting part
counts and recounts within warehouses and can specify a location.

Interbranch Transfer Shipping
Entry (VMIBTSHP.EXE) - This applies when you are shipping an
IBT from one warehouse (From Whse ID) location to another (To Whse
ID) and can specify from which location you want to ship the parts.

Interbranch Transfer Receipts
Entry (VMIBTRCV.EXE) - This applies when you are receiving
an IBT into a warehouse location (To Whse ID) and can specify which
location you want to receive the transfer.

When you create a new part/location association,
you are prompted to specify a Hold Reason ID, Description, and a Status
for the part in the new Warehouse Location.

6. In the Part Warehouse
   on the Fly section, select the Prevent Warning
   Message to prevent a warning message from displaying when
   you create a new Part Location on the fly. This check box is not
   available if you selected the Not Allowed option in the Part/Location
   on the Fly section.
7. In the Issue Negative
   section, select from these combinations:

Warehouse cleared, Location
cleared Use this combination to prevent both locations and
warehouses from reaching a negative quantity.

Warehouse selected, Location
selected Select both check boxes to allow individual warehouse
locations to reach a negative quantity and to allow the warehouse
to reach a negative quantity as well. The system behaves in the same
manner as it does if you select only the Warehouse check box.

Warehouse cleared, Location
selected Use this combination to allow warehouse locations
to reach a negative quantity, but to prevent the warehouse from reaching
a negative quantity. If you select this combination, a particular
warehouse location can reach a negative quantity provided that the
material is available in another location in the warehouse.

Warehouse selected, Location
cleared If you select this combination, neither warehouses
nor locations are allowed to reach a negative quantity.

Auto Issue locations are exempt and are
allowed to reach negative quantities regardless of the setting.

Allocations are not considered. The system
only considers quantity on hand when determining whether the location
reaches a negative quantity.

8. Select the Allocate
   Negative check box to allocate demand even though it may
   cause a negative balance.
9. If VISUAL is integrated
   to Infor Quality Management, select the Enable
   check box in the Infor Quality Management Interface section. Specify
   this information:

Always Use/Query Use
After an ECN is ready to be implemented, you click the Start button
in ECN Entry. These options determine the result of clicking the Start
button. If you click Always Use, then IQM is always launched when
you click the Start button in ECN Entry. If you click Query Use, then
you are prompted to choose to open the appropriate IQM maintenance
window or to open the appropriate VISUAL maintenance window. For example,
if the ECN is for a document, you can choose to open IQM Document
Maintenance or VISUAL Document Maintenance.

Application Path
Specify the default URL for IQM. This is the URL you access to sign
into IQM.

Configuration
Specify the IQM configuration to sign into.

Use VE User
To pass the currently signed in VISUAL user ID to the IQM sign in
window, select this check box. If the user is already signed into
IQM, then IQM can be accessed directly from VISUAL. The user does
not have to sign into IQM again. If the user is not currently signed
into IQM, then the user ID is passed to the IQM sign in window. The
user must supply a password. To require users to always sign into
IQM, clear this check box.

10. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User Defined Help