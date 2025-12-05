Maintaining Currency Price Indexes




# Maintaining Currency Price Indexes

Use the Currency Price Index feature to establish
stable conversion rates for currencies experiencing large exchange
rate fluctuations and stabilize greatly varying part prices over short
periods of time.

A part price list index is a list of user-defined conversion rates
that remain relatively fixed. This method of currency conversion allows
part prices to remain more stable over time.

If a customer order has a different currency than the currency of
the price, VISUAL uses the CURR\_PRICE\_INDEX table. If the user has
entered an exchange rate for the two currencies involved, VISUAL completes
the necessary conversion. If no data is found, the system will use
the most recent rate from the CURRENCY\_EXCHANGE table in calculating
the proper currency value for the order.

To add indexes:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site. If you are licensed to use a single
   site, this field is unavailable.
3. In the Part ID field,
   click the browse button and select the Part ID.
4. Select Maintain,
   Currency Price Index.
5. Click Insert.
6. Specify this information:

From Currency ID
- The currency you are converting. Double-click the column header
to view a table of valid VISUAL currencies.

To Currency ID
- The currency to which you are converting the above "from currency."
Double-click the column header to view a table of valid VISUAL currencies.

Exchange Rate
- User-defined conversion rate VISUAL uses to convert part prices.

7. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help