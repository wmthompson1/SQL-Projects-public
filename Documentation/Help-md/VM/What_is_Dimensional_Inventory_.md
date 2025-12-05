What is Dimensional Inventory?




# What is Dimensional Inventory?

Dimensional Inventory is an optional module that provides
an additional level of visibility into the quantity and location of
inventory items in the shop. Instead of seeing just the total quantity
of the item, you have the ability to see the total quantity broken
down by its various dimensional sizes. Dimensional Inventory also
gives you the ability to purchase and receive items, enter material
requirements, and issue, return, and adjust items by specifying the
number of pieces of material, what the dimensions of those pieces
are, and their location.

Dimensional Inventory can also perform a physical inventory by entering
the number of pieces and dimensions of those pieces. Dimensional Inventory
works with raw materials only. There is no support for Dimensional
Inventory in Customer Order Entry and Shipping Entry.

A typical example of Dimensional Inventory is the handling of raw
material like cold-rolled steel, which is stocked in pounds and measured
in terms of its cross-sectional shape and its length. In this case,
width and height determine the cross-sectional shape of angle iron;
the conversion of the shape using the length of the piece determines
its total cubic measure; the number of lengths in question determines
the total poundage.

For a simple example of Dimensional Inventory, consider a part described
as "Cold-rolled steel - 1in. Square." As the description
implies, the piece is always one inch square in shape, you stock it
in pounds, and you track it by its length in feet.

When ordered issued, its length and the number of lengths determine
the total inventory movement. A length of 1 foot of this material
is 3.4 pounds. If the user stocks 10 lengths of 12 feet each, in the
stock unit of measure there is 408 pounds.

Because the user cannot assign the lengths from the stock unit of
measure, it is always necessary to reference the part in terms of
its available pieces. This means you must conduct all inventory transactions
in terms of the piece and the quantity of that piece.

VISUAL supports a maximum of three dimensions and a minimum of one.
The dimensional unit of measure determines how to look up a conversion
factor from the units of the piece to the units in stock.

VISUAL is aware of a single dimension expression for all three elements
of a given piece. For example, if each dimension component is in inches,
then the combined dimension is cubic inches ("CUIN") in
VISUAL terms. If length is in feet, and width and height are in inches,
then the combined unit of measure would be something like square inch-feet,
or "SQIN-FT" in VISUAL terms. The latter example here is
a contrived unit of measure.
Because VISUAL supports private units conversion for each part, it
is entirely appropriate to invent a unit of measure like this and
put it to work. One very common contrived unit of measure is the "board
foot" in lumber measurement: 1 inch by 1 inch by 1 foot, nominal.
As long as the conversion factor in the unit of measure conversion
table forces the conversion from the stocking dimension to the piece-tracking
unit of measure, there should be no difficulty.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL does not support Dimensional Inventory for Inter Branch Transfers or Consignments. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Dimensional_Inventory.htm) User-defined Help