Costing Credit RMAs




# Costing Credit RMAs

These costing scenarios are used for Credit RMAs:

* Return to Original order,
  Ship from Original order

The credit memo is created against the original
order for the proper value, and the customer order line is left closed
so no new demand is created.

* Return to Original order,
  Ship to New order

This is the same as in the first scenario,
with the addition of a new customer order. The new order would not
be for any material, but for service charges, restocking fees, etc.
The new order can be applied to a different customer.

* Return to New order, Ship
  to New order

Use this scenario if the original customer
order is unavailable or if a different customer than the one who placed
the order should be credited for the return. The new customer order
would contain a Part ID, description and cost information (all possibly
copied from the original order) but for a quantity of zero parts.
It could also have additional fees added. The customer order line
should be closed so no demand is generated, even after the return.

This will allow the credit memo to be created
normally, getting the value from the customer order. If there is no
Part ID referenced on the new order then the parts are returned in
a manner similar to a miscellaneous shipment.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Return_Material_Authorization.md) User-defined Help