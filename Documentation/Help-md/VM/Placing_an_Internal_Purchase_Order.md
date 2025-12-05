Placing an Internal Purchase Order




# Placing an Internal Purchase Order

Create a purchase order to begin the process of transferring inventory
between two sites in different entities.

When you save the purchase order, a corresponding customer order
is created in the site that is shipping the inventory. You cannot
directly create an internal customer order, or edit the customer order
after it has been created. You must use the purchase order to manage
the process.

The parent entities of the sites you use in the internal purchase
order must share at least one currency. If the parent entities do
not share a currency, you cannot save the order.

You cannot place an internal consolidated purchase order. If you
place a consolidated purchase order, you must use an external vendor.

To create the purchase order:

1. Select Purchasing,
   Purchase Order Entry.
2. In the Site ID field,
   select the site that is purchasing the materials.
3. In the Vendor ID field,
   select the ID of the internal vendor you created for the site
   shipping the materials.

When you select an internal vendor, the
Internal Order check box is selected.

4. Specify these dates:

Desired Recv Date
Specify the date you want to receive the materials. If this date
is the same for all items in the order, specify the date on the header.
To specify a different date for each item in the order, enter the
date on the purchase order line.

This date is inserted in the Desired Ship
Date on the customer order only if you do not specify a Promise Ship
Date on the purchase order.

Promise Delivery Date
Specify the date the vendor promises to deliver the order. If this
date is the same for all items in the order, specify the date on the
header. To specify a different date for each item in the order, enter
the date on the purchase order line.

When the customer order is created, this
date is inserted in the Promise Delivery Date field on the customer
order. If you do not specify a date, then the Promise Delivery Date
field is left blank on the customer order.

Promise Ship Date
Enter the date the vendor promises to ship the order. If this date
is the same for all items in the order, specify the date on the header.
To specify a different date for each item in the order, enter the
date on the purchase order line.

When the customer order is created, this
date is inserted in the Desired Ship Date field and Promise Ship Date
field on the customer order. If you do not specify a Promise Ship
Date on the purchase order, then the Desired Recv Date on the purchase
order is used for the Desired Ship Date on the customer order. The
Promise Delivery Date on the customer order is left blank.

5. In the FOB field, select
   the FOB code. You should select a code that specifies who owns
   the material while the material is in transit.
6. Click the browse button
   and select the internal customer ID you defined for the site that
   is purchasing the materials. This is the site you specified in
   the Site ID field. If you defined a default customer ID in Site
   Maintenance, then the default value is inserted.

This field is displayed only if the Internal
Order check box is selected.

7. If applicable, specify
   the VAT code to apply to the customer order.

To use the VAT code that is specified on
the internal vendor record, clear the Use Cust
VAT/Tax check box. To use the internal customers tax information,
select the Use Cust VAT/Tax check box.

To use the tax information on the main customer
record, leave the SO VAT/Tax Shipto ID field blank. To use tax information
that is associated with a customer address, specify the ID of the
address in the SO VAT/Tax Shipto ID field.

8. Complete the purchase
   order. If you set up a product code to use with internal order,
   specify the product code ID on the line.
9. Optionally, create delivery
   schedules for each line. All information you specify for the delivery
   schedule is copied to the linked sales order.
10. Click the Save
    button.

When you save the purchase order, the corresponding customer order
is created in the site that is shipping the materials.

## Working with ship to addresses

When you create an internal purchase order, the address you specify
for the ship to address on the purchase order is also used on the
customer order. Since the purchase order ship to address information
resides in different database table than the customer order ship to
address information, a comparison between the ship to address table
(SHIPTO\_ADDRESS) and the customer shipping address table (CUST\_ADDRESS)
is made. The ship to Name, Address Line 1, Address Line 2, Address
Line 3, City, State, Zip code, and Country in the purchase order are
compared to the shipping addresses Name, Address Line 1, Address Line
2, Address Line 3, City, State, Zip code, and Country specified for
the customer ID in the Internal Customer ID field. If all fields match
exactly, then the matching customer shipping address ID is used on
the customer order.

If the ship to address information in the purchase order does not
exactly match a shipping address for the internal customer, then the
address specified on the purchase order is created in the customer
shipping address table.

The same comparisons and processes are made for ship to addresses
specified on the purchase order header, on the purchase order line,
and on the purchase order delivery schedule.

## Choosing a Supply Warehouse for the Internal Customer Order

After the internal customer order is created, you can select the
warehouse that ships the materials using the Supply Links dialog in
Customer Order Entry.

If your internal purchase order included a delivery schedule, use
the Supply Links dialog available from the Customer Order Delivery
Schedule dialog.

To assign a supply warehouse for an internal customer order:

1. In Customer Order Entry,
   open the internal order.
2. Select the line for
   which you want to specify a warehouse.
3. Perform one of these
   steps:
4. If the line
   is linked to a delivery schedule, select Edit, Delivery Schedule....
   Select a line, and then click Supply....
5. If the line
   is not linked to a delivery schedule, select Edit, Assign Supply
   to Customer Order Line....

4. To ship all quantities
   on the selected line from a particular warehouse, click the Warehouse
   ID browse button and select the warehouse.
5. Click Ok. If you accessed
   the Supply Links dialog from the Edit Delivery Schedule dialog,
   click Ok in the dialog to return to the Customer Order Entry window.
   For customer order lines that do not have delivery schedules,
   the ID of the warehouse you specified is inserted in the Warehouse
   ID column.
6. Exit the Customer Order
   entry window.

NOTE: If you click Save before you exit
the Customer Order Entry window, a message is displayed warning you
that internal orders cannot be saved. You can ignore this message.
The warehouse IDs you selected are properly saved.

## Completing the transactions

To complete the internal buy/sell transactions:

In Purchase Order Entry, set the status of the order to Released.
This updates the sales order status to released.

After the sales order is released, ship the materials. In Shipping
Entry, specify the site ID that is displayed as the Site ID on the
customer order.

After the materials are shipped, you can receive the materials.
In Purchase Receipt Entry, specify the site that is displayed as the
Site ID on the purchase order.