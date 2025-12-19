Specifying Pricing by Customer




# Specifying Pricing by Customer

To give individual customers price breaks based on
the quantity of parts they purchase, set up a pricing table for each
customer to whom to give price breaks.

You can set up multiple price break tables for the same customer
providing you use different Selling U/Ms. For example, for one customer,
you can set up Price Break Tables for quantities less than a pallet
load. You can also set up Price Break Tables for the same customer
for quantities that require shipment by the pallet load.

If you are licensed to use multiple sites, the customer pricing
information is maintained at the tenant level.

If you specify pricing for a customer, then the pricing is used
on orders for the customer. See [Customer
Order Pricing Hierarchy](Customer_Order_Pricing_Hierarchy.md).

This procedure describes how to set up customer pricing in Part
Maintenance. You can also set up customer pricing in Customer Maintenance.
See [Specifying Part Pricing for
the Customer](VMCUSMNTfrmPartPricing.md).

To require that customer-specific pricing be set up for a part at
the time of shipment, use the Effectivity Date Price for Shipments
field on the Costing tab. See [Requiring
the Use of Customer-specific Pricing at Shipment](Establishing_Customer_Price_Effectivity.md).

To add unit prices by customer:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select a site. While you must select a site to access
   the dialog box, customer pricing is maintained at the tenant level.
   The pricing information you set up applies to all sites.
3. In the Part ID field,
   click the browse button and select the Part ID.
4. Select Maintain,
   Customer Pricing.
5. Click Insert.
6. Specify this information:

Customer ID
Double-click the browse button and select the customer for whom you
are setting up this price break table.

Customer Part ID
Specify the ID your customer uses for the part.

Selling U/M
Specify the unit used to sell this part to the customer. To specify
a different unit of measure than the default unit, a conversion factor
must exist between the two units.

Effective Date
Specify the date on which this price break structure will take effect.
To specify todays date, place your cursor in the column and press
T. To open a calendar, place your cursor in the column and press the
space bar.

Discontinue Date
Specify the date on which to discontinue this pricing structure.

By Orders/Ship Date
Click the arrow to select which record type to use to determine
if the customer pricing is in effect. Select one of these options:

Both Select this
option if the both date of the customer order and the date of the
shipment are used to determine if the customer pricing is in effect.
If the date of the order or shipment is between the dates specified
in the Effective Date and Discontinue Date columns, then the pricing
specified in the price break table is applied.

Orders Select this
option if the date of the customer order is used to determine if the
customer pricing is in effect. If the date of the order is between
the dates specified in the Effective Date and Discontinue Date columns,
then the pricing specified in the price break table is applied.

Shipments Select
this option if the date of the shipment is used to determine if the
customer pricing is in effect. If the date of the shipment is between
the dates specified in the Effective Date and Discontinue Date columns,
then the pricing specified in the price break table is applied.

7. In the Price Break Table
   section, for each Quantity level at which you want to set pricing,
   enter the quantity and price.

If you have entered a Unit Price in the
Selling Price section of the Costing tab, VISUAL automatically enters
the Default price in the table.

Specify the price information in the customers
currency. The customers currency is displayed beneath the table.

8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help