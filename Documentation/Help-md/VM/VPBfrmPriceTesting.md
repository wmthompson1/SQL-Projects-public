Using Price Testing




# Using Price Testing

Price Testing within VISUAL Price Book allows you
to test and/or debug any formulas before creating an order in the
Order Management Window in Infor VISUAL. This allows you to verify
the prices of specific parts and quantities.

|  |  |
| --- | --- |
| POSTIT.gif | Any formula you want to test on the Price Testing window must have associated matrices set up throughout VISUAL Price Book. Calculations cannot be made without a formula. |

To verify VISUAL Price Book Prices through Price Testing:

1. With VISUAL Price Book
   open, double click the Price Testing
   icon in the navigation pane. The Price Testing window appears.
2. Enter or select the
   identification code for the Customer for whom you want to verify
   prices and formulas. You can enter the Customer ID manually or
   select it from the Customer table by clicking the Browse button.
   VISUAL populates any additional fields associated with the Customer
   ID.
3. You can override the
   default Ship-to, Currency, Market, Customer Type, and Sales Rep
   IDs associated with the Customer ID.
4. Enter or select the
   date on which you place the order. By default, VISUAL uses the
   current system date. You can override the date by manually typing
   in a new date in Windows system format, or clicking the Calendar button and selecting the date from
   the calendar that appears.

## Adding Information to the Price Test Table

After you select the Customer ID and set the additional
information on the header portion of the Price Test window, you can
populate the information on the table.  If you test a price formula
for customers/prices that do not have formulas and price matrices
assigned to them, VISUAL Price Book returns the default Unit Price
from VISUAL Manufacturing.  See your VISUAL Manufacturing Part
Maintenance documentation for additional information.

To test VISUAL Price Book Prices:

1. On the VISUAL Price
   Book main toolbar, click the Insert Row
   button.  VISUAL activates the next row on the table.
2. Enter or select a Part
   ID for which you want to test the Price calculation formula. You
   can enter the Part ID manually or select it from the table by
   double-clicking the column header.
3. Press Tab.  VISUAL
   inserts the Product Code and Commodity Code values, if applicable.
4. Click in the Qty column
   and enter the Quantity for which you want to test the formula
   calculation.
5. Press the TAB key. VISUAL
   calculates the unit price, based on the formula entered in the
   Formulas function of VISUAL Price Book and enters it in the Unit
   Price column. If there are additional variables assigned within
   the formula for the current Part ID, VISUAL populates any associated
   column, if applicable. The additional fields include:

Trade Discount
- This is a percentage discount based on values entered in the Discount
matrix and the percentage off the unit price. VISUAL makes this calculation
based on a formula that calls the appropriate Discount Matrix.

Part Group ID
- If the current part is a component of a Part Group, as defined in
Part Group Maintenance, VISUAL inserts the identification code for
the Part Group.

Price Group ID
If the current part is assigned to a price group, the ID is in the
Price Group ID column.

Amount - VISUAL
calculates the total cost for the Quantity and Unit Price, applying
any discounts specified in the Formula.

Commission - VISUAL
populates the Commission column through calculations of a formula
that calls the appropriate Commissions Matrix.

Price Formula
- VISUAL inserts the identification code for the Price Formula associated
with the current Part.  This allows you to easily go to the Formulas
window and make any changes to the specified formula.

Price Notes -
If there are any notes associated to the Price, as specified in the
Formulas function, VISUAL populates the Price Notes column with the
appropriate information.

Discount Formula ID
- VISUAL inserts the identification code for the Discount Formula
associated with the current part.

Discount Notes
- If there are any notes associated with the Discount, as specified
in the Formulas function, VISUAL inserts the information in the Discount
Notes column.

Commission Formula ID
- VISUAL inserts the identification code for the Commission Formula
associated with the current part.

Commission Notes
- If there are any notes associated with the Commission, as specified
in the Formulas function, VISUAL populates the Commission Notes column
with the information.

Part Tip - If
you specified any Part tips in the Formulas function, VISUAL inserts
the Tip in the Part Tip column.

Price Tip - If
you specified any Price tips in the Formulas function, VISUAL inserts
the Tip in the Price Tip column.

Discount Tip -
If you specified any Discount tips in the Formulas function, VISUAL
inserts the Tip in the Discount Tip column.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Price_Book.md) User-defined Help