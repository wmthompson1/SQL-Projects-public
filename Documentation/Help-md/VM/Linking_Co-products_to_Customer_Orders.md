Linking Co-products to Customer Orders




# Linking Co-products to Customer Orders

Customer order line items refer to work orders. The
part number on the line item may be any part number from the work
order, the main part or any of the co-products.

When the system examines the co-product list to determine whether
the user is connecting the line item to an already defined co-product
it compares the part ID of the line item with the part ID of the order
header and each part ID in the co-product list. Only one of these
parts may be unnumbered or an ambiguity exists and the system will
be unable to tell if the user is creating a new reference. Further,
the receiving and shipping process must be able to unambiguously find
the part being received.

Use [Customer Order Entry](VMORDENTWhat.md) to link
co-products to work orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help