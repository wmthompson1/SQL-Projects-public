Specifying Unit Prices for Parts Before Shipment




# Specifying Unit Prices for Parts Before Shipment

Before VISUAL ships any order lines, it checks to
see if the part on the order line has a unit price that is in effect
for the customer. Price effectivity hinges on a specific combination
of factors, all of which VISUAL obtains from the CUST\_PRICE\_EFFECT
table in the database. When trying to ship an order, VISUAL references
this table and looks for the following things:

* a part to customer relationship
  that matches the one in the customer order
* a effective date range within
  which the ship date occurs

Finding both of these things, it retrieves the effective price for
the customer from the appropriate date range, and fills the Unit Price
column with the unit price of the part on the line. The total value,
then, is based on the quantity of the order line and any established
break quantities for the customer. See Part Maintenance for more information
on quantity price breaks.

If one or both of these things are not present, VISUAL disallows
shipment until you set up an effective price for the customer.

For example, on January 10, 2002, you are going to ship an order
for Customer A that contains 3 lines, all for the same part, Part
A. Before you created the order and it arrived at the shipping stage,
you used Part Maintenance to add effective date prices to Part As
master.

In the master, you specified that Customer A, for the dates of January
1, 2004 through July 1, 2004, must pay 1.00 per unit of Part A.

Now, back at the Shipping Entry window, VISUAL checks Part As master
to see if Customer A is eligible to order it, and, providing that
they are, what date/price scheme is in effect.

Finding that the order date is within the date range for Part A,
VISUAL knows to charge 1.00 per unit of Part A, and updates the Unit
Price with any quantity break information.

[Price Effectivity
in Shipping Entry](Price_Effectivity_in_Shipping_Entry.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help