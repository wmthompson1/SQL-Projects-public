Working With Existing Packlists




# Working With Existing Packlists

Packlists show most of the important information for
a customer order/shipment, including Customer Name and Address, Order/Invoice/Shipping
Method and Terms, Order and Line Specs, Line Item Parts, Descriptions,
Quantities, Freight, and Taxes. User-defined fields for the customer,
set up in Customer Maintenance, are also passed to this report.

## Viewing an Existing Packlist

If you are licensed to use multiple sites, click the Site ID drop-down
arrow and select the site in which you placed the order. If you use
a single site, this field is unavailable.

Click the Order ID browse button and select the appropriate customer
order. enter the Packlist ID, or click the Packlist
ID button and select a packlist from the Packlists table.

If the Auto Backorder Selection Mode option
from the Options menu is currently selected, VISUAL selects backorders
based on the customer Order ID. If you enter an Order ID for a closed
order that has backorders, VISUAL selects the first open backorder
associated with that order.

For example, if order 2005 was partially shipped, and the backorder
option was selected (see below), then VISUAL closes 2005 and creates
and releases 2005-1. If Auto Backorder Selection Mode is enabled,
entering 2005 for the Order ID automatically calls up 2005-1.

If you selected Show Backlog Only in the
Options menu, shipped lines do not appear
in the line item table. For each line that does show in the table,
Qty Shipped shows the total amount shipped, Ship Qty is 0, and Warehouse/Location
defaults as described in "Shipping Items for a Customer Order."
The table does NOT show the quantities shipped or warehouse/locations
shipped from for the Packlist ID. This means you cannot use this window
as a viewer for the selected packlist. Use the Print Packlist command
to do this.

There are several reasons you may wish to call up an existing packlist:

* To print, view or file the
  packlist.

The Print Current Packlist option from the
Print Packlist dialog box allows you to print and view the currently
selected packlist and to store in the text format.

* As an alternate method of
  specifying the Customer Order ID.

By specifying Packlist ID, or selecting from
the Packlists table, VISUAL automatically fills in the Order ID. This
is convenient if you know a previous ship date, because you can search
the Packlists table by date.

* To delete a packlist.

You can delete a bad packlist by calling it
up and clicking on the Delete button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_Packlists.md)
Editing Packlists

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Packlists.md)
Deleting Packlists

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help