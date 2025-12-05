Customer Order Pricing Hierarchy




# Customer Order Pricing Hierarchy

When you enter a customer order, the price for the part on the customer
order line is determined using this hierarchy:

1. If a price for the part
   has been specified in the customer price table (CUST\_PRICE\_EFFECT),
   this price is used. You can specify pricing information for customers
   in Part Maintenance and in Customer Maintenance. When you specify
   pricing structure for a part, you also specify the dates that
   the pricing is effective. The table stores prices in the customer
   currency.
2. If a price is not found
   in the Customer Pricing Table, then the price for the part by
   discount code is used. Specify discounts in the Unit Prices by
   Discount Code dialog box. This information is stored in the DISCOUNT\_PRICE
   table.
3. If a part does not have
   a customer price or discount price defined, a market price for
   that part in the customer's market and the document currency is
   searched for. This data is located in the MARKET\_PRICE table,
   which is similar in structure to the CUSTOMER\_PRICE table. The
   table contains part prices by market and Currency ID. Market defaults
   and currencies are stored in the MARKET table. Define the pricing
   information in Unit Prices by Market dialog box.
4. If a part does not have
   a MARKET\_PRICE record, the MARKET table is queried for the default
   currency for the market area, and then the MARKET\_PRICE table
   is queried for a price in the default currency of the market.
5. If neither a specific
   customer nor market price exists for a particular part, the Unit
   Price specified in the Selling section on the Costing tab of Part
   Maintenance is used. If you are licensed to use multiple sites,
   this price is site-specific. The MARKET table is then searched
   to find a market price rate adjustment for the customer's market.

These steps determine the price for a part, but not necessarily
in the currency of a customer order.