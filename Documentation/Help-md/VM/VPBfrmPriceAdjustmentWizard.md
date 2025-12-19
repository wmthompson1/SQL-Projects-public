Adjusting Prices




# Adjusting Prices

The Price Adjustment function, within VISUAL Price
Book, works through a wizard that prompts you to enter the appropriate
values for adjusted prices.  It is a quick means of changing
prices or commissions throughout the system, without having to open
each record that references the price.

|  |  |
| --- | --- |
| POSTIT.gif | At any time while entering the Price Adjustment, you can click the Back button to return to the previous screen.  If you want to exit the Price Adjustment wizard without making any changes to the prices within VISUAL Price Book, click the Cancel button. |

1. With VISUAL Price Book
   open, from the navigation pane, double-click the Price
   Adjustments icon.

The first step of the Price Adjustment wizard
appears.

2. From the Amount Type
   drop-down list, select the type of price or commission to which
   you want to apply the Price Adjustment.  Make your selection
   from: Discount, Markdown,
   Markup, Unit Cost,
   Unit Price, or Commission.
3. From the Break Type
   drop-down list, select from either Quantity
   or Amount. This determines the matrix
   that VISUAL will adjust.  If you select Quantity, VISUAL
   only adjusts Quantity Break Type matrix values, but will not adjust
   Amount Break Type values.
4. Click the Next
   button to continue.
5. From the Context drop-down
   list, select the condition for the price adjustment.  Make
   your selection from: Commodity, Customer, Customer/Part,
   Customer Type, Customer/Product,
   Customer Type/Product, Market,
   Market/Part, Part,
   Part Group, or Product.
   Your selection determines the ID selection in step 7.
6. Enter or select the
   identification code for the Currency you want to use. By default,
   VISUAL inserts your entity currency.  You can override the
   Currency ID by manually entering the value, or selecting it from
   the table by clicking the Browse button.
7. Enter or select the
   appropriate type, based on the selection you made in the Context
   field.  The possible adjustment types, based on the context
   include:

Commodity Code
- Applies to Commodity Code Context only.  Enter or select the
Commodity Code ID to which to apply the price adjustment.

Customer ID -
Applies to Customer, Customer/Part, and Customer/Product Contexts.
 Enter or select the Customer ID to whom the price adjustment
applies.

Ship-to ID - Applies
to Customer, Customer/Part, and Customer/Product Contexts. Enter or
select the identification code for the location where material will
be shipped. This allows you to have different formulas applied to
different locations, even for the same customer.

Part ID - Applies
to Customer/Part, Market/Part, and Part contexts.  Enter or select
the identification code for the part to which the price adjustment
applies.

Customer Type
- Applies to Customer Type and Customer Type/Product contexts.  Enter
or select the identification code for the type of customer to which
you want to apply the price adjustment.

Product Code -
Applies to Customer/Product, Customer Type/Product, and Product contexts.
Enter or select the identification code for the Product Code to which
to apply the price adjustment.

Market ID - Applies
to Market and Market/Part contexts.  Enter or select the identification
code for the Market to which you want to apply the price adjustment.

Part Group ID
- Applies to Part Group context only.  Enter or select the identification
code for the Part Group to which you want to apply the price adjustment.

You can enter the values manually or select
them from their respective browse tables by clicking the associated
Browse buttons.

8. Click the Next
   button to continue.
9. From the Type drop-down
   list, select whether the price adjustment is a fixed amount or
   a percent. This determines the way that VISUAL adjusts the matrix
   values.
10. In the Value field,
    enter the adjustment amount or percentage. If the price adjustment
    is a decrease in price, enter a negative Value. For increases,
    you do not need to put the + in the field.
11. Click the Finish
    button to apply the Price Adjustment to VISUAL Price Book.  Price
    adjustments do not affect the quantity/amount break.

VISUAL updates the Price information for
the Context IDs and returns to the first screen in the Wizard.  To
create another Price Adjustment, repeat steps 1 through 11.  To
exit the Price Adjustment wizard, click the Cancel button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Price_Book.md) User-defined Help