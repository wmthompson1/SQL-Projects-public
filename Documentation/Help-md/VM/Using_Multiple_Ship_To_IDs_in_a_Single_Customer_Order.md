Using Multiple Ship To IDs in a Single Customer Order




# Using Multiple Ship To IDs in a Single Customer Order

You can ship varying quantities on different dates
and specify various ShipTo IDs within the same order by using alphanumeric
ShipTo IDs as alternate indexes to the shipping address tables. This
alphanumeric ID makes EDI translations much easier by eliminating
the need for two external cross reference tables in EDI maps, one
for inbound orders and one for outbound ASN transactions. Unique alphanumeric
IDs also make it easier for VISUAL users who sell to companies that
have over a thousand stores and warehouses by allowing you to assign
a different alpha-numeric ID to each location.

The use of ShipTo IDs is optional.

## Entering Multiple Ship-To IDs in a Single Customer Order

If you specify a Ship-To ID in the order header or order line, it
does not appear anywhere in the shipping window. Ship-To IDs are for
your information only.

## Entering Ship-To IDs for line items:

1. Scroll through the Shipping
   Entry line item table until you reach the Ship-To ID column.
2. Double click the column
   header.

A Shipping Addresses dialog box appears.

This table is for viewing and selecting
Ship-To IDs only. You must make new entries in Customer Order Entry.
See Customer Order Entry for more information.

3. Select the appropriate
   Ship-To ID from the list and click OK.

The alpha-numeric ID appears in the Ship-To
ID column.

4. Click Save.

If the order you want to ship has more than
one Ship-To ID, VISUAL asks you if you want to ship the order by creating
multiple packlists.

If you select Yes,
VISUAL creates the number of packlists necessary to fulfill your shipping
requirements. In the Packlist field, you can see the newly-created
Packlist IDs appear as VISUAL ships them.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help