Consolidated Purchasing




# Consolidated Purchasing

You can order materials for different sites on the same purchase
order, provided that the sites belong to the same parent entity. These
purchase orders are consolidated purchase orders. You can use a consolidated
purchase order to reduce data entry time or to take advantage of better
price breaks.

Receive consolidated purchase orders on a site-by-site basis. For
example, if you create a consolidated purchase order with site MMC
on the first line and site MMC-NH on the second line, you would create
two separate receivers to completely receive the order. You would
create a receiver for MMC to receive the first line, and you would
create a receiver for MMC-NH to receive the second line.

Consolidated orders are invoiced on a site-by-site basis also.

## Accounting Periods

If you use consolidated purchasing, you should close accounting
periods for the sites that you use in the transactions on the same
schedule. This ensures consistency when posting each site.

## Creating a Consolidated Purchase Order

In a consolidated purchase order, the site ID you specify in the
header determines the parent entity for the order. On the lines, you
can specify any site ID that belongs to the same parent entity as
the site you specify in the header.

You can use the price breaks offered to the site ID you specify
in the header, or you can use the price breaks offered to the individual
sites in the lines. You can use the price breaks offered to the site
ID in the header for a portion of the order and the price breaks offered
to the individual sites in the lines for the remainder of the order.

To create a consolidated purchase order:

1. In the Site ID field,
   specify a site that belongs to the parent entity you want to use.
   When you insert lines in the purchase order, you can specify any
   site that belongs to the same parent entity as the site in the
   purchase order header.
2. Specify information
   on the purchase order header.
3. Determine the price
   breaks to use for the purchase order. To use the price breaks
   offered to the Site ID on the header for all lines on the purchase
   order, select the Price Breaks by Header Site
   check box, then insert all lines on the purchase order. You can
   also select the Price Breaks by Header Site
   check box after you enter all the lines.

To use the price breaks offered to the site
in the header for certain lines, select the Price
Breaks by Header Site check box. Insert all the lines that
should use the price breaks offered to the site in the header. Then,
clear the Price Breaks by Header Site check
box. Insert the additional lines. The lines that you insert when the
Price Breaks by Header Site check box is cleared will use the price
breaks offered to the site ID on the line. You can also manually specify
the unit price on these lines.

To use the price breaks offered to the sites
on the purchase order lines only or to manually specify the unit price
on each line, clear the Price Breaks by Header
Site check box. Insert the lines for the order.

4. Click the Save
   button.

## Repricing a Consolidated Purchase Order Line

After you enter a consolidated purchase order, you can change the
pricing of individual lines.

To remove the header site price breaks from a line:

1. Clear the Price
   Breaks by Header Site check box.
2. Click in Quantity field
   in the line to change and re-enter the quantity.
3. Tab out of the Quantity
   field.
4. You are prompted to
   accept the new price breaks. The price breaks for the site ID
   on the line are used. You can also manually enter a new unit price.
5. Click Save.

To change all lines on a purchase order to use the price breaks
on the purchase order header, select the Price
Breaks by Header Site check box after you enter all of the
lines. All lines in the order will use the price breaks offered to
the header site. If you want only certain lines to use the header
site price breaks, you can change the lines that should not use the
header price breaks using the procedure above.

## Receiving a Consolidated Purchase Order

When you receive a consolidated purchase order, you can receive
purchase order lines that match the site ID you specify on the Purchase
Receipt header. Consider this example:

Purchase Order Header Site ID: MMC

Purchase Order Line 1 Site ID: MMC

Purchase Order Line 2 Site ID: MMC-NH

If you select MMC on the Purchase Receipt header, you can only receive
items from line 1 of the purchase order. If you have not yet received
the items for site MMC-NH, you have these options when you save the
receiver:

Leave order open (partial
receipt, backorder balance) This leaves the order open awaiting
the remainder of the shipment. The purchase order does not close.

Copy remaining unreceived
lines to separate backorder This copies the remaining quantities
to a new purchase order with the same site ID as the original order.
The same Order ID is used, with the addition of a suffix consisting
of a dash and a digit. For example, if the purchase order ID is 4001,
the new Order IDs are 4001-1, 4001-2, etc. These are referred to as
back orders, and they are created so that the original order can be
closed. This is common when some line items are completely received,
and others are backordered by the vendor.

It is recognized that orders numbered in this
way are back orders, and they are retrieved. If possible, you should
avoid using a dash in your PO numbering scheme.

Close order (partial receipt,
no backorder) Select this option to close the order. No other
lines on the order can be received, regardless of the site.

If you select MMC-NH on the Purchase Receipt header, you can only
receive items from line 2 of the purchase order. You can close the
Purchase Order line associated with MMC-NH short, but you cannot close
the purchase order or create a backorder. Only the site specified
on the Purchase Order header can close an order or create a backorder.

## Costing Consolidated Purchase Orders

When you run costing for a site, only the purchase order lines associated
with the site are costed. You should close accounting periods for
the sites that you use in the transactions on the same schedule. This
ensures consistency when posting each site.

## Invoicing Consolidated Purchase Orders

When you create an invoice, you can only select purchase receipts
associated with the site ID you specify in the Invoice header. If
you browse for receipts by Purchase Order, the site ID on the purchase
order line determines which purchase orders are displayed in the browse.