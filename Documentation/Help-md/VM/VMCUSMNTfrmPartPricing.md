Specifying Part Pricing for the Customer




# Customer Pricing Effectivity

## Unit Pricing

When you enter a customer order, VISUAL looks in the following places,
in order, to determine the price of the applicable parts:

1. First, VISUAL searches
   for a specific part price by querying the CUSTOMER\_PRICE\_EFFECT
   table. This table contains a quantity break column, which permits
   a price break after your customer has reached a certain quantity
   of sales. You can set pricing tables by: order dates, shipment
   date, or both. The table stores prices in the customer currency.
2. If VISUAL does not find
   a price in the Customer Pricing Table, VISUAL searches for a specific
   part price by discount. The system queries the DISCOUNT\_PRICE
   table as is currently done. The table stores prices in the customer
   currency.
3. If a part does not have
   a customer price or discount price defined, VISUAL looks for a
   market price for that part in the customer's market and the document
   currency. This data is located in the MARKET\_PRICE table, which
   is similar in structure to the CUSTOMER\_PRICE\_EFFECT table. The
   table contains part prices by market and Currency ID. Market defaults
   and currencies are stored in the MARKET table.
4. If a part does not have
   a MARKET\_PRICE record, VISUAL queries the MARKET table for the
   default currency for the market area, and then queries the MARKET\_PRICE
   table looking for a price in the default currency of the market.
5. If neither a specific
   customer nor market price exists for a particular part, VISUAL
   uses the system price for the part. This price is located in the
   PART table and is stored in entity currency. VISUAL then looks
   to the MARKET table to find a market price rate adjustment for
   the customer's market. If VISUAL finds one, it adjusts the standard
   entity currency price by this rate.

The steps above determine the price for a part, but not necessarily
in the currency of the current order.

## Setting Part Pricing

If you want to give this customer price breaks based
on the quantity of parts they purchase, set up a pricing table that
contains all of the parts for which you want to give this customer
price breaks.

VISUAL allows you to set up multiple price break tables for the
same part providing you use different Selling U/Ms. For example, your
customer, may buys parts in quantities less than a pallet load, by
the pallet, or by the truck load.

To add unit prices by customer:

1. From the Maintain menu,
   select Part Pricing.

The Part Pricing For dialog box appears.

2. Click the Insert
   button.

A
new line appears in the table and VISUAL enters Orders in the By Order/Ship
Date column.

3. Click the <Part
   ID> column header and select the part for which you
   are setting up a price break structure.
4. Click in the Customer
   Part ID column and enter the name or ID of this part that your
   customer uses.
5. Click the <Selling
   U/M> column header and select the standard Unit of Measure
   you want to use for selling this part and using this pricing table.

Enter the date on which you want this price
break structure to take effect in the Effective Date column.

You must enter dates using a Day/Month/Year
style. For example: 1/11/05 or 01/11/2005 would be valid for November
1st 2005.

6. If you want to enter
   the current date, click in the date column and press the T key.
   To open a calendar, click in the date column and press the SPACEBAR
   key.
7. Enter the date on which
   you want VISUAL to discontinue this pricing structure for this
   customer in the Discontinue Date column.
8. If you do not want to
   use Orders for time at which you give the discount, click in the
   By Order/Ship Date column and select:

Shipments - VISUAL
applies pricing based on the date you ship the order. This can result
in a different price on the packlist and invoice than what is on the
order.

Orders - VISUAL
applies pricing based on the date your customer places the order.

Both - VISUAL
applies the price based on the date of the order and then again based
on the date you ship the order.

If you change any pricing structures or
the date of the order, you must use Reprice Lines from the Edit menu
before VISUAL recalculates the new prices for the line.

9. In
   the Price Break Table section, for each Quantity level at which
   you want to give discounts, enter the quantity and price.

If you have entered a Unit Price in the
Selling Price section of the Costing tab, VISUAL automatically enters
the Default price in the table.

10. Click the Save
    button.
11. If you have finished
    entering price break tables for this customer, click the Close button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.md) User-defined Help