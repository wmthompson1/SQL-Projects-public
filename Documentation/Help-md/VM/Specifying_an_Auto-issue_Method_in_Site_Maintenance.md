Specifying an Auto-issue Method in Site Maintenance




# Specifying an Auto-issue Method in Site Maintenance

1. Select Admin, Site Maintenance.
2. In the Entity ID field,
   select the parent entity of the site for which you are specifying
   the auto-issue setting.
3. In the Site ID field,
   select the site.
4. Click the Defaults
   tab.
5. In the Auto Issue Method
   section, click one of these options:

Based on Operation Qty
Complete Click this option to auto-issue material requirements
incrementally based on the quantity or percent complete on each labor
ticket. For example, presume that the operation is for a quantity
of 5 and the Qty Per for the material requirement is 1. If a quantity
of 2 is completed on a labor ticket, then 2 units of the material
requirement are issued (presuming that there is no fixed scrap or
deviated quantity). If an operation is closed before all quantities
are completed, then the material requirement is also closed short.

Based on the Full Requirement
Qty on First Labor Ticket Click this option to auto-issue
the full material requirement quantity after the first labor ticket
is reported for the operation. If you backflush labor without creating
labor tickets, then the full material requirement is issued after
the first backflush quantity.

Depending on how you set up Preferences
Maintenance, the issued quantity can include fixed scrap and extra
materials for deviated quantities that are reported on the first labor
ticket.

If a labor ticket has already been created
for the operation or a quantity has already been backflushed, then
additional material is not issued. For example, if you created a labor
ticket for an operation and then increased the quantity of the material
requirement, the additional requirement will not be issued.

Note: If operations
are in process when you select this auto-issue method, additional
materials are not issued to any in-process operation. To complete
material issues for in-process operations, you must manually issue
the materials.

Based on Full Remaining
Req Qty on Run Complete When you use this option, materials
are issued in proportion to the quantity or percent complete on the
operation until the Run Complete labor ticket is saved to the operation.
When the Run Complete labor ticket is saved, all remaining material
requirements are issued to the operation, even if the operation is
closed short. If you backflush labor during the shipment of customer
orders, then the full remaining quantity of a material requirement
is issued when the full quantity of the order line has been shipped
or when the line is closed short.

Depending on how you set up Preferences
Maintenance, this quantity can include fixed scrap and extra materials
for deviated quantities.

7. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Auto-issue_Parts.md)
Auto-issue Parts