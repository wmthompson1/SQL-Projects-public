Costing Replace RMAs




# Costing Replace RMAs

These costing scenarios are used for Replace RMAs

* Return to Original order,
  Ship from Original order

The order line is reopened creating demand
for the reshipment. This case will not work for ship immediate replacements
because there is no way to indicate that an over-shipment is required
until the return is received.

* Return to Original order,
  Ship to New order

A new order is created for the replacement
material in addition to any other fees.

* Return to New order, Ship
  to New order

The new customer order would contain Part
ID, description and cost information (all possible copied from the
original order.) The quantity required would be zero for a normal
replacement, but for a ship immediate replacement the quantity would
have to be the number of parts being returned. It could also have
additional fees added. The customer order line should remain open
so demand is generated after the return. This will allow the credit
memo to be created normally, getting the value from the customer order.

* If there is no Part ID referenced
  on the new order then the parts are returned in a manner similar
  to a miscellaneous shipment.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Return_Material_Authorization.htm) User-defined Help