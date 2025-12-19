Requiring the Use of Customer-specific Pricing at Shipment




# Requiring the Use of Customer-specific Pricing at Shipment

Use the Effectivity Date Price for Shipments field
on the Costing tab to specify whether customer-specific pricing must
be set up before you ship a part to a customer.

If you are licensed to use multiple sites, you can specify this
information at either the tenant level of the site level. Information
you specify at the site level overrides the information you specify
at the tenant level.

To specify this setting:

1. Select Inventory,
   Part Maintenance.
2. To specify the setting
   for a site, specify the ID of the site in the Site ID field. To
   specify the setting at the tenant level, specify \*\*Tenant\*\* in
   the Site ID field.
3. In the Part ID field,
   specify the part.
4. Click the Costing
   tab.
5. In the Effectivity Date
   Price for Shipments field, specify the action to take if a customer-specific
   price cannot be found for this part when a customer order is shipped.
   This field overrides the default setting specified in Application
   Global Maintenance. Specify one of these options.

Yes To prevent
the shipment of this part if a valid unit price cannot be found in
the Customer Pricing table for the date of shipment, specify Yes.
If you select this option, you must specify Shipments or Both in the
By Order/Ship Date column when you set up customer-specific pricing.

No To use the
unit price specified on the customer order line if no price exists
in the Customer Price table for the date of shipment, specify No.
Select this option to allow the customer order to be shipped even
if a customer price has not been defined.

Warn To display
a warning message if a valid price cannot be found in the Customer
Price table, specify Warn. You can use the Unit Price from the Customer
Order line to complete the shipment.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help