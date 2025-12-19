What is Consigned Inventory?




# What is Consigned Inventory?

Consigned inventory is inventoryparts and materialkept
in a location but owned by the supplying company. For example, you
have a vendor supplying you with PART A. You purchase the part one
hundred at a time but your vendor ships them one thousand at a time.
Your vendor may ship you one thousand of which you purchase one hundred
and stock nine hundred on consignment: you own one hundred and the
vendor owns nine hundred even though you are stocking the nine hundred.
The next time you purchase one hundred, you take ownership of that
one hundred and the vendor continues to own the remaining eight hundred.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL does not support Dimensional Inventory for Consignments. |

## How Does Consignment Work?

Using VISUALs consigned inventory functionality, you can manage
the four types of consigned inventory:

At Customer Inventory owned by you but
stored at your customers location. When the customer consumes the
inventory, they notify you and take ownership.

Initially this material resides in your warehouse until you ship
it to your customer.

1. Create a consignment
   warehouse and assign it to your customer. You are creating a warehouse
   located at your customers site where the parts are physically
   located: a consignment warehouse assigned to your customer.
2. Use the Inter Branch
   Transfer windows to perform the shipping and receipt transactions
   necessary to move the material from your standard warehouse to
   the consignment warehouse (assigned to the customer). This will
   allow you to set up addresses for the warehouse assigned to the
   customer.
3. When your customer consumes
   the material, create a customer order and shipment to transfer
   ownership of the consumed material to the customer.

From Customer Inventory owned by your
customer but stored at your location. When you consume the inventory,
you notify the customer but there is no transfer of ownership and
no cost to you because you never own it. You use the material to build
a product for the same customer.

Typically these would be unique Part ID's in your system. To help
ensure the separation of materials, store these materials in warehouse
locations assigned to those customers until you issue them to jobs
to build the customer's finished product.

1. Create an inventory
   location assigned to the customer.
2. Use the Consignment
   Receiving window to receive consignment parts into inventory.
3. Issue the parts to your
   jobs as normal.

At Vendor Inventory owned by you but
sent to your vendor to be used to complete a service. When the vendor
consumes the inventory, they notify you so you can issue it to the
job.

1. Create a consignment
   warehouse assigned to the vendor.
2. Use the Inter Branch
   Transfer windows to perform the shipping and receipt transactions
   necessary to move the material from the standard warehouse to
   the consignment warehouse (assigned to the vendor). This will
   allow you to set up addresses for the warehouse assigned to the
   vendor.
3. When the vendor consumes
   the material and notifies you, issue the material to the job as
   normal.

From Vendor Inventory owned by your
vendor but stored at your location. When you consume the inventory,
you notify the vendor and take ownership.

To accomplish this:

1. Create an inventory
   location assigned to the vendor.
2. Create a consignment
   purchase order with the consigned location selected.
3. Use the Consignment
   Receiving window to receive consignment parts into inventory.
4. Parts and material in
   consignment locations have no value because they are owned by
   the vendor.
5. Assume ownership by
   Creating a Purchase Order Receiver for the consigned material.

VISUAL moves the material from the consigned
location into a standard location and assigns a value to the materialyou
now own that material.

Consignment and Costing Method

If you use Standard Costing methods, you can use By Part or By Part
Location for your FIFO Method / Inventory Grouping.

If you use Actual or Average Costing methods, you must use By Part
Location as your FIFO Method / Inventory Grouping. If you use Actual
or Average Costing methods with FIFO By Part, VISUAL removes the From
Vendor and From Customer location types from Warehouse Maintenance.
VISUAL also displays an error message if you attempt to access Consignment
Receiving.

Maintaining Zero Costs for Customer Inventory
Consigned to You

For inventory that the customer consigns to you, you must maintain
unique Part IDs for each customer. Maintaining unique Part IDs for
each customer allows for easier traceability through the system.

## Working With Consignment Related Information

Create consignment inventory locations for your customers from which
you will accept consignments.

Assign parts and materials you will accept on consignment to consignment
locations.

What you need to have is a consignment location for the part for
the customer/vendor.

* Warehouse Maintenance
* Part Maintenance (Warehouse
  Locations for Parts)
* Inter Branch Transfer
* Customer order Entry
* Shipping Entry
* Consignment Receiving
* Purchase Order Entry
* Purchase Receipt Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Consignment_Receiving.md) User-defined Help