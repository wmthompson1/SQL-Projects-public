Editing a Customer Order




# Editing a Customer Order

You can modify customer orders, except for those with
a Closed or Cancelled status. Unlike purchase orders, you can change
customer orders that have been shipped. You are NOT allowed to delete
lines for orders that have been shipped.

This complete level of modification provides maximum flexibility
in allowing you to correct customer orders. You should be very cautious
about changing a line item that has been shipped against. In most
cases, previously generated shippers and invoices are NOT updated
by changing the original order. You may need to work backwards to
make a correction.

For example, if you put the wrong Part ID on a line item, then ship
and invoice for it (but you ship the correct part physically) you
may need to delete the invoice and shipper, modify the order, and
recreate the shipper and invoice.

When you modify a released customer order, you may want to use the
Order Notes feature to provide an audit trail for the change.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site from which the customer is buying items.
   If you are licensed to use a single site, this field is unavailable.
2. Call the customer order
   you want to edit into the Customer Order window.
3. Make any changes to
   the customer order.

You can change most items in the header
and line items. For changes to line items that have been fully or
partially shipped, VISUAL warns you that you are changing a shipped
order.

The following notes apply to the modification of customer order
fields:

* Changing the ship date in
  the header or on a line item does not automatically update the
  work order want date. You must do this manually, using the Manufacturing
  Window.
* Changing the Sales Rep does
  not replace commission percentages on line items. Changing Sales
  Tax does not replace sales tax percentages on line items. These
  lines may have existing overrides, and must be manually updated,
  if necessary.
* Changing Customer ID or
  Discount Code does not update line item prices based on different
  unit prices or currencies that may exist between customers and
  discount codes. Use Re-price Lines Items in the Edit
  menu for these situations.
* Changing line item Quantity
  is only advised to adjust an unshipped quantity. For example,
  a customer may wish to add 50 more units to an existing line item
  with outstanding shipments, rather than create a new order. You
  may also change quantity to correct a data entry error, where
  the quantity shown is different than what was actually ordered.
  Changing to a quantity lower than that already shipped does NOT
  adjust inventory transactions or packing slips.
* You can change the Job ID.
  Changing to an nonexistence or blank Job ID allows you to create
  a new order for the line, or to change the link to a different
  work order.

|  |  |
| --- | --- |
| POSTIT.gif | Previously created orders still exist in the system, although they are no longer linked to this customer. |

* You can change the Part
  ID. You should never do this for a shipped line unless you are
  correcting a data entry error, where a different part was actually
  shipped.
* You can change Unit Price,
  Disc %, Comm %, Tax Group ID, Product Code, and Revenue Acct ID
  before you generate an invoice for the line item. Changing items
  that affect price and G/L accounts after invoice generation does
  not update any existing invoices.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Line_Items.htm)
Deleting Line Items

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help