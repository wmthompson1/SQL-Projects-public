Creating Move Requests in Inventory Transaction Entry




# Creating Move Requests in Inventory Transaction Entry

To create a move request:

1. Select Inventory,
   Inventory Transaction Entry.
2. If you are licensed
   to use multiple sites, click the Site ID
   drop-down button and select the site where you are completing
   the transaction. If you are licensed to use a single site, this
   field in unavailable.
3. In the Transaction Class
   section, select one of these transaction types:
4. Receipt by
   WO
5. Issue
6. Receipt Return
7. Issue Return

4. Select the Create
   Move Request check box.
5. Complete the required
   information in the Inventory Transaction Entry window.
6. Click Save.
   The move request is generated. If you have not enabled the Auto
   Save Move Request in Background option, the Move Request window
   is opened. If you have enabled the option, then you can manually
   open the Move Request window from the Inventory menu.

This information is populated based on the
information that you specified in Inventory Transaction Entry and
default information that you set up:

Status If you
specified a default status in the Default Matl Move Request Status
field in Site Maintenance, the default status is displayed. If you
did not set up a default status for material move requests, then Pending
is displayed.

WIP Delivery Type
If you specified a default status in the Default WIP Delivery Type
field in Site Maintenance, the default delivery type is displayed.
If you did not set up a default delivery type for material move requests,
then this field is blank.

Request Type
The request type that is displayed depends upon the transaction you
completed in Inventory Transaction Entry. If you completed an Issue
or Issue Return transaction, then Inventory is displayed. If you completed
a Receipt by WO transaction, then WO Receipt is displayed. If you
completed a receipt return, then WO Return is displayed.

Pickup Resource
For issue returns, the operation resource from which you are returning
materials is displayed.

Pickup Department
For issue returns, the department associated with the operation resource
is displayed.

Pickup Warehouse
For issues and work order returns, the ID of the warehouse that
you specified on the inventory transaction is displayed. For work
order receipts, this field is blank.

Pickup WIP Location
For issues and work order returns, the default stockroom WIP location
for the warehouse is displayed. If a default stockroom WIP location
has not been specified in Warehouse Maintenance, then this field is
blank

Deliver To Resource
For issues, the operation resource to which you issued materials
is displayed.

Deliver To Department
For issues, the department associated with the operation resource
is displayed.

Deliver To Warehouse
For work order receipts and issue returns, the ID of the warehouse
that you specified in the inventory transaction is displayed.

Deliver To WIP Location
For work order receipts and issue returns, the default stockroom
WIP location for the warehouse is displayed. If a default stockroom
WIP location has not been specified in Warehouse Maintenance, then
this field in blank.

Line item table
The details of the work order and material requirement are displayed.
In the Inv Trans column, the ID of the inventory transaction that
was used to generate the move request is displayed.

7. Complete the other fields
   in the move request as necessary. See [Manually
   Creating a Move Request](Manually_Creating_a_Move_Request.htm).
8. Click Save.