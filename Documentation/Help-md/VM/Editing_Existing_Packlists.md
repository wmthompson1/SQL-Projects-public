Editing Existing Packlists




# Editing Existing Packlists

1. With the appropriate
   Customer Order ID and Packlist ID displaying in the Shipping Entry
   window, click the Edit button located
   underneath the line item table.

The Edit Packlist dialog box appears.

The Customer Order ID and Packlist ID appear
as read-only fields in the header section of the dialog box.

The order lines of the Customer Order ID
and the Packlist ID appear in the line item table.

2. Enter the date that
   you delivered the shipment in the Act Del Date
   field.
3. Modify FOB
   and Ship ViInfor VISUALmation as necessary.
4. From the Status list
   box, select a status for the packlist.

Shipped - VISUAL
creates a new packlist that has not yet been approved for invoicing.

1, 2, 3 (Review levels)
- These values have a user-defined meaning. By specifying who can
set various statuses using Application Global Maintenance security
features, you can create an approval workflow procedure.

Approved - When
VISUAL detects a packlist with this status, the invoice forms program
can generate an invoice for the packlist. Invoice generation ignores
packlists with other statuses other than A.

There is no status for Closed or Canceled.
VISUAL does not support canceled packlists. You may delete a packlist,
which causes VISUAL to remove all transactions that are part of that
packlist. VISUAL only allows you to delete packlists that you have
not already invoiced.

When you create a new packlist, VISUAL sets
a default status that the system administrator determines in Application
Global Maintenance. To institute a reviewing procedure, the administrator
should set the default status to S, 1, 2, or 3 (any value but A) and
assign specific permissions to users that have authority to set statuses.
To disable reviewing and prevent the need to approve invoices manually,
the administrator can set the default status to A.

When an existing invoice is voided or deleted,
VISUAL resets the Invoice ID, invoice date, and status of any related
packlists. The status is reset to the default value.

5. For each existing line
   item for a part, edit the following fields as appropriate

* Unit price
* Discount percent
* Actual freight
* Shipping weight
* Weight unit
  of measure
* Carton count
  and pallet count, if no pallet details exist.
* NMFC ID
* Package type
* Commission
  percent
* Sales tax
  Group ID
* G/L revenue
  Account ID
* Additional
  specifications

6. For each existing line
   item for a service charge, edit the following fields as appropriate.

* Quantity
* Shipping U/M
* Service charge
  ID
* Service charge
  miscellaneous reference

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help