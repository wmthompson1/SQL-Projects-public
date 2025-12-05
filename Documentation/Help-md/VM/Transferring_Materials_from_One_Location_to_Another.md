Transferring Materials from One Location to Another




# Transferring Materials from One Location to Another

In the system, each project can have only one warehouse. You might
find it necessary, however, to account for transit time between two
locations. You can set up multiple addresses for the project warehouse,
then use Interbranch Transfer to account for transit time.

Please note that VISUAL is designed to apply burden against initial
transactions only. These transactions include: Inventory Adjustments
In, Labor Transactions, Purchase Receipts, General Journal Entries
and manual AP invoices linked to production.

"Move" transactions including Transfers, WIP Issues, Inventory
Adjustments Out, Shipments, and Return transactions do not create
burden in VISUAL. These transactions move costs at a summary level
only. When the move transactions take place they create cost layers
that summarize each cost component (Material, Labor, Burden, and Service/Other
Direct Costs) on a General Ledger and Cost/Burden Category level.
Not all of these transactions create project summary records.

## Setting Up Multiple Warehouse Addresses

To set up multiple warehouse addresses:

1. From the Inventory menu,
   select Warehouse Maintenance.
2. Click the Warehouse
   ID button and select the warehouse for which you want to
   add addresses.
3. Click the Alternate
   Warehouse Address toolbar button, or select Edit,
   Alternate Warehouse Addresses....

The Alternate Warehouse Address dialog box
appears.

4. Click the Insert
   button to add a new row, then enter information in the following
   fields:

Ship to ID Specify
the Ship to ID you would like to use for this warehouse address.

Name Specify
the name of the alternate address in the Name field.

Address Specify
the alternate street address for this warehouse.

City Specify
the city in which the warehouse is located in the City field.

State Click
the State arrow and select the abbreviation for the state in which
the warehouse is located.

Zip Specify
the postal code of the area in which the warehouse is located in the
Zip field.

Country Select
the Country ID from the drop-down list, or click the browse button
to search for the Country ID in which the warehouse is located.

VAT Registration
- If you have a VAT registration number for this warehouse, specify
it here.

5. Click OK.

The Warehouse Address dialog box closes.

## Using Interbranch Transfer Within the Same Warehouse

After you set up multiple warehouse addresses, use the following
procedure to transfer items from one warehouse address to another.

1. From ERP Express (VISUAL)s
   main window, select the Inter Branch Transfer
   Entry option from the Inventory menu.

The Inter Branch Transfer Entry window appears.

2. If you want to manually
   enter an IBT ID, click in the IBT ID filed and enter a unique
   identifier for this transfer. If you are using the auto-number
   feature, leave this field empty.
3. Set up the following
   transfer information:

Order Date Click
the Order Date calendar button and select the date on which you want
the transfer to occur.

From Warehouse ID and
To Warehouse ID Click the browse button and select the project
warehouse you would like to use. Make sure to enter the same project
warehouse in the From Warehouse ID and To Warehouse ID fields..

Desired Ship Date
Click the Desired Ship Date calendar button and select the date
on which you would like to ship the goods.

Desired Receive Date
Click the Desired Recv Date calendar button and select the date
on which you would like the receiver to receive the parts.

Transit Days
In the Transit Days field, enter the number of days the parts are
to be in transit. For transfers within the same warehouse, you must
enter the transit days manually.

Owner ID Click
the Owner ID browse button and select the owner of the goods.

4. From the Edit menu,
   select Ship From Address, or click the
   Ship From Address button on the toolbar.

The Alternate Warehouse Address dialog box
appears.

5. Select the address you
   would like to use for the ship from address, then click Use Selected
   Address. The system placed a check mark in the Use check box.
   To choose a different address than the one selected, click the
   Clear Selected Address button, highlight the address you would
   like to use instead, then click the Use Selected Address button.
6. To choose the ship to
   address, from the Edit menu select Ship To
   Address, or click the Ship To Address button on the toolbar.
   In the Alternate Warehouse Address dialog box, select the the
   address you would like to use for the ship to address, then click
   Use Selected Address. The system placed a check mark in the Use
   check box. To choose a different address than the one selected,
   click the Clear Selected Address button, highlight the address
   you would like to use instead, then click the Use Selected Address
   button

After you select a ship from and a ship
to address, the address information appears in the Ship From/To tab.

7. On the Ship From/To
   tab, enter and select the following information:

Status Click
the Status arrow and select a status for the transfer. You can select:

Firmed

Released

Closed

Cancelled/Void

Shipped

Whether or not you assign a status, ERP
Express (VISUAL) assigns a default status to a transfer.

Carrier ID Click
the Carrier ID arrow and select a carrier for the transfer.

Ship Via Click
the Ship Via arrow and select a means of conveyance for the transfer.

Click the Insert Row
toolbar button and enter the following information.

Quantity The
quantity of the part that you are transferring.

Part ID Click
the Part ID browse button to select the part that you want to transfer.

Quantity Shipped
The current orders quantity of parts that you have successfully
shipped to another warehouse.

Quantity Received
The current orders quantity of parts that you have successfully
receive in the To warehouse.

Transit Location ID
The location within the warehouse from which you are shipping the
part. If the part does not have a Transit Location ID in the From
Whse ID, you can specify a unique Transit Location ID, which ERP Express
(VISUAL) adds to the database. You can only define one warehouse location
per part this way, or on the fly. After you have defined one transit
location for a part in a warehouse in this manner, you must use Part
Maintenance to specify other locations as transit locations.

U/M The unit
of measure of the part.

Unit Price The
price per unit of the part.

Extension The
price per unit of the part multiplied by the quantity of parts.

Specs ERP Express
(VISUAL) selects this box if there is any text regarding the IBT line.

Stock Order Qty
The stock order quantity of the part. Stock Order Quantity is the
same as the order quantity.

Destination Location
ID Click the Destination Location ID browse button and select
the location to where you want the goods transferred.

Demand Quantity Allocated
The quantity of the IBT that you have allocated to demand.

Demand Quantity Fulfilled
The demand quantity that has been fulfilled from by the supplying
source.

Supply Quantity Allocated
The quantity that you have allocated as supply to the IBT line

Supply Quantity Fulfilled
The supply quantity that has been fulfilled by the supplying source.

Cartons The
number of cartons you use in the shipment.

Shipping Weight
The weight of the shipment.

Weight U/M The
unit of measure used to weigh the part that you are transferring.

Package Type
The type of package in which you are shipping the IBT. Enter packaging
types in Application Global Maintenance.

Owner ID Click
the Owner ID browse button and select the owner of the goods.

8. Click the Save
   toolbar button.

ERP Express (VISUAL) saves the transaction
and generates the next available IBT ID.