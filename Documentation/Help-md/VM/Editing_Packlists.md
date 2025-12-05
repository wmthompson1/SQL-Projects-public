Editing Packlists




# Editing Packlists

In order edit a pack-list, it must contain a copy
of every editable data item, even though the pack-list does not inherit
all items on the customer order. For example, you cannot edit the
purchase order number at the pack-list level, so it is not copied
to the purchase order when a shipment occurs. If you enter new Ship
Qty values when an existing pack-list appears, a message such as "Packlist
2005 has already been shipped. Edit existing Pack-list?" appears.
Answering yes allows you to edit the pack-list. Answering no prompts
VISUAL to ask you if you want to create a new pack-list. You can edit
any existing pack-list that you have not already invoiced. After you
invoice a pack-list, its status is read-only. The following rules
apply to pack-list editing:

1. You can create a new
   pack-list header by allowing all service charge invoices. You
   must link (related) pack-lists that you add in this way to an
   existing customer order. You can edit other additional data items
   for this type of pack-list. You can change:

* Ship to address
* Shipped date

VISUAL detects if you can change the above
information by looking for lines having actual shipped parts on them
(non-null transaction IDs). If no lines are for shipped parts, you
can modify the above two items at any time before invoicing.

2. You can edit the following
   fields of header information in existing pack-lists:

* Ship time
* Delivery date
  and time
* Additional
  header specifications
* Free on board
  (FOB)
* Ship via
* Sales tax
  group ID

3. New line items that
   you add to a packlist header can be for service charges only,
   and you cannot add additional shipments to a packlist.
4. You can edit the following
   fields for existing line terms for parts (transacted shipments):

* Unit price
* Discount percent
* Actual freight
* Shipping weight
* Weight unit
  of measure
* Carton count
  and pallet count if no pallet details exist.
* NMFC ID
* Package type
* Commission
  percent
* Sales
  tax Group ID
* G/L
  revenue Account ID
* Additional
  specifications

5. You can edit the following
   fields for existing lines for service charges (non-transacted
   shipments):

* Quantity

Note that the user has access to USER\_SHIPPED\_QTY
but not SHIPPED\_QTY.

* Shipping U/M

Note that no attempt is made to convert
USER\_SHIPPED\_QTY using this unit of measure since no stock unit of
measure can exist for the line (i.e., no part is specified).

* Service charge
  ID

Service charge miscellaneous reference

## Packlist Status

The Status field controls when the packlist can be invoiced.

S

VISUAL creates a new packlist that has not yet been approved for
invoicing.

1, 2, 3 - Review levels.

These values have a user-defined meaning. By specifying who can
set various statuses using Application Global Maintenance security
features, you can create an approval workflow procedure.

A - Approved for invoicing.

When VISUAL detects a packlist with this status, the invoice forms
program can generate an invoice for the packlist. Invoice generation
ignores packlists with other statuses other than A.

There is no status for Closed or Canceled. VISUAL does not support
canceled packlists. You may delete a packlist, which causes VISUAL
to remove all transactions that are part of that packlist. VISUAL
only allows you to delete packlists that you have not already invoiced.

When you create a new packlist, VISUAL sets a default status that
the system administrator determines in Application Global Maintenance.
To institute a reviewing procedure, the administrator should set the
default status to S, 1, 2, or 3 (any value but A) and assign specific
permissions to users that have authority to set statuses. To disable
reviewing and prevent the need to approve invoices manually, the administrator
can set the default status to A. Note that when statuses are changed
manually, the User ID making the change is recorded in STATUS\_USER\_ID
in the packlist header.

When an existing invoice is voided or deleted, VISUAL resets the
invoice ID, invoice date, and status of any related packlists. The
status is reset to the default value.

## User Defined Fields

The user-defined fields related to the part on each line item are
in read-only mode during editing. Even though the default mode of
display is hidden, you can reconfigure the line item table to show
any of the user-defined fields.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help