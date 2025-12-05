Preparing Quote Prices




# Preparing Quote Prices

To set price markups and calculate final pricing:

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site that contains the quote. If you are
   licensed to use a single site, this field is unavailable.
2. Select the appropriate
   line item from the line item table in the Estimating Window.
3. Click the Prices
   button. You can also select Quote Line Item
   Price from the Edit menu.

The Quote Price dialog box appears.

All Prices (not costs) are in terms of the
currency defined for the customer or prospect. The currency in use
appears on the left-hand side of the window, directly above the Markups
box.

The table at the top of the dialog has one
line for each quoted quantity.

3. Select a line item for
   which you want to set the markups.

Markups appear in the fields at the bottom
of the window. The markups that appear are always the markups that
apply to the selected line.

|  |  |
| --- | --- |
| POSTIT.gif | Before adjusting markups, always be sure to have the appropriate line selected. |

You can apply markups to each of five separate
cost categories: Purchased Material, Fabricated Material, Labor Cost,
Burden Cost, and Service Cost. For each category, there are three
markups:

GSA % - Specifies
your General Services Administration cost as a percentage of the Total
Cost shown in the Quote Costs dialog.

Markup % - Specifies
your price markup as a percentage of Total Cost plus GSA%.

Markup # - Specifies
an additional fixed markup dollar (or other currency) amount.

All markups are initially filled in from
the defaults stored in the Estimating section of Preferences Maintenance.
You can recall the default markups to the current line item at any
time by clicking on the Get Default Markups
button. If you want to save the current markups as the new defaults,
click the Save Markups as Default button.

4. Modify the markups as
   appropriate. Do this for each line item.
5. If you want to take
   quantity breaks into account, make sure Use qty breaks on purchases
   during recalc is selected.

This option is active by default when you
open the Quote Price dialog box.

6. To calculate unit prices,
   click the Recalc button.

The Quoted Unit Price is the price that
will actually appear on the quote to the prospect or customer. Any
time that Quoted Unit Price is zero, VISUAL fills it in automatically
after Recalc from Calculated Unit Price.

7. Select the Replace Quoted
   Unit Price During Recalc check box to replace the Quoted Unit
   Price with the newly calculated price automatically.

You are not restricted to the calculated
unit price; you can change Quoted Unit Price for each line item to
any value desired.

If quoting an inventory part to a current
customer, you may use Lookup Price to get any specially defined price
for this quantity and customer from Unit Prices by Customer.

|  |  |
| --- | --- |
| POSTIT.gif | If no price is defined for the customer/quantity/part combination, Lookup Price resets the Quoted Unit Price to 0. |

8. Specify the Trade Discount
   % for each line item.

VISUAL uses this value to set the discount
percent for a generated customer order. This discount is NOT immediately
applied to the Quoted Unit Price.

9. Specify the unit of
   measure by clicking in the U/M column and selecting one from the
   drop down box.
10. Set In Proforma for
    each line item by clicking on the In Proforma check box.

This indicates whether this quantity is
included if this quotation is part of a Proforma Report. You should
do this with care. In many cases, only one quantity will be ordered
you should select the In Proforma option for the most likely order
quantity. Leave the remaining line items unchecked. Failure to do
this could result in overestimates of revenue.

11. If appropriate, click
    the Determine Best Qtys button to automatically
    insert quoted quantities into the table.

VISUAL determines best quantities by taking
the union of all available purchase price breaks for quoted materials.

12. Click the Save
    button to save the Markups, Quoted Unit Price, Trade Discount,
    Unit of Measure, In Proforma fields.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_New_Quoted_Quantities.htm) Entering New Quoted Quantities