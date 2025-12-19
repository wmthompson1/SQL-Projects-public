Costing Repair RMAs




# Costing Repair RMAs

These two costing scenarios are used with Repair RMAs:

* Return to Original order,
  Ship from Original order

A new customer order line is created on
the original order for the repair work order, if a work order is created.
If the repair work order is created, then the returned parts are adjusted
into inventory at zero cost and issued directly to the repair work
order. To prevent the parts from generating costs, the part ID is
not used on the inventory transactions. No negative packlist is created
in the SHIPPER and SHIPPER\_LINE. The adjustment inventory transaction
stores the information regarding the receipt of the parts to repair.
No accounting entries have to take place because the parts are not
an asset to the manufacturer and not part of inventory.

* Return to New order, Ship
  to New order

A new customer order is created for the
repair work order. The same processing that occurs in scenario 1 occurs
in scenario 2, but the processing is against the new customer order
instead of the original customer order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Return_Material_Authorization.md) User-defined Help