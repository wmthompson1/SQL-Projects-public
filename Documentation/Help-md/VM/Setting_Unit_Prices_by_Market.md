Setting Unit Prices by Market




# Setting Unit Prices by Market

Before you can specify unit prices by market, set
up market codes. See [Maintaining
Market Information](Maintaining_Market_Information.md). To assign a customer to a market, use Customer
Maintenance. See [Adding Customers](VMCUSMNTfrmCustomer.md).

When you enter a customer order, the market-specific prices you
set up are used if customer-specific prices or discount codes prices
have not been set up. See [Customer
Order Pricing Hierarchy](Customer_Order_Pricing_Hierarchy.md).

When you set up prices for a part by market, the prices you specify
in the Unit Prices by Market dialog are used as-is when you enter
a customer order. The market adjustment is not applied to the price
when you enter a customer order.

If you are licensed to use multiple sites, unit prices by market
are set up at the tenant level.

To add unit prices by market:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site. If you are licensed to use a single
   site, this field is unavailable.
3. In the Part ID field,
   click the browse button and select the Part ID.
4. Select Maintain,
   Unit Prices by Market.
5. Click Insert.
6. Specify this information:

Market ID Double-click
the Market ID browse button and select a Market ID for the part.

Currency Specify
the currency for the pricing. By default, the currency defined for
the market is inserted.

Selling U/M
Specify the unit used to sell this part. By default, the stock unit
of measure specified for the part is inserted. To specify a different
unit of measure than the default unit, a conversion factor must exist
between the two units.

7. Specify the unit price
   and quantity combinations in the right table panel. Specify price
   breaks in ascending order. For example, specify 10 in the first
   row to specify the price for quantities up to 10. Specify 20 in
   the second row to specify the price for quantities between 11
   and 20, and so on.
8. In the first line, specify
   the default unit price. The default is used if the quantity does
   not fall within one of the ranges you specify.
9. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help